package checker

import "time"

type Domains struct {
	Id            int64
	Uuid          string
	Domain        string
	Grade         string
	Error         string
	Ip            string
	StatusCode    int
	LastSuccess   time.Time
	ValidFrom     time.Time
	ValidUntil    time.Time
	Issuer        string
	Active        bool
	ForceRedirect bool
}

func (d *Domains) TableName() string {
	return "domains"
}
