package models

import (
	"github.com/astaxie/beego/orm"
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

func NewUser(uname, email, location, website, avatar, pd string) *User {

	return &User{
		Username:       uname,
		Email:          email,
		Location:       location,
		Website:        website,
		Avatar:         avatar,
		PasswordDigest: pd,
		Created:        time.Now(),
		Updated:        time.Now(),
	}

}

func CreateUser(user *User) (*User, error) {
	o := orm.NewOrm()
	id, e := o.Insert(user)
	if e != nil {
		return nil, e
	}

	return user, nil
}

func DeleteUser(user *User) error {
	o := orm.NewOrm()
	id, e := o.Delete(user)
	if e != nil {
		return e
	}
	return nil
}

func UpdateUser(user *User,
	uname, email, location, website string) (*User, error) {
	o := orm.NewOrm()
	user.Username = uname
	user.Email = email
	user.Location = location
	user.Website = website
	id, e := o.Update(user)
	if e != nil {
		return nil, e
	}

	return user, nil
}

func (u User) IsAdmin() bool {
	return u.IsAdmin
}
