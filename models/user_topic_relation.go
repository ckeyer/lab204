package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type UserTopicRelation struct {
	Id         int64
	UserId     int64
	TopicId    int64
	ActionType string
	Created    time.Time
	Updated    time.Time
}
