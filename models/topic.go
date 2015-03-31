package models

import (
	"time"
)

type Topic struct {
	Id      int64
	Content string
	Created time.Time
	Updated time.Time
}
