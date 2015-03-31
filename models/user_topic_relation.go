package models

type UserTopicRelation struct {
	Id         int64
	UserId     int64
	TopicId    int64
	ActionType string
}
