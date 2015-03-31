package models

import (
	"time"
)

type Comment struct {
	Id      int64
	Content string
	TopicId int64
	Created time.Time
	Updated time.Time
}
