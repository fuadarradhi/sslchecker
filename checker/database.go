package checker

import (
	"strings"

	"xorm.io/xorm"
)

var db *xorm.Engine

func getDomains(domain ...string) (domains []*Domains, err error) {
	var d = []*Domains{}
	if len(domain) > 0 {
		err = db.SQL(`
		SELECT d.*, s.ip FROM domains d 
		LEFT JOIN server s ON s.id = d.server_id
		WHERE domain in (?)`, strings.Join(domain, ","),
		).Find(&d)
	} else {
		err = db.SQL(`
		SELECT d.*, s.ip FROM domains d 
		LEFT JOIN server s ON s.id = d.server_id
		WHERE d.active = 1 AND s.active = 1
		AND (d.last_success + INTERVAL 12 HOUR < NOW() OR d.last_success IS NULL)`,
		).Find(&d)
	}

	return d, err
}

func updateStatus(d *Domains) error {
	_, err := db.Where("id = ?", d.Id).
		Cols("grade", "error", "status_code", "last_success",
			"valid_from", "valid_until", "issuer", "force_redirect").
		Update(d)

	return err
}
