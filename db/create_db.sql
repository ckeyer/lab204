set character_set_client=utf8;
set character_set_connection=utf8;
set character_set_database=utf8;
set character_set_results=utf8;
set character_set_server=utf8;


CREATE database db_lab204 CHARACTER SET utf8 collate utf8_general_ci;

DROP TABLE IF EXISTS 'tb_user';
CREATE TABLE tb_user
(
	Id    NUMBER(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,,
	Username       varchar(32),
	IsAdmin        int(2),
	Email          varchar(64),
	Location       varchar(64),
	Website        varchar(64),
	Avatar         varchar(32),
	PasswordDigest varchar(32),
	Created        datetime,
	Updated        datetime,
)ENGINE=InnoDB  AUTO_INCREMENT = 10000 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS 'tb_topic';
CREATE TABLE tb_topic
(
	Id     int(64),
	Content varchar(256),
	Created datetime,
	Updated datetime,
)

DROP TABLE IF EXISTS 'tb_comment';
CREATE TABLE tb_comment
(
	Id      int(64),
	Content text,
	TopicId int(64),
	Created datetime,
	Updated datetime,
)

DROP TABLE IF EXISTS 'tb_comment';
CREATE TABLE tb_comment
(
	Id      int(64),
	Content text,
	TopicId int(64),
	Created datetime,
	Updated datetime,
)

DROP TABLE IF EXISTS 'tb_user_topic_relation';
CREATE TABLE tb_user_topic_relation
(
	Id        int(64),
	UserId     int(64),
	TopicId   int(64),
	ActionType varchar(16),
	Created datetime,
	Updated datetime,
)