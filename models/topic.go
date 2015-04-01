package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type Topic struct {
	Id      int64
	Content string
	Created time.Time
	Updated time.Time
}
