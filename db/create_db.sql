-- set character_set_client=utf8;
-- set character_set_connection=utf8;
-- set character_set_database=utf8;
-- set character_set_results=utf8;
-- set character_set_server=utf8;

CREATE database db_lab204 CHARACTER SET utf8 collate utf8_general_ci;

---- ----------------------------------
---- ===== 1. tb_user 
---- ----------------------------------
DROP TABLE IF EXISTS 'tb_user';
CREATE TABLE tb_user
(
	Id    NUMBER(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,,
	Username       varchar(32)  NOT NULL,
	IsAdmin        tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '用户状态',
	Email          varchar(64),
	Location       varchar(64),
	Website        varchar(64),
	Avatar         varchar(32) ,
	PasswordDigest varchar(64) ,
	Created        datetime DEFAULT NULL,
	Updated        datetime DEFAULT NULL,
	KEY `idx_user_username`(`Username`),
	KEY `idx_user_email`(`Email`)
) ENGINE=InnoDB  AUTO_INCREMENT = 10000 DEFAULT CHARSET=utf8;

DROP TRIGGER IF EXISTS tg_insert_user_crtime;
DELIMITER $$
create trigger tg_insert_user_crtime before insert on tb_user
FOR EACH ROW
BEGIN
set NEW.Created =NOW();
set NEW.Updated =NOW();
 END$$
DELIMITER ;

DROP TRIGGER IF EXISTS tg_update_user;
create trigger tg_update_user before update on tb_user
FOR EACH ROW
set NEW.Updated =NOW();
----=====  tb_user =====----

---- ----------------------------------
---- ===== 2. tb_topic 
---- ----------------------------------
DROP TABLE IF EXISTS 'tb_topic';
CREATE TABLE tb_topic
(
	Id        NUMBER(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Content varchar(256),
	Created        datetime DEFAULT NULL,
	Updated        datetime DEFAULT NULL
) ENGINE=InnoDB  AUTO_INCREMENT = 10000 DEFAULT CHARSET=utf8;

DROP TRIGGER IF EXISTS tg_insert_topic_crtime;
DELIMITER $$
create trigger tg_insert_topic_crtime before insert on tb_topic
FOR EACH ROW
BEGIN
set NEW.Created =NOW();
set NEW.Updated =NOW();
 END$$
DELIMITER ;

DROP TRIGGER IF EXISTS tg_update_topic;
create trigger tg_update_topic before update on tb_topic
FOR EACH ROW
set NEW.Updated =NOW();
----=====  tb_topic =====----

---- ----------------------------------
---- ===== 3. tb_comment 
---- ----------------------------------
DROP TABLE IF EXISTS 'tb_comment';
CREATE TABLE tb_comment
(
	Id      NUMBER(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Content  text,
	TopicId  NUMBER(12),
	Created        datetime DEFAULT NULL,
	Updated        datetime DEFAULT NULL,
	FOREIGN KEY(TopicId) references tb_topic(Id)
) ENGINE=InnoDB  AUTO_INCREMENT = 10000 DEFAULT CHARSET=utf8;

DROP TRIGGER IF EXISTS tg_insert_comment_crtime;
DELIMITER $$
create trigger tg_insert_comment_crtime before insert on tb_comment
FOR EACH ROW
BEGIN
set NEW.Created =NOW();
set NEW.Updated =NOW();
 END$$
DELIMITER ;

DROP TRIGGER IF EXISTS tg_update_comment;
create trigger tg_update_comment before update on tb_comment
FOR EACH ROW
set NEW.Updated =NOW();
----=====  tb_comment =====----

---- ----------------------------------
---- ===== 4. tb_user_topic_relation 
---- ----------------------------------
DROP TABLE IF EXISTS 'tb_user_topic_relation';
CREATE TABLE tb_user_topic_relation
(
	Id       NUMBER(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	UserId     NUMBER(12),
	TopicId   NUMBER(12),
	ActionType varchar(16),
	Created        datetime DEFAULT NULL,
	Updated        datetime DEFAULT NULL,
	FOREIGN KEY(UserId) references tb_user(Id),
	FOREIGN KEY(TopicId) references tb_topic(Id)
) ENGINE=InnoDB  AUTO_INCREMENT = 10000 DEFAULT CHARSET=utf8;

DROP TRIGGER IF EXISTS tg_insert_ut_relation_crtime;
DELIMITER $$
create trigger tg_insert_ut_relation_crtime before insert on tb_user_topic_relation
FOR EACH ROW
BEGIN
set NEW.Created =NOW();
set NEW.Updated =NOW();
 END$$
DELIMITER ;

DROP TRIGGER IF EXISTS tg_update_ut_relation;
create trigger tg_update_ut_relation before update on tb_user_topic_relation
FOR EACH ROW
set NEW.Updated =NOW();
----=====  tb_user_topic_relation =====----



