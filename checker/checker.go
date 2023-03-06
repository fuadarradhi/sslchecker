package checker

import (
	"fmt"
	"log"
	"net"
	"net/http"
	"os"
	"time"

	"github.com/essentialkaos/sslscan/v13"
	_ "github.com/go-sql-driver/mysql"

	"github.com/joho/godotenv"
	"xorm.io/xorm"
)

var (
	DATABASE = "DATABASE"

	errNotResolve = "domain not resolve"
	errIpNotSame  = "ip on the server and in the database is not the same"
)

func CheckAllSSL(domain ...string) {

	var err error

	err = godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	db, err = xorm.NewEngine("mysql", os.Getenv(DATABASE))
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	api, _ := sslscan.NewAPI("SSLScanTester", "2.1.0")
	api.RequestTimeout = 5 * time.Second

	domains, err := getDomains(domain...)
	if err != nil {
		log.Fatal(err)
	}

	for _, d := range domains {

		fmt.Println("Check for domain :", d.Domain)
		ips, _ := net.LookupIP(d.Domain)
		ipfound := false
		ipaddr := ""

		for _, ip := range ips {
			if ipv4 := ip.To4(); ipv4 != nil {
				ipfound = true
				ipaddr = ipv4.String()
			}
		}

		if !ipfound {
			d.StatusCode = http.StatusNotFound
			d.Error = errNotResolve
			err := updateStatus(d)
			if err != nil {
				log.Println(err)
			}
			continue
		}

		if ipaddr != d.Ip {
			d.StatusCode = http.StatusPreconditionFailed
			d.Error = errIpNotSame
			d.Active = false
			err := updateStatus(d)
			if err != nil {
				log.Println(err)
			}
			continue
		}

		// coba akses dengan http
		// jika berhasil, kemungkinan force https tidak aktif
		resp, err := http.Get("http://" + d.Domain)
		if err != nil {
			d.StatusCode = 500
			d.Error = err.Error()

			err = updateStatus(d)
			if err != nil {
				log.Println(err)
			}
			continue
		}
		resp.Body.Close()

		// jika tls nil, artinya akses ke http berhasil
		// jadi perlu cek sekali lagi ke https
		if resp.TLS == nil {
			d.ForceRedirect = false
			resp, err = http.Get("https://" + d.Domain)
			if err != nil {
				d.StatusCode = 500
				d.Error = err.Error()

				err = updateStatus(d)
				if err != nil {
					log.Println(err)
				}
				continue
			}
			resp.Body.Close()
		}

		// simpan status code untuk memudah tracing
		d.StatusCode = resp.StatusCode
		if d.StatusCode != 200 {
			d.Error = http.StatusText(d.StatusCode)
		} else {
			d.Error = ""
		}
		err = updateStatus(d)
		if err != nil {
			log.Println(err)
		}

		// start ssllabs scanner
		progress, err := api.Analyze(d.Domain, sslscan.AnalyzeParams{
			StartNew:  true,
			FromCache: false,
		})
		if err != nil {
			log.Println(err)
			continue
		}

		var info *sslscan.AnalyzeInfo
		for range time.NewTicker(5 * time.Second).C {
			info, err = progress.Info(false, false)

			// jika error saat membaca progress,
			// batalkan check untuk domain ini
			if err != nil {
				d.Error = err.Error()
				err := updateStatus(d)
				if err != nil {
					log.Println(err)
				}
				break
			}

			// jika status error,
			// batalkan check untuk domain ini
			if err != nil || info.Status == sslscan.STATUS_ERROR {
				d.Error = info.StatusMessage
				err := updateStatus(d)
				if err != nil {
					log.Println(err)
				}
				break
			}

			// jika success, update data di database
			if info.Status == sslscan.STATUS_READY {
				detailinfo := info.Endpoints[0]
				d.Grade = detailinfo.Grade
				d.LastSuccess = time.Now()
				d.Error = ""

				fullInfo, err := progress.Info(true, true)
				if err == nil {
					certs := fullInfo.Certs[0]
					d.Issuer = certs.IssuerSubject
					d.ValidFrom = time.UnixMilli(certs.NotBefore)
					d.ValidUntil = time.UnixMilli(certs.NotAfter)
				}

				err = updateStatus(d)
				if err != nil {
					log.Println(err)
				}
				break
			}
		}

		time.Sleep(5 * time.Second)
	}
}
