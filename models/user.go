package models

import (
	"time"
)

type User struct {
	Id             int64
	Username       string
	IsAdmin        bool
	Email          string
	Location       string
	Website        string
	Avatar         string
	PasswordDigest string
	Created        time.Time
	Updated        time.Time
}

func (u User) IsAdmin() bool {
	return u.IsAdmin
}
