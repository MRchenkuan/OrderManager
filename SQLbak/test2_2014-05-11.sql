# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.17)
# Database: test2
# Generation Time: 2014-05-11 07:36:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_message`;

CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_650f49a6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add permission',1,'add_permission'),
	(2,'Can change permission',1,'change_permission'),
	(3,'Can delete permission',1,'delete_permission'),
	(4,'Can add group',2,'add_group'),
	(5,'Can change group',2,'change_group'),
	(6,'Can delete group',2,'delete_group'),
	(7,'Can add user',3,'add_user'),
	(8,'Can change user',3,'change_user'),
	(9,'Can delete user',3,'delete_user'),
	(10,'Can add message',4,'add_message'),
	(11,'Can change message',4,'change_message'),
	(12,'Can delete message',4,'delete_message'),
	(13,'Can add content type',5,'add_contenttype'),
	(14,'Can change content type',5,'change_contenttype'),
	(15,'Can delete content type',5,'delete_contenttype'),
	(16,'Can add session',6,'add_session'),
	(17,'Can change session',6,'change_session'),
	(18,'Can delete session',6,'delete_session'),
	(19,'Can add site',7,'add_site'),
	(20,'Can change site',7,'change_site'),
	(21,'Can delete site',7,'delete_site'),
	(22,'Can add custom',8,'add_custom'),
	(23,'Can change custom',8,'change_custom'),
	(24,'Can delete custom',8,'delete_custom'),
	(25,'Can add order',9,'add_order'),
	(26,'Can change order',9,'change_order'),
	(27,'Can delete order',9,'delete_order'),
	(28,'Can add orde r_ detail',10,'add_order_detail'),
	(29,'Can change orde r_ detail',10,'change_order_detail'),
	(30,'Can delete orde r_ detail',10,'delete_order_detail'),
	(31,'Can add log entry',11,'add_logentry'),
	(32,'Can change log entry',11,'change_logentry'),
	(33,'Can delete log entry',11,'delete_logentry'),
	(34,'Can add ite m_type',12,'add_item_type'),
	(35,'Can change ite m_type',12,'change_item_type'),
	(36,'Can delete ite m_type',12,'delete_item_type'),
	(37,'Can add orde r_owner',13,'add_order_owner'),
	(38,'Can change orde r_owner',13,'change_order_owner'),
	(39,'Can delete orde r_owner',13,'delete_order_owner'),
	(40,'Can add ms g_board',14,'add_msg_board'),
	(41,'Can change ms g_board',14,'change_msg_board'),
	(42,'Can delete ms g_board',14,'delete_msg_board'),
	(43,'Can add st d_ item',15,'add_std_item'),
	(44,'Can change st d_ item',15,'change_std_item'),
	(45,'Can delete st d_ item',15,'delete_std_item'),
	(49,'Can add st d_goodsinfo',17,'add_std_goodsinfo'),
	(50,'Can change st d_goodsinfo',17,'change_std_goodsinfo'),
	(51,'Can delete st d_goodsinfo',17,'delete_std_goodsinfo'),
	(52,'Can add st d_price',18,'add_std_price'),
	(53,'Can change st d_price',18,'change_std_price'),
	(54,'Can delete st d_price',18,'delete_std_price'),
	(55,'Can add st d_storage',19,'add_std_storage'),
	(56,'Can change st d_storage',19,'change_std_storage'),
	(57,'Can delete st d_storage',19,'delete_std_storage'),
	(58,'Can add im g_owner',20,'add_img_owner'),
	(59,'Can change im g_owner',20,'change_img_owner'),
	(60,'Can delete im g_owner',20,'delete_img_owner');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`)
VALUES
	(1,'admin','','','393667111@qq.com','sha1$327f4$1ebc00955d26f3a1998c8884a642c9a5057e37eb',1,1,1,'2014-03-31 20:05:42','2014-02-03 21:31:17'),
	(2,'a','','','','sha1$6ebaa$54546296e7f270d90c207aaa2ad9d72636c72b12',1,1,0,'2014-02-03 21:34:16','2014-02-03 21:34:16'),
	(3,'b','','','','sha1$0dc42$4de71d65b29a75d9e52c58cbcdd7e4cc080f1fa3',1,1,0,'2014-02-03 21:35:33','2014-02-03 21:35:33');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`)
VALUES
	(1,2,22),
	(2,2,23),
	(3,2,24),
	(4,2,25),
	(5,2,26),
	(6,2,27),
	(7,2,28),
	(8,2,29),
	(9,2,30),
	(10,3,22),
	(11,3,23),
	(12,3,24),
	(13,3,25),
	(14,3,26),
	(15,3,27),
	(16,3,28),
	(17,3,29),
	(18,3,30);

/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`)
VALUES
	(1,'2014-02-03 21:32:12',1,8,'1','张三 12312311111',1,''),
	(2,'2014-02-03 21:34:16',1,3,'2','a',1,''),
	(3,'2014-02-03 21:35:16',1,3,'2','a',2,'已修改 is_staff 和 user_permissions 。'),
	(4,'2014-02-03 21:35:33',1,3,'3','b',1,''),
	(5,'2014-02-03 21:35:58',1,3,'3','b',2,'已修改 is_staff 和 user_permissions 。'),
	(6,'2014-02-03 21:36:24',1,7,'2','site1',1,''),
	(7,'2014-02-03 21:42:51',1,9,'1','张三 12312311111 1 0',1,''),
	(8,'2014-02-03 21:43:21',1,10,'1','张三 12312311111 1 0 1 1',1,''),
	(9,'2014-02-04 17:22:32',1,12,'1','1 床',1,''),
	(10,'2014-02-04 17:22:47',1,12,'2','2 沙发',1,''),
	(11,'2014-02-04 17:22:55',1,12,'3','3 柜子',1,''),
	(12,'2014-02-04 17:24:36',1,12,'3','03 柜子',2,'已修改 tpye_code 。'),
	(13,'2014-02-04 17:25:48',1,12,'4','04 桌子',1,''),
	(14,'2014-02-05 10:37:19',1,12,'5','05 椅子',1,''),
	(15,'2014-02-05 10:37:36',1,12,'6','06 散件',1,''),
	(16,'2014-02-06 20:40:08',1,12,'7','07 床垫',1,''),
	(17,'2014-02-06 20:43:13',1,12,'8','08 梳妆台',1,''),
	(18,'2014-02-06 21:43:18',1,9,'22','22',3,''),
	(19,'2014-02-06 21:43:18',1,9,'3','3',3,''),
	(20,'2014-02-06 21:43:18',1,9,'2','2',3,''),
	(21,'2014-02-06 21:43:18',1,9,'1','1',3,''),
	(22,'2014-02-06 21:44:15',1,8,'6','李四',3,''),
	(23,'2014-02-06 21:44:15',1,8,'5','李四',3,''),
	(24,'2014-02-06 21:44:15',1,8,'4','李四',3,''),
	(25,'2014-02-06 21:44:15',1,8,'3','李四',3,''),
	(26,'2014-02-06 21:44:15',1,8,'2','张三',3,''),
	(27,'2014-02-06 21:44:15',1,8,'1','张三',3,''),
	(28,'2014-02-06 21:44:32',1,8,'18','路人甲',3,''),
	(29,'2014-02-06 21:46:02',1,8,'33','顾客一',3,''),
	(30,'2014-02-06 21:46:02',1,8,'32','一粒蛋•撸疯',3,''),
	(31,'2014-02-06 21:46:02',1,8,'31','陈斯立',3,''),
	(32,'2014-02-06 21:46:02',1,8,'30','陈斯立',3,''),
	(33,'2014-02-06 21:46:02',1,8,'29','神兽',3,''),
	(34,'2014-02-06 21:46:03',1,8,'28','陈斯立',3,''),
	(35,'2014-02-06 21:46:03',1,8,'27','小明',3,''),
	(36,'2014-02-06 21:46:03',1,8,'21','周五正',3,''),
	(37,'2014-02-06 21:46:03',1,8,'20','赵钱孙',3,''),
	(38,'2014-02-06 21:46:03',1,8,'19','路人乙',3,''),
	(39,'2014-02-06 21:46:03',1,8,'17','路人甲',3,''),
	(40,'2014-02-06 21:46:03',1,8,'16','路人甲',3,''),
	(41,'2014-02-06 21:46:03',1,8,'15','王五',3,''),
	(42,'2014-02-06 21:46:03',1,8,'14','王五',3,''),
	(43,'2014-02-06 21:46:03',1,8,'13','王五',3,''),
	(44,'2014-02-06 21:46:03',1,8,'12','李四',3,''),
	(45,'2014-02-06 21:46:03',1,8,'11','李四',3,''),
	(46,'2014-02-06 21:46:03',1,8,'10','李四',3,''),
	(47,'2014-02-06 21:46:03',1,8,'9','李四',3,''),
	(48,'2014-02-06 21:46:03',1,8,'8','李四',3,''),
	(49,'2014-02-06 21:46:03',1,8,'7','李四',3,''),
	(50,'2014-02-06 21:53:44',1,9,'24','24',1,''),
	(51,'2014-02-08 20:33:28',1,9,'25','25',3,''),
	(52,'2014-02-09 00:14:59',1,8,'37','312',3,''),
	(53,'2014-02-09 11:41:30',1,10,'60','24 60 1980',1,''),
	(54,'2014-02-09 11:42:51',1,10,'61','24 61 1580',1,''),
	(55,'2014-02-09 11:43:35',1,10,'62','24 62 1980',1,''),
	(56,'2014-02-09 11:44:08',1,10,'63','24 63 5666',1,''),
	(57,'2014-02-09 11:45:06',1,10,'64','24 64 0',1,''),
	(58,'2014-02-09 11:45:28',1,10,'65','24 65 0',1,''),
	(59,'2014-02-09 11:46:19',1,10,'63','24 63 680',2,'已修改 item_price 。'),
	(60,'2014-02-09 15:51:28',1,8,'40','陈宽',3,''),
	(61,'2014-02-10 12:51:40',1,13,'3','01',1,''),
	(62,'2014-02-10 12:52:11',1,13,'4','02',1,''),
	(63,'2014-02-10 12:52:27',1,13,'5','03',1,''),
	(64,'2014-02-10 12:52:50',1,13,'6','04',1,''),
	(65,'2014-02-10 12:53:42',1,13,'4','04',2,'已修改 owner_code 。'),
	(66,'2014-02-10 12:53:49',1,13,'6','01',2,'已修改 owner_code 。'),
	(67,'2014-02-10 12:53:56',1,13,'3','02',2,'已修改 owner_code 。'),
	(68,'2014-02-10 14:14:43',1,8,'40','40',3,''),
	(69,'2014-02-10 15:27:44',1,9,'32','32',3,''),
	(70,'2014-02-10 16:28:20',1,8,'44','44',3,''),
	(71,'2014-02-10 16:35:53',1,8,'45','45',3,''),
	(72,'2014-02-10 20:15:41',1,8,'46','46',3,''),
	(73,'2014-02-10 21:46:17',1,8,'47','47',3,''),
	(74,'2014-02-11 15:44:55',1,12,'9','09 电视柜',1,''),
	(75,'2014-02-11 15:45:19',1,12,'1','01 床架',2,'已修改 tpye_name 。'),
	(76,'2014-02-20 23:16:36',1,9,'45','45',3,''),
	(77,'2014-02-20 23:17:26',1,9,'40','40',3,''),
	(78,'2014-02-20 23:19:09',1,9,'41','41',3,''),
	(79,'2014-02-20 23:28:47',1,9,'29','29',3,''),
	(80,'2014-02-23 14:11:44',1,9,'91','91',2,'已修改 deliveredate 。'),
	(81,'2014-02-23 14:11:54',1,9,'90','90',2,'已修改 deliveredate 。'),
	(82,'2014-03-31 20:05:53',1,8,'137','137',3,''),
	(83,'2014-03-31 20:05:53',1,8,'136','136',3,''),
	(84,'2014-03-31 20:12:46',1,8,'136','136',3,''),
	(85,'2014-03-31 20:25:39',1,8,'137','137',3,'');

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`)
VALUES
	(1,'permission','auth','permission'),
	(2,'group','auth','group'),
	(3,'user','auth','user'),
	(4,'message','auth','message'),
	(5,'content type','contenttypes','contenttype'),
	(6,'session','sessions','session'),
	(7,'site','sites','site'),
	(8,'custom','jxc','custom'),
	(9,'order','jxc','order'),
	(10,'orde r_ detail','jxc','order_detail'),
	(11,'log entry','admin','logentry'),
	(12,'ite m_type','jxc','item_type'),
	(13,'orde r_owner','jxc','order_owner'),
	(14,'ms g_board','jxc','msg_board'),
	(15,'st d_ item','jxc','std_item'),
	(17,'st d_goodsinfo','jxc','std_goodsinfo'),
	(18,'st d_price','jxc','std_price'),
	(19,'st d_storage','jxc','std_storage'),
	(20,'im g_owner','jxc','img_owner');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('1b1476388161fccb0c7d679a45c2f2fb','NmI0YzcwZTdiZDc5ZDFlZGU0ZjU4YTBmOTE4MzkxMzBhZDVhOWI3NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2014-04-14 20:05:42'),
	('559696b9c097e7972c1accb9c7b409d7','NmI0YzcwZTdiZDc5ZDFlZGU0ZjU4YTBmOTE4MzkxMzBhZDVhOWI3NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2014-02-19 10:36:28'),
	('599a486b928c0b8aaef114134be189e6','NmI0YzcwZTdiZDc5ZDFlZGU0ZjU4YTBmOTE4MzkxMzBhZDVhOWI3NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2014-03-18 22:22:39'),
	('634a11b1eb10be02fae331c48815ee15','ZmM0ZGE5MDE1MGNiMzNlYTBjN2IzNTMxNzFhMmE3NmYyNTdkZWVhYTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2014-02-23 15:59:36'),
	('70660390667dd1a19ff51beff4454626','NmI0YzcwZTdiZDc5ZDFlZGU0ZjU4YTBmOTE4MzkxMzBhZDVhOWI3NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2014-02-20 20:39:41'),
	('9417af4f130112b7a88f55f22636e2fe','NmI0YzcwZTdiZDc5ZDFlZGU0ZjU4YTBmOTE4MzkxMzBhZDVhOWI3NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2014-02-24 15:25:56'),
	('98449a0fd0a928dea31863e27c9f3ca0','NmI0YzcwZTdiZDc5ZDFlZGU0ZjU4YTBmOTE4MzkxMzBhZDVhOWI3NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2014-02-23 15:48:42'),
	('9932a540cc15da6f9327ac306e2ff794','NmI0YzcwZTdiZDc5ZDFlZGU0ZjU4YTBmOTE4MzkxMzBhZDVhOWI3NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2014-03-06 23:15:20'),
	('9bfe9a2b462286b701ca7facad49a508','NmI0YzcwZTdiZDc5ZDFlZGU0ZjU4YTBmOTE4MzkxMzBhZDVhOWI3NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2014-02-17 21:31:55'),
	('a6633344d8c9272ac15fcef62fa42a98','NmI0YzcwZTdiZDc5ZDFlZGU0ZjU4YTBmOTE4MzkxMzBhZDVhOWI3NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2014-03-09 14:09:00'),
	('cfc8fdaa227c9a01971aa98c5c784996','NmI0YzcwZTdiZDc5ZDFlZGU0ZjU4YTBmOTE4MzkxMzBhZDVhOWI3NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2014-02-18 17:21:37'),
	('fe523988e399cfe36e730aac07ce42e8','NmI0YzcwZTdiZDc5ZDFlZGU0ZjU4YTBmOTE4MzkxMzBhZDVhOWI3NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2014-02-24 16:28:06');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_site
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_site`;

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;

INSERT INTO `django_site` (`id`, `domain`, `name`)
VALUES
	(1,'example.com','example.com'),
	(2,'site1','第一站');

/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jxc_custom
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jxc_custom`;

CREATE TABLE `jxc_custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_name` varchar(30) NOT NULL,
  `custom_phone` varchar(11) NOT NULL,
  `custom_gender` varchar(1) DEFAULT NULL,
  `custom_adress` varchar(50) NOT NULL,
  `custom_comment` varchar(50) DEFAULT NULL,
  `updatetime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `jxc_custom` WRITE;
/*!40000 ALTER TABLE `jxc_custom` DISABLE KEYS */;

INSERT INTO `jxc_custom` (`id`, `custom_name`, `custom_phone`, `custom_gender`, `custom_adress`, `custom_comment`, `updatetime`)
VALUES
	(34,'刘明','15802158344','M','桂井齐美塘','无','2014-02-06'),
	(35,'南郡明珠','13974919554','M','南郡明珠4栋102','南郡明珠','2014-02-06'),
	(36,'杨红','15116487016','F','昆仑和府1栋1008','无','2014-02-06'),
	(38,'新韶足工地老板','13974829493','M','','','2014-02-09'),
	(39,'张真名','13367497718','M','','','2014-02-09'),
	(41,'董勇','13308410915','','暮云工业园旁边','','2014-02-10'),
	(42,'刘俊','15173192775','','新隆樟枫市','','2014-02-10'),
	(43,'李长根','13787178047','','牛角塘杨桥','','2014-02-10'),
	(44,'严正明','15116208780','','南托五队','','2014-02-20'),
	(45,'刘宽如','15608456608','','大托三队','','2014-02-20'),
	(46,'罗红辉','18975808022','','山城花苑5栋606','','2014-02-20'),
	(47,'周老板','13973178069','','幸福庄园喜园5栋B1306','','2014-02-20'),
	(48,'张建军','18974831102','','大托7队','','2014-02-20'),
	(49,'唐铁钢','13907493368','','花园1队','','2014-02-20'),
	(50,'吴军','18374818393','','新路30栋1单元201（五月节后付清）','','2014-02-20'),
	(51,'杨淑晴','15292112555','','彭家井安置小区2楼鑫天乐对面','','2014-02-21'),
	(52,'肖华','15084740726','','凯富7栋201','','2014-02-21'),
	(53,'李建波','15367921366','','桂井1队简坑子','','2014-02-21'),
	(54,'陈毅','13656602377','','田新桥赶集口子进去','','2014-02-21'),
	(55,'彭富其','13975183823','','西湖1期15栋（靠西头）','','2014-02-21'),
	(56,'宋立','13974971635','','三兴蒋纲山','','2014-02-21'),
	(57,'王可云','18684855711','','大托5队','','2014-02-21'),
	(58,'张岳明','13875992650','','桃阳小区70栋2单元','','2014-02-21'),
	(59,'张立坤','15674898623','','七公司大托二队','','2014-02-21'),
	(60,'韩森林14789864728','13469441052','','三兴和平安置区2栋','','2014-02-21'),
	(61,'郭卫昆','13319555082','','牛角塘长沙四通管道制造有限公司','','2014-02-21'),
	(62,'罗健','13873114255','','九峰安置区28栋3单元','','2014-02-21'),
	(63,'张良','15674810362','','西湖1期A区22栋2203','','2014-02-21'),
	(64,'张海平','13975884833','','高云1期C3区','','2014-02-21'),
	(65,'黄老板','15873193748','','蓝天建材城','','2014-02-21'),
	(66,'胡珊','18774008634','','南塘龙骑矿376号','','2014-02-21'),
	(67,'涂纯','15874905439','','高云村谢家坝组','','2014-02-21'),
	(68,'王强','18229878167','','西湖村冒卜塘组54号','','2014-02-22'),
	(69,'宋运财','18273157327','','山城明珠2栋1单元810','','2014-02-22'),
	(70,'张老板','13808479304','','三兴富家山','','2014-02-23'),
	(71,'李映辉','15211123571','','水电八局八栋501','','2014-02-23'),
	(72,'田先生','13467581657','','机场口十九场A2栋405披塘','','2014-02-23'),
	(73,'周老板','13507448686','','西湖B区5栋502','','2014-02-23'),
	(74,'张姐','15874078355','','暮云中意二路229号','','2014-02-23'),
	(75,'陈仕民13874977486','13874977486','','十九场钢材市场披塘','','2014-02-23'),
	(76,'莫柱','13875959220','','西湖B区25栋5楼','','2014-02-23'),
	(77,'彭帅哥','18008401737','','黎塘王家坝','','2014-02-23'),
	(78,'汤子龙','13548944412','','披塘2小区26栋','','2014-02-23'),
	(79,'胡','13975839748','','保利对面腾泰佳园1栋803','','2014-02-23'),
	(80,'段世跃','13873997533','','御邦别墅73栋101','','2014-02-23'),
	(81,'王姐','15200590311','','四普单身宿舍2楼','','2014-02-23'),
	(82,'周国强','18974917742','','老铺上','','2014-02-23'),
	(83,'刘福清','13272476579','','新隆石灰塘','','2014-02-23'),
	(84,'卫生院','13787169715','','卫生院','','2014-02-23'),
	(85,'刘老板','13874835861','','供电所边上','','2014-02-23'),
	(86,'张国强','15074997762','','尧塘坳価岭','','2014-02-23'),
	(87,'游文霞','15116253605','','大托1队','','2014-02-23'),
	(88,'吴鑫','13787237267','','卷烟厂后面','','2014-02-23'),
	(89,'张友良','13787174640','','南托五队','','2014-02-23'),
	(90,'唐学文','15874288264','','花园道塘组6队','','2014-02-23'),
	(91,'张老板','13657481674','','花园7队','','2014-02-23'),
	(92,'满舅13755141126','13508492154','','栗山','','2014-02-23'),
	(93,'张清民','13507461227','','尧塘坳価岭 左转2栋','','2014-02-23'),
	(94,'彭淑秋','15084834854','','杨桥大围子','','2014-02-23'),
	(95,'严廷伟','1817312902','','莲河加油站旁石锅鱼旁','','2014-02-23'),
	(96,'蒋纯','15874245136','','中信文化广场3栋805','','2014-02-23'),
	(97,'易正文','13755129587','','西湖3期8栋3-4行','','2014-02-23'),
	(98,'杨文武','13974896543','','三兴','','2014-02-23'),
	(99,'晏春英','86952151','','30330栋301','','2014-02-23'),
	(100,'李运秋','18874196901','','南郡明珠14栋13楼1305B2单元','','2014-02-23'),
	(101,'吴正凯','15074884571','','高云小区东2区7栋3单元3011','','2014-02-23'),
	(102,'罗勇','15197292355','','易家湾南大门过去','','2014-02-23'),
	(103,'彭一民','13975887622','','高云王家塘组','','2014-02-23'),
	(104,'王新明','18942541900','','花园沙场进去 刘家塘','','2014-02-23'),
	(105,'何先生','18573117981','','凯富家园','','2014-02-23'),
	(106,'张九满','86908056','','三兴富家山','','2014-02-23'),
	(107,'罗海洪','13574286559','','跳马五七','','2014-02-23'),
	(108,'宋菊华','15576655575','','尧塘','','2014-02-23'),
	(109,'邓咏红','13189039298','','八局25栋505 三单元','','2014-02-23'),
	(110,'郭先生','13203316007','','303 1栋407靠西头','','2014-02-24'),
	(111,'邹波','13974954035','','田新桥村化香嘴','','2014-02-24'),
	(112,'张露','15116331242','','花园7队','','2014-02-24'),
	(113,'钱浩林','18973158284','','老屋村136号','','2014-02-24'),
	(114,'许淑纯','13975863346','','三兴和平组','','2014-02-24'),
	(115,'杨校长妹','15084785838','','南湖大道九龙服饰一家分店旁边7楼','','2014-02-24'),
	(116,'彭某','15616209875','','桂井中学附近','','2014-02-24'),
	(117,'王光辉','15073168883','','南郡雅园前200米','','2014-02-24'),
	(118,'彭任龙','13617498801','','新宇小区4栋904','','2014-02-24'),
	(119,'张先生','13607493893','','西湖一期4栋','','2014-02-24'),
	(120,'邹','15974107342','','尧塘','','2014-02-24'),
	(121,'刘老板','13687378616','','气象嘉园','','2014-02-24'),
	(122,'刘鹏','15802583447','','桂井齐美塘','','2014-02-24'),
	(123,'张福云','13723866131','','花园二轻学校后面','','2014-02-24'),
	(124,'楚','13203159383','','兴隆中心港','','2014-02-24'),
	(125,'谭老板18711186842','13574842336','','友谊路万芙锦城3栋1309','','2014-02-24'),
	(126,'李','13755031345','','黎塘寿塘湾','','2014-02-24'),
	(127,'邹国强','15874994254','','南托7队','','2014-02-24'),
	(128,'刘美女','18373129669','','五七一二飞机修理厂','','2014-02-24'),
	(129,'罗金华','13548536658','','证券公司','','2014-02-24'),
	(130,'张老板','13787177171','','蒋家山','','2014-02-24'),
	(131,'刘建国','13548716265','','尧塘村部附近/幸福庄园喜园10栋','','2014-02-24'),
	(132,'陈','13548770989','','大托十队贺家老屋','','2014-02-24'),
	(133,'罗三毛','15874919215','','十九场卫门茅5栋159','','2014-02-24'),
	(134,'沈老板','18673121712','','拉线厂旁边左转洗车第一栋','','2014-02-25'),
	(135,'欧阳艳双13974937878','15084862312','','鼓风机场22栋601','','2014-02-25'),
	(138,'宋兵进','18773185923','','南塘靠里面工地','','2014-03-31'),
	(139,'张','13469071468','','三兴团山','','2014-03-31'),
	(140,'高红','15874802415','','牛角塘周马塘组','','2014-03-31'),
	(141,'邓海兰','15173182783','','七公司门面福云超市隔壁','','2014-03-31'),
	(142,'刘桂良','15575125922','','圭塘17栋1门2楼','','2014-03-31'),
	(143,'唐超','13787806955','','暮云慕斯路口','','2014-03-31'),
	(144,'曾女士','18973141890','','南郡明珠雅苑1栋703','','2014-03-31'),
	(145,'张磊','13755177513','','天冰对面','','2014-03-31'),
	(146,'郑女士','15111294502','','供电所对面','','2014-03-31'),
	(147,'邹宇','18229994507','','黄合农技站信用社进去','','2014-03-31'),
	(148,'彭娜','15874184932','','南托4队','','2014-03-31'),
	(149,'周义清','13875813679','','三兴','','2014-03-31'),
	(150,'张国强','13875820507','','长沙市大托镇桂井村桂井小学旁','','2014-03-31'),
	(151,'莫红伟','13975874315','','幸福庄园福园9栋2602','','2014-03-31'),
	(152,'邹松其','13907492761','','高云村农山塘小组','','2014-03-31'),
	(153,'楚新言','15526451531','','幸福庄园福园5栋203','','2014-03-31'),
	(154,'李正华','13257489138','','西湖2期15栋B区3楼','','2014-03-31'),
	(155,'唐先生','13548765863','','黄合农技站','','2014-03-31'),
	(156,'陈婷','13975188914','','钢材市场','','2014-03-31'),
	(157,'曾玉栅','13297499055','','黄合农技站','','2014-03-31'),
	(158,'徐小红','13873167419','','唐家老屋','','2014-03-31'),
	(159,'谭老板','13874878759','','披塘2期18栋1单元1802 3楼','','2014-03-31'),
	(160,'戴坚','13677337140','','牛角塘村部对面','','2014-03-31'),
	(161,'邓先生','18807475407','','三零三19栋7楼','','2014-03-31'),
	(162,'张虎','13973195068','','市场','','2014-03-31'),
	(163,'文老板','13574135883','','西湖B区30栋5号','','2014-03-31'),
	(164,'陈白秀','18684634499','','御邦小区31栋104','','2014-03-31'),
	(165,'崔红英','15973130052','','金环奥斯卡1栋803','','2014-03-31'),
	(166,'谢老板','13974970974','','披塘1期安置小区公寓楼2-602','','2014-03-31'),
	(167,'谭美女','15116244893','','披塘2期 22栋','','2014-03-31'),
	(168,'王先生','18073194885','','新路14栋2单元402','','2014-04-06'),
	(169,'唐爹','13007491367','','凯富4栋302','','2014-04-07'),
	(170,'严友','13187080777','','大托转盘过去','','2014-04-07');

/*!40000 ALTER TABLE `jxc_custom` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jxc_img_owner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jxc_img_owner`;

CREATE TABLE `jxc_img_owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `goodsid_id` int(11) NOT NULL,
  `goodUrl` varchar(2048) NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jxc_img_owner_a2b3497e` (`goodsid_id`),
  CONSTRAINT `goodsid_id_refs_id_849fb734` FOREIGN KEY (`goodsid_id`) REFERENCES `jxc_std_goodsinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `jxc_img_owner` WRITE;
/*!40000 ALTER TABLE `jxc_img_owner` DISABLE KEYS */;

INSERT INTO `jxc_img_owner` (`id`, `name`, `goodsid_id`, `goodUrl`, `updatetime`)
VALUES
	(49,'139797041454273.jpg',44,'/imageBed/sofa/','2014-04-20 13:06:54'),
	(50,'139797100769364.jpg',45,'/imageBed/sofa/','2014-04-20 13:16:47'),
	(51,'139797107322903.jpg',46,'/imageBed/sofa/','2014-04-20 13:17:53'),
	(52,'139797116082460.jpg',47,'/imageBed/sofa/','2014-04-20 13:19:20'),
	(53,'139797116188470.jpg',47,'/imageBed/sofa/','2014-04-20 13:19:21'),
	(54,'139797126924476.jpg',48,'/imageBed/desk/','2014-04-20 13:21:09'),
	(55,'139797135629857.jpg',49,'/imageBed/sofa/','2014-04-20 13:22:36'),
	(56,'13979715595964.jpg',50,'/imageBed/sofa/','2014-04-20 13:25:59'),
	(57,'139797156036314.jpg',50,'/imageBed/sofa/','2014-04-20 13:26:00'),
	(58,'139797166639618.jpg',51,'/imageBed/sofa/','2014-04-20 13:27:46'),
	(59,'13979716676736.jpg',51,'/imageBed/sofa/','2014-04-20 13:27:47'),
	(60,'139797177610838.jpg',52,'/imageBed/sofa/','2014-04-20 13:29:36'),
	(61,'139797180941341.jpg',53,'/imageBed/other/','2014-04-20 13:30:09'),
	(62,'139797185151750.jpg',54,'/imageBed/desk/','2014-04-20 13:30:51'),
	(63,'139797185324973.jpg',54,'/imageBed/desk/','2014-04-20 13:30:53'),
	(64,'139797185481806.jpg',54,'/imageBed/desk/','2014-04-20 13:30:54'),
	(65,'13979719795235.jpg',55,'/imageBed/bed/','2014-04-20 13:32:59'),
	(66,'139797200637139.jpg',56,'/imageBed/other/','2014-04-20 13:33:26'),
	(67,'139797204253723.jpg',57,'/imageBed/taofang/','2014-04-20 13:34:02'),
	(68,'139797207333868.jpg',58,'/imageBed/taofang/','2014-04-20 13:34:33'),
	(69,'139797211064089.jpg',59,'/imageBed/taofang/','2014-04-20 13:35:10'),
	(70,'13979721126808.jpg',59,'/imageBed/taofang/','2014-04-20 13:35:12'),
	(71,'13979721612593.jpg',60,'/imageBed/bed/','2014-04-20 13:36:01'),
	(72,'139797219663072.jpg',62,'/imageBed/bed/','2014-04-20 13:36:36'),
	(73,'139797260174283.jpg',63,'/imageBed/bed/','2014-04-20 13:43:21'),
	(74,'139797263197690.jpg',64,'/imageBed/bed/','2014-04-20 13:43:51'),
	(75,'139797271377610.jpg',65,'/imageBed/bed/','2014-04-20 13:45:13'),
	(76,'139797275181595.jpg',67,'/imageBed/bed/','2014-04-20 13:45:51'),
	(77,'139797277013546.jpg',68,'/imageBed/other/','2014-04-20 13:46:10'),
	(78,'139797280921427.jpg',69,'/imageBed/bed/','2014-04-20 13:46:49'),
	(79,'139797292070810.jpg',70,'/imageBed/bed/','2014-04-20 13:48:40');

/*!40000 ALTER TABLE `jxc_img_owner` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jxc_item_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jxc_item_type`;

CREATE TABLE `jxc_item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tpye_code` varchar(20) NOT NULL,
  `tpye_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `jxc_item_type` WRITE;
/*!40000 ALTER TABLE `jxc_item_type` DISABLE KEYS */;

INSERT INTO `jxc_item_type` (`id`, `tpye_code`, `tpye_name`)
VALUES
	(1,'01','床架'),
	(2,'02','沙发'),
	(3,'03','柜子'),
	(4,'04','桌子'),
	(5,'05','椅子'),
	(6,'06','散件'),
	(7,'07','床垫'),
	(8,'08','梳妆台'),
	(9,'09','电视柜'),
	(10,'10','其他');

/*!40000 ALTER TABLE `jxc_item_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jxc_msg_board
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jxc_msg_board`;

CREATE TABLE `jxc_msg_board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgcontent` varchar(2048) NOT NULL,
  `msgcreater` varchar(30) NOT NULL,
  `msgcreatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `jxc_msg_board` WRITE;
/*!40000 ALTER TABLE `jxc_msg_board` DISABLE KEYS */;

INSERT INTO `jxc_msg_board` (`id`, `msgcontent`, `msgcreater`, `msgcreatetime`)
VALUES
	(961,'1321321312','我的武器','2014-02-10 21:53:05'),
	(962,'超赞','游客','2014-02-10 21:57:28'),
	(963,'陈宽是最棒的！','胡颖','2014-02-10 22:07:23'),
	(964,'请问此系统还有什么需要改进的地方？','游客','2014-02-10 22:12:02'),
	(966,'陈宽还是不错滴勒，继续加油咯！！','耗子','2014-02-11 15:02:54'),
	(967,'陈宽还是不错滴咯，继续加油！！！','耗子','2014-02-11 15:03:12'),
	(968,'陈宽同志可以派往东莞支持灾后重建工作','习XX','2014-02-11 15:59:02'),
	(969,'陈宽不可以去东莞，不可以','游客','2014-02-11 19:45:06'),
	(970,'留言 2、15','留言','2014-02-15 16:39:39'),
	(971,'更新日志：添加已有客户验证，添加关单功能；下阶段功能：给顾客添加黑名单备注功能','需求','2014-02-23 01:29:42'),
	(972,'更新日志：添加已有客户验证，添加关单功能；\r\n下阶段功能：给顾客添加黑名单备注功能','游客','2014-02-23 01:29:55'),
	(973,'更新日志：添加已有客户验证','更新日志','2014-02-23 01:30:21'),
	(974,'下阶段功能：给顾客添加黑名单备注功能','下阶段功能','2014-02-23 01:30:30'),
	(975,'进行订单录入成功与否的验证','需求','2014-02-23 13:05:00'),
	(976,'开发：地址分类页面','需求','2014-02-23 13:28:57'),
	(977,'开发：价格标注页面','需求','2014-02-23 13:29:07'),
	(978,'开发：报表页面','游客','2014-02-23 14:37:04'),
	(979,'<em>报表开发中……</em>','游客','2014-02-23 20:26:40'),
	(980,'开发：客户查询','游客','2014-02-24 12:15:20'),
	(982,'开发：提成计算页面','游客','2014-02-24 16:02:28'),
	(983,'开发绩效库','游客','2014-02-24 19:35:29'),
	(984,'订单分配器','游客','2014-02-24 20:18:20'),
	(985,'订单录入界面改进','游客','2014-02-24 21:22:34'),
	(986,'2014/2/24工作总结：\r\n1.添加顾客黑名单功能方案待定\r\n2.进行订单录入的提交验证，最好加入事务机制\r\n3.进行地址分类的开发，批量对地址进行归类\r\n4.开发价格标注页面，对价格进行批量人工标注（给营业员）\r\n6.开发客户查询，采用Ajax进行无刷新查询\r\n7.完善提成计算器\r\n8.设计绩效参数库，对员工绩效进行计算\r\n9.开发订单分配器重新指定ORDER_owner\r\n10.订单录入界面重构\r\n\r\n下一代产品：\r\n关联送货绩效\r\n关联仓库管理系统','开发者','2014-02-24 23:26:43'),
	(987,'2014/2/24工作总结（补充）：\r\n1.开发阶梯式提成计算器\r\n2.开发登录验证，使用session\r\n3.绩效工具采用如下三种取数据的方式：\r\n1）全部月份全部员工查询 - 输入参数 all=ture（做权限判断）\r\n1）根据根据时间段和员工查询 输入参数 fromdate=&todate=&employeeNumb=(all,**Numb)&','游客','2014-02-24 23:48:51'),
	(988,'2014/2/24工作总结：\r\n增加：价格同步中心\r\n下一步计划：继续补充标准化 ','游客','2014-03-05 17:12:06'),
	(989,'同步中心 - 空格问题','BUG','2014-03-05 22:02:04'),
	(990,'同步中心 - 根据商品名定义的话设计仍有问题','BUG','2014-03-05 23:03:36');

/*!40000 ALTER TABLE `jxc_msg_board` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jxc_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jxc_order`;

CREATE TABLE `jxc_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id_id` int(11) NOT NULL,
  `bookdate` datetime NOT NULL,
  `deliveredate` date NOT NULL,
  `sum` int(11) NOT NULL,
  `paid` int(11) NOT NULL,
  `debt` int(11) NOT NULL,
  `addr` varchar(60) NOT NULL DEFAULT '无',
  `updatetime` date DEFAULT NULL,
  `owner` varchar(20) NOT NULL DEFAULT '01',
  `delivered` varchar(10) NOT NULL DEFAULT 'N' COMMENT '是否交货',
  `paidoff` varchar(10) NOT NULL DEFAULT 'N' COMMENT '款项是否付清',
  PRIMARY KEY (`id`),
  KEY `jxc_order_2ccaea20` (`user_id_id`),
  CONSTRAINT `user_id_id_refs_id_6dc117bb` FOREIGN KEY (`user_id_id`) REFERENCES `jxc_custom` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `jxc_order` WRITE;
/*!40000 ALTER TABLE `jxc_order` DISABLE KEYS */;

INSERT INTO `jxc_order` (`id`, `user_id_id`, `bookdate`, `deliveredate`, `sum`, `paid`, `debt`, `addr`, `updatetime`, `owner`, `delivered`, `paidoff`)
VALUES
	(21,34,'2014-01-20 00:00:00','2014-02-13',17600,1000,16600,'桂井齐美塘','2014-02-06','01','Y','Y'),
	(23,36,'2013-12-28 00:00:00','2014-02-28',1800,1800,0,'昆仑和府1栋1008','2014-02-06','01','Y','Y'),
	(24,35,'2014-02-05 00:00:00','2014-02-06',5666,5666,0,'南郡明珠4栋102','2014-02-06','01','Y','Y'),
	(30,39,'2014-02-07 00:00:00','2014-02-07',1680,1680,0,'大托7公司','2014-02-09','01','Y','Y'),
	(33,41,'2014-02-09 00:00:00','2014-02-10',1560,560,1000,'暮云工业园旁边','2014-02-10','04','Y','Y'),
	(34,42,'2014-01-25 00:00:00','2014-01-25',4200,4200,0,'新隆樟枫市','2014-02-10','03','Y','Y'),
	(35,43,'2014-02-08 00:00:00','2014-02-09',4580,1000,3580,'牛角塘杨桥','2014-02-10','02','Y','Y'),
	(36,44,'2014-01-25 00:00:00','2014-01-25',2180,2180,0,'南托五队','2014-02-20','01','Y','Y'),
	(37,45,'2014-01-25 00:00:00','2014-01-25',800,500,300,'大托三队','2014-02-20','01','Y','Y'),
	(38,46,'2014-01-25 00:00:00','2014-01-25',860,860,0,'山城花苑5栋606','2014-02-20','01','Y','Y'),
	(39,47,'2014-01-25 00:00:00','2014-01-25',4080,4080,0,'幸福庄园喜园5栋B1306','2014-02-20','01','Y','Y'),
	(42,48,'2014-01-25 00:00:00','2014-01-25',2500,500,2000,'大托7队','2014-02-20','01','Y','Y'),
	(43,49,'2014-01-28 00:00:00','2014-01-28',900,100,800,'花园1队','2014-02-20','01','Y','Y'),
	(44,50,'2014-01-27 00:00:00','2014-01-28',16380,1000,15380,'新路30栋1单元201（五月节后付清）','2014-03-13','01','Y','N'),
	(46,38,'2014-02-07 00:00:00','2014-02-08',2400,400,2000,'蓝天建材城对门宝马4s店对面','2014-02-20','01','Y','Y'),
	(47,51,'2014-02-10 00:00:00','2014-02-10',3558,3558,0,'彭家井安置小区2楼鑫天乐对面','2014-02-21','01','Y','Y'),
	(48,52,'2014-02-10 00:00:00','2014-02-10',16000,600,15400,'凯富7栋201','2014-02-21','01','Y','Y'),
	(49,53,'2014-02-11 00:00:00','2014-02-11',1680,400,1280,'桂井1队简坑子','2014-02-21','01','Y','Y'),
	(50,54,'2014-02-11 00:00:00','2014-02-11',6300,1300,5000,'田新桥赶集口子进去','2014-02-21','01','Y','Y'),
	(51,55,'2014-01-12 00:00:00','2014-01-12',350,350,0,'西湖1期15栋（靠西头）','2014-02-21','01','Y','Y'),
	(52,56,'2014-02-12 00:00:00','2014-02-12',650,650,0,'三兴蒋纲山','2014-02-22','01','Y','Y'),
	(53,57,'2014-02-13 00:00:00','2014-02-13',1580,1580,0,'大托5队','2014-02-22','01','Y','Y'),
	(54,58,'2014-02-13 00:00:00','2014-02-13',750,750,0,'桃阳小区70栋2单元','2014-02-22','01','Y','Y'),
	(55,59,'2014-02-14 00:00:00','2014-02-14',5280,2280,3000,'七公司大托二队','2014-02-22','01','Y','Y'),
	(56,60,'2014-02-14 00:00:00','2014-02-14',1180,1180,0,'三兴和平安置区2栋','2014-02-22','01','Y','Y'),
	(57,61,'2014-02-14 00:00:00','2014-02-14',600,600,0,'牛角塘长沙四通管道制造有限公司','2014-02-21','01','Y','Y'),
	(58,62,'2014-02-14 00:00:00','2014-02-14',4020,2020,2000,'九峰安置区28栋3单元','2014-02-21','01','Y','Y'),
	(59,63,'2014-02-15 00:00:00','2014-02-15',3600,600,3000,'西湖1期A区22栋2203','2014-02-21','01','Y','Y'),
	(60,64,'2014-02-15 00:00:00','2014-02-15',1950,1550,400,'高云1期C3区','2014-02-23','01','Y','Y'),
	(61,65,'2014-02-15 00:00:00','2014-02-15',2660,2660,0,'蓝天建材城','2014-02-21','01','Y','Y'),
	(62,66,'2014-02-15 00:00:00','2014-02-15',2080,1100,980,'南塘龙骑矿376号','2014-02-21','01','Y','Y'),
	(63,67,'2014-02-16 00:00:00','2014-02-16',1408,408,1000,'高云村谢家坝组','2014-02-23','01','Y','Y'),
	(64,68,'2014-01-12 00:00:00','2014-01-12',3990,990,3000,'西湖村冒卜塘组54号','2014-02-23','01','Y','Y'),
	(65,69,'2014-01-11 00:00:00','2014-01-11',820,220,600,'山城明珠2栋1单元810','2014-02-23','01','Y','Y'),
	(66,70,'2014-02-16 00:00:00','2014-02-17',1700,200,1500,'三兴富家山','2014-02-23','01','Y','Y'),
	(67,71,'2014-02-16 00:00:00','2014-02-16',520,520,0,'水电八局八栋501','2014-02-23','01','Y','Y'),
	(68,72,'2014-02-16 00:00:00','2014-02-16',2650,650,2000,'机场口十九场A2栋405披塘','2014-02-23','01','Y','Y'),
	(69,73,'2014-02-16 00:00:00','2014-02-16',280,280,0,'西湖B区5栋502','2014-02-23','01','Y','Y'),
	(70,74,'2014-02-16 00:00:00','2014-02-16',2600,200,2400,'暮云中意二路229号','2014-02-23','01','Y','Y'),
	(71,75,'2014-02-16 00:00:00','2014-02-16',3480,1000,2480,'十九场钢材市场披塘','2014-02-23','01','Y','Y'),
	(72,76,'2014-02-17 00:00:00','2014-02-18',2650,2500,150,'西湖B区25栋5楼','2014-02-23','01','Y','Y'),
	(73,77,'2014-02-17 00:00:00','2014-02-17',850,300,550,'黎塘王家坝','2014-02-23','01','Y','Y'),
	(74,78,'2014-02-17 00:00:00','2014-02-17',1500,500,1000,'披塘2小区26栋','2014-02-23','01','Y','Y'),
	(75,79,'2014-02-17 00:00:00','2014-02-17',900,100,800,'保利对面腾泰佳园1栋803','2014-02-23','01','Y','Y'),
	(76,80,'2014-02-18 00:00:00','2014-02-18',4800,4800,0,'御邦别墅73栋101','2014-02-23','01','Y','Y'),
	(77,80,'2014-02-18 00:00:00','2014-03-31',5800,5800,0,'御邦别墅73栋101','2014-02-23','01','Y','Y'),
	(78,81,'2014-02-18 00:00:00','2014-02-18',2180,2180,0,'四普单身宿舍2楼','2014-02-23','01','Y','Y'),
	(79,82,'2014-02-19 00:00:00','2014-02-19',3700,1700,2000,'老铺上','2014-02-23','01','Y','Y'),
	(80,83,'2014-02-19 00:00:00','2014-02-19',1800,1800,0,'新隆石灰塘','2014-02-23','01','Y','Y'),
	(81,84,'2014-02-19 00:00:00','2014-02-19',2500,0,2500,'卫生院','2014-03-03','01','Y','N'),
	(82,85,'2014-02-20 00:00:00','2014-02-20',750,750,0,'供电所边上','2014-02-23','01','Y','Y'),
	(83,86,'2014-02-20 00:00:00','2014-02-24',7800,400,7400,'尧塘坳価岭','2014-03-05','01','Y','Y'),
	(84,87,'2014-02-20 00:00:00','2014-02-20',1180,180,1000,'大托1队','2014-02-23','01','Y','Y'),
	(85,88,'2014-02-20 00:00:00','2014-02-20',1450,1000,450,'卷烟厂后面','2014-02-23','01','Y','Y'),
	(86,89,'2014-01-12 00:00:00','2014-01-13',2100,200,1900,'南托五队','2014-02-23','01','Y','Y'),
	(87,90,'2014-01-12 00:00:00','2014-01-12',2860,600,2260,'花园道塘组6队','2014-02-23','01','Y','Y'),
	(88,91,'2014-02-12 00:00:00','2014-02-12',1480,1480,0,'花园7队','2014-02-23','01','Y','Y'),
	(89,92,'2014-01-12 00:00:00','2014-01-12',1180,1180,0,'栗山','2014-02-23','01','Y','Y'),
	(90,93,'2014-01-12 00:00:00','2014-01-12',3590,590,3000,'尧塘坳価岭 左转2栋','2014-02-23','01','Y','Y'),
	(91,94,'2014-01-12 00:00:00','2014-01-12',2880,280,2600,'杨桥大围子','2014-02-23','01','Y','Y'),
	(92,95,'2014-01-12 00:00:00','2014-01-14',5800,800,5000,'莲河加油站旁石锅鱼旁','2014-02-23','01','Y','Y'),
	(93,96,'2014-01-13 00:00:00','2014-01-13',1000,1000,0,'中信文化广场3栋805','2014-02-23','01','Y','Y'),
	(94,97,'2014-01-13 00:00:00','2014-01-15',1900,0,1900,'西湖3期8栋3-4行','2014-02-23','01','Y','Y'),
	(95,98,'2014-01-13 00:00:00','2014-01-13',18160,18160,0,'三兴','2014-02-23','01','Y','Y'),
	(96,99,'2014-01-13 00:00:00','2014-01-13',1500,1500,0,'30330栋301','2014-02-23','01','Y','Y'),
	(97,100,'2014-01-13 00:00:00','2014-01-14',600,200,400,'南郡明珠14栋13楼1305B2单元','2014-02-23','01','Y','Y'),
	(98,101,'2014-01-13 00:00:00','2014-01-13',2000,500,1500,'高云小区东2区7栋3单元3011','2014-02-23','01','Y','Y'),
	(99,102,'2014-01-13 00:00:00','2014-01-14',3800,800,3000,'易家湾南大门过去','2014-02-23','01','Y','Y'),
	(100,103,'2014-01-13 00:00:00','2014-01-13',4000,2000,2000,'高云王家塘组','2014-02-23','01','Y','Y'),
	(101,104,'2014-01-14 00:00:00','2014-01-14',2490,490,2000,'花园沙场进去 刘家塘','2014-02-23','01','Y','Y'),
	(102,105,'2014-01-14 00:00:00','2014-01-14',1160,0,1160,'凯富家园','2014-02-23','01','Y','Y'),
	(103,106,'2014-01-15 00:00:00','2014-01-16',1180,600,580,'三兴富家山','2014-02-23','01','Y','Y'),
	(104,107,'2014-01-15 00:00:00','2014-01-15',2580,580,2000,'跳马五七','2014-02-23','01','Y','Y'),
	(105,108,'2014-01-17 00:00:00','2014-01-17',2680,1300,1380,'尧塘','2014-02-23','01','Y','Y'),
	(106,109,'2014-01-17 00:00:00','2014-01-17',8700,300,8400,'八局25栋505 三单元','2014-02-23','01','Y','Y'),
	(107,110,'2014-01-18 00:00:00','2014-01-18',1180,1180,0,'303 1栋407靠西头','2014-02-24','01','Y','Y'),
	(108,111,'2014-01-18 00:00:00','2014-01-18',2100,2100,0,'田新桥村化香嘴','2014-02-24','01','Y','Y'),
	(109,112,'2014-01-18 00:00:00','2014-01-18',2780,2000,780,'花园7队','2014-02-24','01','Y','Y'),
	(110,113,'2014-01-18 00:00:00','2014-01-18',3500,800,2700,'老屋村136号','2014-02-24','01','Y','Y'),
	(111,114,'2014-01-18 00:00:00','2014-01-18',1350,1350,0,'三兴和平组','2014-02-24','01','Y','Y'),
	(112,115,'2014-01-18 00:00:00','2014-01-18',1400,1400,0,'南湖大道九龙服饰一家分店旁边7楼','2014-02-24','01','Y','Y'),
	(113,116,'2014-01-18 00:00:00','2014-01-18',2850,400,2450,'桂井中学附近','2014-02-24','01','Y','Y'),
	(114,117,'2014-01-18 00:00:00','2014-01-18',3180,3180,0,'南郡雅园前200米','2014-02-24','01','Y','Y'),
	(115,118,'2014-01-19 00:00:00','2014-01-19',13280,3280,10000,'新宇小区4栋904','2014-02-24','01','Y','Y'),
	(116,119,'2014-01-19 00:00:00','2014-01-19',3900,3900,0,'西湖一期4栋','2014-02-24','01','Y','Y'),
	(117,120,'2014-01-19 00:00:00','2014-01-19',2280,1000,1280,'尧塘','2014-02-24','01','Y','Y'),
	(118,121,'2014-01-20 00:00:00','2014-01-20',3380,580,2800,'气象嘉园','2014-02-24','01','Y','Y'),
	(119,122,'2014-01-20 00:00:00','2014-01-20',17600,1000,16600,'桂井齐美塘','2014-02-24','01','Y','Y'),
	(120,123,'2014-01-21 00:00:00','2014-01-21',500,500,0,'花园二轻学校后面','2014-02-24','01','Y','Y'),
	(121,124,'2014-01-21 00:00:00','2014-01-21',780,500,280,'兴隆中心港','2014-02-24','01','Y','Y'),
	(122,125,'2014-01-21 00:00:00','2014-01-21',2790,2790,0,'友谊路万芙锦城3栋1309','2014-02-24','01','Y','Y'),
	(123,126,'2014-01-21 00:00:00','2014-01-21',700,200,500,'黎塘寿塘湾','2014-02-24','01','Y','Y'),
	(124,127,'2014-01-21 00:00:00','2014-01-21',500,500,0,'南托7队','2014-02-24','01','Y','Y'),
	(125,128,'2014-01-21 00:00:00','2014-01-21',9400,3000,6400,'五七一二飞机修理厂','2014-02-24','01','Y','Y'),
	(126,129,'2014-01-21 00:00:00','2014-01-21',380,200,180,'证券公司','2014-02-24','01','Y','Y'),
	(127,130,'2014-01-22 00:00:00','2014-01-22',1500,1500,0,'蒋家山','2014-02-24','01','Y','Y'),
	(128,131,'2014-01-22 00:00:00','2014-01-22',2600,600,2000,'尧塘村部附近/幸福庄园喜园10栋','2014-02-24','01','Y','Y'),
	(129,132,'2014-01-25 00:00:00','2014-01-25',1080,500,580,'大托十队贺家老屋','2014-02-24','01','Y','Y'),
	(130,133,'2014-01-23 00:00:00','2014-01-23',2180,180,2000,'十九场卫门茅5栋159','2014-02-24','01','Y','Y'),
	(131,134,'2013-12-30 00:00:00','2013-12-30',2480,2000,480,'拉线厂旁边左转洗车第一栋','2014-02-25','01','Y','Y'),
	(132,134,'2013-12-30 00:00:00','2013-12-30',2480,2000,480,'拉线厂旁边左转洗车第一栋','2014-02-25','01','Y','Y'),
	(133,135,'2013-12-31 00:00:00','2013-12-31',3288,1400,1888,'鼓风机场22栋601','2014-02-25','01','Y','Y'),
	(137,138,'2014-03-10 00:00:00','2014-03-10',700,700,0,'南塘靠里面工地','2014-03-31','01','Y','Y'),
	(138,139,'2014-02-21 00:00:00','2014-02-21',1700,185,1500,'三兴团山','2014-03-31','01','Y','Y'),
	(139,140,'2014-02-21 00:00:00','2014-02-21',400,400,0,'牛角塘周马塘组','2014-03-31','01','Y','Y'),
	(140,141,'2014-02-21 00:00:00','2014-02-21',560,174,360,'七公司门面福云超市隔壁','2014-03-31','01','Y','Y'),
	(141,142,'2014-02-21 00:00:00','2014-02-21',5280,280,5000,'圭塘17栋1门2楼','2014-03-31','01','Y','Y'),
	(142,143,'2014-02-21 00:00:00','2014-02-21',2800,2800,0,'暮云慕斯路口','2014-03-31','01','Y','Y'),
	(143,144,'2014-02-21 00:00:00','2014-02-21',2200,2200,0,'南郡明珠雅苑1栋703','2014-03-31','01','Y','Y'),
	(144,145,'2014-02-21 00:00:00','2014-02-21',1460,1000,460,'天冰对面','2014-03-31','01','Y','Y'),
	(145,146,'2014-02-21 00:00:00','2014-02-21',950,950,0,'供电所对面','2014-03-31','01','Y','Y'),
	(146,147,'2014-02-22 00:00:00','2014-02-22',11280,9276,2000,'黄合农技站信用社进去','2014-03-31','01','Y','Y'),
	(147,148,'2014-02-22 00:00:00','2014-02-24',3480,1480,2000,'南托4队','2014-03-31','01','Y','Y'),
	(148,149,'2014-02-22 00:00:00','2014-03-22',16800,2982,13800,'三兴','2014-03-31','01','Y','Y'),
	(149,150,'2014-02-22 00:00:00','2014-02-22',3600,600,3000,'长沙市大托镇桂井村桂井小学旁','2014-03-31','01','Y','Y'),
	(150,151,'2014-02-22 00:00:00','2014-03-10',13600,500,13100,'幸福庄园福园9栋2602','2014-03-31','01','Y','Y'),
	(151,152,'2014-02-23 00:00:00','2014-02-23',1800,300,1500,'高云村农山塘小组','2014-03-31','01','Y','Y'),
	(152,153,'2014-02-23 00:00:00','2014-02-23',1400,200,1200,'幸福庄园福园5栋203','2014-03-31','01','Y','Y'),
	(153,154,'2014-02-23 00:00:00','2014-02-23',2000,200,1800,'西湖2期15栋B区3楼','2014-03-31','01','Y','Y'),
	(154,155,'2014-02-23 00:00:00','2014-02-23',1680,280,1400,'黄合农技站','2014-03-31','01','Y','Y'),
	(155,156,'2014-02-23 00:00:00','2014-02-23',350,350,0,'钢材市场','2014-03-31','01','Y','Y'),
	(156,157,'2014-02-23 00:00:00','2014-02-23',1200,400,800,'黄合农技站','2014-03-31','01','Y','Y'),
	(157,158,'2014-02-24 00:00:00','2014-02-24',980,200,780,'唐家老屋','2014-03-31','01','Y','Y'),
	(158,159,'2014-02-24 00:00:00','2014-02-24',1080,500,580,'披塘2期18栋1单元1802 3楼','2014-03-31','01','Y','Y'),
	(159,160,'2014-02-24 00:00:00','2014-02-25',1460,460,1000,'牛角塘村部对面','2014-03-31','01','Y','Y'),
	(160,161,'2014-02-24 00:00:00','2014-02-24',300,200,100,'三零三19栋7楼','2014-03-31','01','Y','Y'),
	(161,162,'2014-02-24 00:00:00','2014-02-24',5190,1000,4190,'市场','2014-03-31','01','Y','Y'),
	(162,163,'2014-02-25 00:00:00','2014-02-25',450,150,300,'西湖B区30栋5号','2014-03-31','01','Y','Y'),
	(163,164,'2014-02-25 00:00:00','2014-02-25',400,200,200,'御邦小区31栋104','2014-03-31','01','Y','Y'),
	(164,165,'2014-02-25 00:00:00','2014-02-25',3280,1280,2000,'金环奥斯卡1栋803','2014-03-31','01','Y','Y'),
	(165,166,'2014-02-25 00:00:00','2014-02-25',2900,900,2000,'披塘1期安置小区公寓楼2-602','2014-03-31','01','Y','Y'),
	(166,167,'2014-02-26 00:00:00','2014-02-26',5780,580,5200,'披塘2期 22栋','2014-03-31','01','Y','Y'),
	(167,168,'2014-03-31 00:00:00','2014-03-31',3800,1800,2000,'新路14栋2单元402','2014-04-06','04','Y','Y'),
	(168,169,'2014-03-10 00:00:00','2014-03-10',750,750,0,'凯富4栋302','2014-04-09','01','Y','Y'),
	(169,170,'2014-03-10 00:00:00','2014-03-10',900,900,0,'大托转盘过去','2014-04-08','01','Y','Y');

/*!40000 ALTER TABLE `jxc_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jxc_order_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jxc_order_detail`;

CREATE TABLE `jxc_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id_id` int(11) NOT NULL,
  `item_type` varchar(11) NOT NULL DEFAULT '10',
  `item_name` varchar(30) NOT NULL,
  `item_price` int(11) NOT NULL,
  `std_price` int(11) DEFAULT '0',
  `item_num` int(11) NOT NULL,
  `item_class` varchar(512) NOT NULL,
  `item_standard` varchar(1024) NOT NULL DEFAULT 'no',
  `corrected` varchar(5) NOT NULL DEFAULT 'N',
  `stdid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `jxc_order_detail_671bc9c` (`order_id_id`),
  CONSTRAINT `order_id_id_refs_id_4c82fac4` FOREIGN KEY (`order_id_id`) REFERENCES `jxc_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `jxc_order_detail` WRITE;
/*!40000 ALTER TABLE `jxc_order_detail` DISABLE KEYS */;

INSERT INTO `jxc_order_detail` (`id`, `order_id_id`, `item_type`, `item_name`, `item_price`, `std_price`, `item_num`, `item_class`, `item_standard`, `corrected`, `stdid`)
VALUES
	(41,21,'01','9017星港皮床 ',3490,3888,1,'9017星港皮床','null','Y',38),
	(42,21,'07','1.8米星港康乃馨床垫 黄',1850,1850,1,'星港康乃馨床垫','null','Y',57),
	(43,21,'06','韩式梳妆台 白色',1280,1280,1,'韩式梳妆台','白色','Y',33),
	(44,21,'02','布沙发 3*1.5m 麻灰色',3200,3200,1,'布沙发','3*1.5m麻灰色','Y',70),
	(45,21,'06','茶几 黑对角花',700,700,1,'茶几','黑对角花','Y',71),
	(46,21,'06','床头柜 送',0,200,1,'床头柜','送','Y',73),
	(47,21,'06','1.8米电视柜 黑色',900,0,1,'','no','N',0),
	(48,21,'06','1.5m酒柜 936',2000,2000,1,'酒柜','1.5m936','N',16),
	(49,21,'01','护垫被 ',0,0,1,'护垫被','null','Y',72),
	(50,21,'01','伊兰贝儿大理石餐桌 ',2380,2380,1,'伊兰贝儿大理石餐桌','null','Y',59),
	(51,21,'01','1.8米牛脑壳自产床 黄色 ',0,1080,1,'1.8米牛脑壳自产床','黄色','Y',40),
	(52,21,'07','1.8米百姓床垫 黄色',1800,700,1,'百姓床垫','null','Y',51),
	(53,21,'01','伊兰贝儿大理石餐椅 ',0,0,6,'伊兰贝儿大理石餐椅','null','Y',60),
	(58,23,'01','橡木双层床 ',1800,0,1,'','no','N',0),
	(60,24,'07','推门柜 ',1980,1980,1,'推门柜','null','Y',61),
	(61,24,'07','1.8米胭紫情缘床 ',1580,1580,1,'1.8米胭紫情缘床','null','Y',76),
	(62,24,'07','星港天堂鸟床垫 ',1980,1980,1,'星港天堂鸟床垫','null','Y',64),
	(63,24,'07','妆台 ',680,0,1,'','no','N',0),
	(64,24,'07','护垫被 送',0,0,1,'护垫被','null','Y',72),
	(65,24,'07','花 ',0,0,1,'','no','N',0),
	(70,30,'04','1.3米圆大理石餐桌 ',1680,1680,1,'1.3米圆大理石餐桌','null','Y',65),
	(71,30,'05','1.3米圆大理石餐椅 ',0,0,6,'圆大理石餐椅','1.3m','N',15),
	(80,33,'05','凳子 ',28,0,10,'','no','N',0),
	(81,33,'05','中邦转椅 ',240,0,3,'','no','N',0),
	(82,33,'04','1.4米办公电脑桌 ',400,0,1,'','no','N',0),
	(83,33,'06','1.4米桌面 ',160,0,1,'','no','N',0),
	(84,34,'02','俊琪布艺沙发 ',4000,0,1,'','no','N',0),
	(85,34,'06','茶几 白色',200,700,1,'茶几','黑对角花','Y',71),
	(86,35,'02','大款橡木皮布沙发 ',4280,3200,1,'布沙发','3*1.5m麻灰色','Y',70),
	(87,35,'06','1.3米大理石茶几 深色',980,700,1,'茶几','黑对角花','Y',71),
	(88,35,'03','电视柜 白色两头拉',1280,0,1,'','no','N',0),
	(89,36,'02','美泰居沙发 ',2180,2180,1,'美泰居沙发','null','Y',67),
	(90,37,'06','四方茶几 ',380,700,1,'茶几','黑对角花','Y',71),
	(91,37,'01','电视柜 ',800,0,1,'','no','N',0),
	(92,38,'06','茶几 626',860,700,1,'茶几','黑对角花','Y',71),
	(93,39,'01','1.5米橡木床 深色圈花',1500,800,1,'1.5米橡木床','深色圈花','Y',44),
	(94,39,'01','1.5米蓝梦缘床 粉色',1500,900,1,'1.5米蓝梦缘床','粉色','Y',43),
	(95,39,'07','1.5米星港紫罗兰床垫 ',1500,1380,2,'1.5米星港紫罗兰床垫','null','Y',45),
	(100,42,'03','五门柜 ',2500,0,1,'','no','N',0),
	(101,43,'01','1.5米毛毯床 ',500,580,1,'1.5米毛毯床','null','Y',47),
	(102,43,'07','1.5米百姓床垫 ',500,700,1,'百姓床垫','null','Y',51),
	(103,44,'07','9038星港皮床  ',2680,3280,1,'9038星港皮床','null','Y',42),
	(104,44,'06','床头柜 ',300,0,2,'','no','N',0),
	(105,44,'07','星港奥兰多床垫 ',2180,2180,1,'星港奥兰多床垫','null','Y',46),
	(106,44,'02','皮沙发806 黄色',4500,5000,1,'皮沙发806','黄色','Y',49),
	(107,44,'06','顾森茶几 ',1000,700,1,'茶几','黑对角花','Y',71),
	(108,44,'09','电视柜 JT300 白色',900,0,1,'','no','N',0),
	(109,44,'01','姿森床 白色 ',2180,0,1,'','no','N',0),
	(110,44,'03','间厅柜 623',1500,0,1,'','no','N',0),
	(111,44,'06','白色藤椅1+4 ',1280,0,1,'','no','N',0),
	(118,46,'01','1.2米杉木床 ',900,480,2,'1.2米杉木床','null','Y',50),
	(119,46,'01','棕垫 ',900,0,2,'','no','N',0),
	(120,46,'01','1.5米龙凤床 ',900,900,1,'1.5米龙凤床','null','Y',53),
	(121,46,'07','百姓床垫 ',900,700,1,'百姓床垫','null','Y',51),
	(122,47,'01','伟业老板台 ',1680,1480,1,'伟业老板台','null','Y',52),
	(123,47,'01','大转椅 ',0,0,1,'','no','N',0),
	(124,47,'01','三连抽屉电脑桌 1.4米',380,0,2,'','no','N',0),
	(125,47,'01','1.4米普通电脑桌 ',280,0,2,'','no','N',0),
	(126,47,'01','软靠办公椅',65,0,4,'','no','N',0),
	(127,47,'01','二门书柜 ',400,0,1,'','no','N',0),
	(128,48,'01','1.8米橡木床 深色',2000,0,1,'','no','N',0),
	(129,48,'07','1.8米百姓床垫 ',2000,700,1,'百姓床垫','null','Y',51),
	(130,48,'01','1.8米蓝梦缘床 8903 ',2000,0,1,'','no','N',0),
	(131,48,'07','1.8米百姓床垫 ',2000,700,1,'百姓床垫','null','Y',51),
	(132,48,'01','大款布艺沙发 右贵妃 4米',2000,0,1,'','no','N',0),
	(133,48,'01','大理石圆餐桌1+10 ',2000,0,1,'','no','N',0),
	(134,48,'01','1.5米欢乐少年床 923  粉色',2000,960,1,'1.5米欢乐少年床','923粉色','Y',54),
	(135,48,'01','1.5米欢乐少年床床头柜 粉色',2000,200,1,'1.5米欢乐少年床床头柜','粉色','Y',55),
	(136,48,'07','1.8米星港紫罗兰床垫 米白色',2000,1590,1,'1.8米星港紫罗兰床垫','米白色','Y',56),
	(137,48,'01','1.5米布纹面茶几 ',2000,700,1,'茶几','黑对角花','Y',71),
	(138,48,'01','1.8米护垫被 送 ',0,0,1,'护垫被','null','Y',72),
	(139,49,'01','双层实木床 ',1680,0,1,'','no','N',0),
	(140,50,'01','1.8米海棠床 ',1500,0,1,'','no','N',0),
	(141,50,'01','1.8米星港棕垫 iii',1500,0,1,'','no','N',0),
	(142,50,'01','1.5米兰梦缘床 粉色',1500,0,1,'','no','N',0),
	(143,50,'01','电视柜 一头拉 黑色',1500,0,1,'','no','N',0),
	(144,50,'01','木纹玻璃面茶几 ',1500,700,1,'茶几','黑对角花','Y',71),
	(145,51,'01','电脑桌 粉红',350,0,1,'','no','N',0),
	(146,52,'07','1.8米百姓床垫 ',650,700,1,'百姓床垫','null','Y',51),
	(147,53,'01','沙发 ',1000,0,1,'','no','N',0),
	(148,53,'06','床头柜 ',580,0,2,'','no','N',0),
	(149,54,'01','深色实木床 ',750,0,1,'','no','N',0),
	(150,55,'01','1.8米皮床 粉色',2000,0,1,'','no','N',0),
	(151,55,'07','1.8米百姓床垫 粉色',2000,700,1,'百姓床垫','null','Y',51),
	(152,55,'01','606布沙发 ',2000,3200,1,'布沙发','3*1.5m麻灰色','Y',70),
	(153,55,'01','小对角花黑玻璃茶几 ',2000,700,1,'茶几','黑对角花','Y',71),
	(154,56,'01','浅色杉木大柜 ',1180,0,1,'','no','N',0),
	(155,57,'01','开铺沙发 咖啡色',600,0,1,'','no','N',0),
	(156,58,'01','1.2米杉木床 ',1000,480,1,'1.2米杉木床','null','Y',50),
	(157,58,'01','1.2米薄棕垫 ',1000,0,1,'','no','N',0),
	(158,58,'01','友宾四门柜 ',1000,0,1,'','no','N',0),
	(159,58,'01','友宾六门柜 ',1000,0,1,'','no','N',0),
	(160,58,'01','木电视柜 ',1000,0,1,'','no','N',0),
	(161,58,'07','1.2米床听 ',0,0,1,'','no','N',0),
	(162,59,'01','鸿富情缘皮床 ',1500,0,1,'','no','N',0),
	(163,59,'06','床头柜 ',1000,0,1,'','no','N',0),
	(164,59,'07','星港康乃馨床垫 ',1500,1850,1,'星港康乃馨床垫','null','Y',57),
	(165,60,'01','浅色四门柜 ',750,0,2,'','no','N',0),
	(166,60,'01','杉木床 ',750,0,1,'','no','N',0),
	(167,61,'01','1.2米杉木床 ',500,480,2,'1.2米杉木床','null','Y',50),
	(168,61,'01','1.2米薄棕垫 ',500,0,2,'','no','N',0),
	(169,61,'01','1.4米普通办公桌 ',500,0,5,'','no','N',0),
	(170,62,'01','橡木双层床 ',700,0,1,'','no','N',0),
	(171,62,'01','1.2米百姓棕垫 ',700,0,1,'','no','N',0),
	(172,62,'01','1.8米百姓棕垫 ',700,0,1,'','no','N',0),
	(173,63,'01','圆转台1+6 茶色 ',1408,0,1,'','no','N',0),
	(174,64,'01','1.5米龙凤床 深色',1000,900,1,'1.5米龙凤床','null','Y',53),
	(175,64,'01','自产大柜深色 ',1000,0,1,'','no','N',0),
	(176,64,'01','小电视柜 ',1000,0,1,'','no','N',0),
	(177,64,'07','1.5米星港康乃馨床垫 ',1000,1850,1,'星港康乃馨床垫','null','Y',57),
	(178,64,'01','护垫被 ',0,0,1,'护垫被','null','Y',72),
	(179,65,'01','豪业餐台 茶色',820,0,1,'','no','N',0),
	(180,66,'01','白色推门衣柜 ',1700,0,1,'','no','N',0),
	(181,67,'01','棕垫 1.15米*1.9米',260,0,2,'','no','N',0),
	(182,68,'01','1.5米橡木床 深色',1000,800,1,'1.5米橡木床','深色圈花','Y',44),
	(183,68,'07','1.5米星港奥兰多床垫 ',1650,2180,1,'星港奥兰多床垫','null','Y',46),
	(184,69,'01','1.2米电脑桌 ',280,0,1,'','no','N',0),
	(185,70,'01','棕色布艺沙发 左贵妃 ',1300,0,1,'','no','N',0),
	(186,70,'01','玻璃茶几 紫色',1300,700,1,'茶几','黑对角花','Y',71),
	(187,71,'07','1.8米星港红樱桃 红',2623,0,1,'','no','N',0),
	(188,71,'07','1.8米星港康乃馨床垫 红',1000,1850,1,'星港康乃馨床垫','null','Y',57),
	(189,72,'01','六门柜 303 白色',1850,0,1,'','no','N',0),
	(190,72,'01','开铺沙发 紫色',800,0,1,'','no','N',0),
	(191,73,'01','海棠色电视柜 ',450,0,1,'','no','N',0),
	(192,73,'01','1.4米普通电脑桌 ',400,0,1,'','no','N',0),
	(193,74,'01','大理石茶几 ',1500,700,1,'茶几','黑对角花','Y',71),
	(194,75,'01','1.5米毛毯床 ',700,580,1,'1.5米毛毯床','null','Y',47),
	(195,75,'07','1.5米百姓床垫 ',200,700,1,'百姓床垫','null','Y',51),
	(196,76,'08','韩式梳妆台 ',1500,0,1,'','no','N',0),
	(197,76,'01','收拉原木色电视柜 ',1500,0,2,'','no','N',0),
	(198,76,'01','韩式电视柜 ',1500,0,1,'','no','N',0),
	(199,77,'01','8802欧尔雅四门推拉衣柜  原木色',1500,0,2,'','no','N',0),
	(200,77,'01','603欧尔雅妆台 ',1500,0,2,'','no','N',0),
	(201,78,'01','1.5米龙凤床 ',800,900,1,'1.5米龙凤床','null','Y',53),
	(202,78,'07','1.5米百姓床垫 ',800,700,1,'百姓床垫','null','Y',51),
	(203,78,'01','四门柜 海棠色',800,0,1,'','no','N',0),
	(204,79,'01','1.8米星港海棠木床 9116 ',2000,0,1,'','no','N',0),
	(205,79,'07','1.8米星港奥兰多床垫  红花',2000,2180,1,'星港奥兰多床垫','null','Y',46),
	(206,79,'01','1.8米护垫被 ',0,0,1,'护垫被','null','Y',72),
	(207,80,'01','友宾推门柜 ',900,1980,1,'推门柜','null','Y',61),
	(208,80,'01','青花瓷电脑桌',900,0,1,'','no','N',0),
	(209,81,'06','999海棠床头柜 ',900,0,1,'','no','N',0),
	(210,81,'01','办公茶水柜 ',800,0,1,'','no','N',0),
	(211,81,'01','海棠四门柜 ',800,0,1,'','no','N',0),
	(212,81,'01','付柜换锁 ',0,0,1,'','no','N',0),
	(213,82,'01','1.4米办公电脑桌 ',750,0,1,'','no','N',0),
	(214,83,'01','鸿富情缘皮床 1303 米黄色',1000,0,1,'','no','N',0),
	(215,83,'07','1.8米百姓床垫 黄色',1000,700,1,'百姓床垫','null','Y',51),
	(216,83,'06','床头柜 ',1000,0,1,'','no','N',0),
	(217,83,'01','玻璃面电视柜 黑色',1000,0,1,'','no','N',0),
	(218,83,'01','美泰居布沙发 红黑',1000,3200,1,'布沙发','3*1.5m麻灰色','Y',70),
	(219,83,'01','茶几 611 带心黑玻璃',1000,700,1,'茶几','黑对角花','Y',71),
	(220,83,'01','1.5米兰梦缘床 深色',1000,0,1,'','no','N',0),
	(221,83,'07','1.5米百姓床垫 黄色',1000,700,1,'百姓床垫','null','Y',51),
	(222,83,'01','铝合金多功能柜 ',1000,0,1,'','no','N',0),
	(223,84,'01','浅色杉木大柜 ',1180,0,1,'','no','N',0),
	(224,85,'01','1.8米橡木床 浅色',1100,0,1,'','no','N',0),
	(225,85,'07','1.8米百姓床垫 ',350,700,1,'百姓床垫','null','Y',51),
	(226,86,'01','1.8米杉木床 浅色',1000,0,1,'','no','N',0),
	(227,86,'07','1.8米星港七里香床垫 ',1100,0,1,'','no','N',0),
	(228,87,'01','圆转台1+6 ',1000,0,1,'','no','N',0),
	(229,87,'01','龙凤床 ',1000,0,1,'','no','N',0),
	(230,87,'07','百姓床垫 ',1000,700,1,'百姓床垫','null','Y',51),
	(231,88,'01','1.8米怡州龙凤床 ',1100,0,1,'','no','N',0),
	(232,88,'07','1.8米百姓床垫 ',380,700,1,'百姓床垫','null','Y',51),
	(233,89,'01','浅色杉木大柜 ',1180,0,1,'','no','N',0),
	(234,90,'01','1.5米橡木床 浅色',800,800,1,'1.5米橡木床','深色圈花','Y',44),
	(235,90,'07','1.5米星港七里香床垫  红',800,0,1,'','no','N',0),
	(236,90,'07','1.8米百姓床垫 ',800,700,1,'百姓床垫','null','Y',51),
	(237,90,'01','护垫被 送 ',0,0,1,'护垫被','null','Y',72),
	(238,90,'01','1.8米橡木床 浅色',800,0,1,'','no','N',0),
	(239,90,'01','床头柜 送 ',0,0,1,'','no','N',0),
	(240,91,'01','1.8米宝石蓝床 ',1000,0,1,'','no','N',0),
	(241,91,'07','1.8米星港七里香床垫 ',1880,0,1,'','no','N',0),
	(242,91,'01','护垫被 送 ',0,0,1,'护垫被','null','Y',72),
	(243,92,'01','皮沙发866 ',3800,0,1,'','no','N',0),
	(244,92,'01','玻璃茶几 黑色',2000,700,1,'茶几','黑对角花','Y',71),
	(245,93,'01','电脑桌 黑色',500,0,1,'','no','N',0),
	(246,93,'01','浅色四门柜 ',500,0,1,'','no','N',0),
	(247,94,'01','圆深色大理石餐桌1+8 ',1900,0,1,'','no','N',0),
	(248,95,'01','皮沙发899 ',2000,0,1,'','no','N',0),
	(249,95,'01','玻璃茶几 ',2000,700,1,'茶几','黑对角花','Y',71),
	(250,95,'01','豪业圆转椅 ',2000,0,1,'','no','N',0),
	(251,95,'07','星港奥兰多床垫 ',2000,2180,1,'星港奥兰多床垫','null','Y',46),
	(252,95,'01','海棠色榉木床 ',2000,0,1,'','no','N',0),
	(253,95,'06','床头柜 ',2000,0,2,'','no','N',0),
	(254,95,'01','五门大柜 ',2000,0,1,'','no','N',0),
	(255,95,'01','白色榉木柜 ',2000,0,1,'','no','N',0),
	(256,95,'01','铁柜 ',2000,0,1,'','no','N',0),
	(257,95,'01','顾森电视柜 ',2000,0,1,'','no','N',0),
	(258,95,'01','间庭柜 ',2000,0,1,'','no','N',0),
	(259,95,'01','护垫被 送',0,0,1,'护垫被','null','Y',72),
	(260,95,'01','枕头 送',0,0,1,'','no','N',0),
	(261,95,'01','铁挂衣架 送',0,0,1,'','no','N',0),
	(262,96,'01','1.5米怡州龙凤床 ',700,0,1,'','no','N',0),
	(263,96,'07','1.5米百姓床垫 红色',700,700,1,'百姓床垫','null','Y',51),
	(264,96,'06','床头柜 ',100,0,1,'','no','N',0),
	(265,97,'01','1.8米橡木床 深色',600,0,1,'','no','N',0),
	(266,98,'01','小款木门沙发 五件套',1000,0,2,'','no','N',0),
	(267,99,'01','俊琪布艺沙发 不带单位右贵妃 ',1000,0,1,'','no','N',0),
	(268,99,'01','开铺沙发 咖啡色',1000,0,1,'','no','N',0),
	(269,99,'01','303妆台 奶白色 ',1000,0,1,'','no','N',0),
	(270,99,'01','小皮转椅 ',1000,0,1,'','no','N',0),
	(271,100,'01','1.5米橡木床 浅色',1000,800,1,'1.5米橡木床','深色圈花','Y',44),
	(272,100,'07','1.5米百姓床垫 ',1000,700,1,'百姓床垫','null','Y',51),
	(273,100,'01','床头柜 ',1000,0,2,'','no','N',0),
	(274,100,'01','1.8米龙凤床 ',1000,0,1,'','no','N',0),
	(275,100,'07','1.8米星港七里香床垫 ',1000,0,1,'','no','N',0),
	(276,100,'01','1.8米护垫被 ',0,0,1,'护垫被','null','Y',72),
	(277,101,'01','海棠木大柜 ',2490,0,1,'','no','N',0),
	(278,102,'01','1.2米杉木床 ',500,480,2,'1.2米杉木床','null','Y',50),
	(279,102,'01','1.2米薄棕垫 ',500,0,2,'','no','N',0),
	(280,103,'01','浅色杉木大柜 ',1180,0,1,'','no','N',0),
	(281,104,'01','美泰居1011A ',2580,2580,1,'美泰居1011A','null','Y',75),
	(282,105,'01','1.8米深色床 ',1000,0,1,'','no','N',0),
	(283,105,'07','百姓床垫 ',1000,700,1,'百姓床垫','null','Y',51),
	(284,105,'01','六门杉木柜 ',1000,0,1,'','no','N',0),
	(285,106,'01','1.5米橡木床 浅色',1100,800,1,'1.5米橡木床','深色圈花','Y',44),
	(286,106,'07','1.5米百姓床垫 ',1100,700,1,'百姓床垫','null','Y',51),
	(287,106,'01','龙凤床1.8米 ',1100,0,1,'','no','N',0),
	(288,106,'07','1.8米星港七里香床垫 ',1100,0,1,'','no','N',0),
	(289,106,'01','大款木沙发 ',1100,0,1,'','no','N',0),
	(290,106,'01','木妆台 ',1100,0,1,'','no','N',0),
	(291,106,'06','床头柜 999',1100,0,1,'','no','N',0),
	(292,106,'01','收拉餐桌 茶色 ',1100,0,1,'','no','N',0),
	(293,107,'01','普通大理石餐桌 ',1180,0,1,'','no','N',0),
	(294,108,'01','1.8米橡木柜 深色',600,0,1,'','no','N',0),
	(295,108,'06','床头柜 ',600,0,2,'','no','N',0),
	(296,108,'01','三门书柜 ',600,0,1,'','no','N',0),
	(297,108,'01','1.8米百姓棕垫 ',600,0,1,'','no','N',0),
	(298,109,'01','1.8米橡木床 雕花',1000,0,1,'','no','N',0),
	(299,109,'07','1.8米星港七里香床垫 ',1800,0,1,'','no','N',0),
	(300,110,'01','1.8米松木床 ',1200,0,1,'','no','N',0),
	(301,110,'07','1.8米百姓床垫 ',1200,700,1,'百姓床垫','null','Y',51),
	(302,110,'01','1.8米大理石茶几 浅色',1200,700,1,'茶几','黑对角花','Y',71),
	(303,111,'01','1.5米橡木床 浅色',900,800,1,'1.5米橡木床','深色圈花','Y',44),
	(304,111,'01','单长木沙发 ',450,0,1,'','no','N',0),
	(305,112,'01','1.8米橡木床 浅色',1000,0,1,'','no','N',0),
	(306,112,'07','1.8米百姓床垫 ',400,700,1,'百姓床垫','null','Y',51),
	(307,113,'01','1.8米松木床 ',2000,0,1,'','no','N',0),
	(308,113,'07','1.8米百姓床垫 ',850,700,1,'百姓床垫','null','Y',51),
	(309,114,'01','1.8米老板桌 ',1000,0,1,'','no','N',0),
	(310,114,'01','长皮沙发 ',1000,0,1,'','no','N',0),
	(311,114,'01','四方茶几 ',1000,700,1,'茶几','黑对角花','Y',71),
	(312,114,'01','大转椅 ',1000,0,1,'','no','N',0),
	(313,115,'01','星港9017 1.8米x2米 ',2000,0,1,'','no','N',0),
	(314,115,'01','1.8米星港康乃馨床垫 ',2000,1850,1,'星港康乃馨床垫','null','Y',57),
	(315,115,'07','1.5米星港康乃馨床垫 ',2000,1850,1,'星港康乃馨床垫','null','Y',57),
	(316,115,'01','1.5米怡州床',2000,0,1,'','no','N',0),
	(317,115,'01','浅粉色妆台 ',2000,0,1,'','no','N',0),
	(318,115,'01','家怡厚布沙发 ',2000,3200,1,'布沙发','3*1.5m麻灰色','Y',70),
	(319,115,'06','床头柜 ',2000,0,1,'','no','N',0),
	(320,116,'01','烟紫情缘床 ',1500,0,1,'','no','N',0),
	(321,116,'07','1.8米星港七里香床垫 ',1500,0,1,'','no','N',0),
	(322,116,'01','普通大理石餐桌 ',1500,0,1,'','no','N',0),
	(323,117,'01','303大床 ',1000,0,1,'','no','N',0),
	(324,117,'06','床头柜 ',1000,0,1,'','no','N',0),
	(325,117,'07','1.8米百姓床垫 粉色',1000,700,1,'百姓床垫','null','Y',51),
	(326,118,'01','1.8米星港床9116 ',2000,0,1,'','no','N',0),
	(327,118,'07','1.8米星港康乃馨床垫 ',2000,1850,1,'星港康乃馨床垫','null','Y',57),
	(328,119,'01','1.8米星港皮床 ',2000,0,1,'','no','N',0),
	(329,119,'07','1.8米星港康乃馨床垫 ',2000,1850,1,'星港康乃馨床垫','null','Y',57),
	(330,119,'01','韩式妆台 ',2000,0,1,'','no','N',0),
	(331,119,'01','麻灰色布沙发 ',2000,3200,1,'布沙发','3*1.5m麻灰色','Y',70),
	(332,119,'01','茶几 黑色',2000,700,1,'茶几','黑对角花','Y',71),
	(333,119,'01','电视柜 黑色',2000,0,1,'','no','N',0),
	(334,119,'01','酒柜 9364',2000,2000,1,'酒柜','1.5m936','N',16),
	(335,119,'01','伊兰贝儿大理石餐桌 1+6',2000,2380,1,'伊兰贝儿大理石餐桌','null','Y',59),
	(336,119,'01','1.8米牛脑壳自产床 黄色 ',2000,1080,1,'1.8米牛脑壳自产床','黄色','Y',40),
	(337,119,'07','1.8米百姓床垫 ',2000,700,1,'百姓床垫','null','Y',51),
	(338,119,'01','床头柜 送',0,0,1,'床头柜','送','Y',74),
	(339,119,'01','护垫被 送',0,0,1,'护垫被','null','Y',72),
	(340,120,'01','靠背椅 ',100,0,6,'','no','N',0),
	(341,121,'01','友宾四门柜 深色',700,0,1,'','no','N',0),
	(342,122,'01','1.5米王朝软靠床 银灰色',1500,0,1,'','no','N',0),
	(343,122,'07','1.5米星港康乃馨床垫 ',1500,1850,1,'星港康乃馨床垫','null','Y',57),
	(344,123,'01','三门鞋柜 香槟色',700,0,1,'','no','N',0),
	(345,124,'01','开铺沙发 咖啡色',500,0,1,'','no','N',0),
	(346,125,'01','1.8米韩式床 ',1500,0,1,'','no','N',0),
	(347,125,'07','1.8米星港七里香床垫 ',1500,0,1,'','no','N',0),
	(348,125,'01','1.5米韩式床 ',1500,0,1,'','no','N',0),
	(349,125,'07','1.8米星港七里香床垫 ',1500,0,1,'','no','N',0),
	(350,125,'02','奈美轩沙发床 紫色',1000,0,1,'','no','N',0),
	(351,125,'01','欧式电视柜 ',1200,0,1,'','no','N',0),
	(352,125,'01','欧式茶几 ',1200,700,1,'茶几','黑对角花','Y',71),
	(353,126,'01','书柜 ',380,0,1,'','no','N',0),
	(354,127,'01','1.3米大理石茶几 深色',700,700,1,'茶几','黑对角花','Y',71),
	(355,127,'01','梳妆台 粉红',800,0,1,'','no','N',0),
	(356,128,'01','1.5米橡木床 浅色',800,800,2,'1.5米橡木床','深色圈花','Y',44),
	(357,128,'07','1.5米百姓床垫 ',600,700,2,'百姓床垫','null','Y',51),
	(358,129,'01','普通大理石餐桌1+6 ',1080,0,1,'','no','N',0),
	(359,130,'01','1.8米福美居床 ',1180,0,1,'','no','N',0),
	(360,130,'01','星港白玉兰床垫 ',1180,0,1,'','no','N',0),
	(361,130,'01','护垫被 送',0,0,1,'护垫被','null','Y',72),
	(362,132,'07','深咖非色右贵妃 ',3080,0,1,'','no','N',0),
	(363,133,'07','友宾六门杉木柜 ',1200,0,2,'','no','N',0),
	(364,133,'07','1.4米定做长沙发 ',680,0,1,'','no','N',0),
	(365,137,'','1.4米 三连锁办工桌 ',400,0,1,'','','',NULL),
	(366,137,'','1.4米 普通办工桌 ',400,0,1,'','','',NULL),
	(367,138,'','浅色推门柜 ',1700,0,1,'','','',NULL),
	(368,139,'','二门书柜 红色 ',400,0,1,'','','',NULL),
	(369,140,'','咖啡色开铺沙发 ',560,0,1,'','','',NULL),
	(370,141,'','星港9107木床 ',1000,0,1,'','','',NULL),
	(371,141,'','星港康乃馨床垫 ',1000,0,1,'','','',NULL),
	(372,141,'','1.3米黑玻璃茶几 ',1000,0,1,'','','',NULL),
	(373,141,'','床头柜 ',200,0,1,'','','',NULL),
	(374,141,'','蓝课桌 ',150,0,1,'','','',NULL),
	(375,142,'','白色推门柜 ',1400,0,1,'','','',NULL),
	(376,142,'','书柜带电脑桌 ',1400,0,1,'','','',NULL),
	(377,142,'','椅子 ',200,0,1,'','','',NULL),
	(378,143,'','1.5米深色杉木柜 ',800,0,2,'','','',NULL),
	(379,143,'','1.5米百姓床垫 ',800,0,2,'','','',NULL),
	(380,143,'','1.2米书桌 ',800,0,2,'','','',NULL),
	(381,144,'','1.5米兰梦缘蓝圆圈床 ',1400,0,1,'','','',NULL),
	(382,144,'','1.5米百姓床垫 黄色 ',800,0,1,'','','',NULL),
	(383,145,'','1.5米 龙凤床 ',950,0,1,'','','',NULL),
	(384,145,'','1.5米 百姓棕垫 ',950,0,1,'','','',NULL),
	(385,146,'','蓝色大柜 ',1880,0,1,'','','',NULL),
	(386,146,'','1.8米床 ',1000,0,1,'','','',NULL),
	(387,146,'','妆台 ',1000,0,1,'','','',NULL),
	(388,146,'','灰色布艺沙发 3.5米右贵妃 ',3080,0,1,'','','',NULL),
	(389,146,'','黑色茶几 ',700,0,1,'','','',NULL),
	(390,146,'','电视柜 ',780,0,1,'','','',NULL),
	(391,146,'','黑色电脑桌 ',300,0,1,'','','',NULL),
	(392,146,'','星港康乃馨床垫1.8米 ',1850,0,1,'','','',NULL),
	(393,146,'','鞋柜 ',700,0,1,'','','',NULL),
	(394,146,'','护垫被 送 ',0,0,1,'护垫被','null','Y',72),
	(395,146,'','穿衣镜 ',0,0,1,'','','',NULL),
	(396,147,'','606布艺沙发 ',2000,0,1,'','','',NULL),
	(397,147,'','浅色杉木柜 胜老板 ',1971,0,1,'','','',NULL),
	(398,148,'','899皮沙发 ',5000,0,1,'','','',NULL),
	(399,148,'','1.3米黑玻璃茶几 ',800,0,1,'','','',NULL),
	(400,148,'','星港9038皮床 ',2680,0,1,'','','',NULL),
	(401,148,'','床头柜 ',560,0,1,'','','',NULL),
	(402,148,'','星港康乃馨床垫 ',1850,0,1,'','','',NULL),
	(403,148,'','韩式大柜 ',2180,0,1,'','','',NULL),
	(404,148,'','韩式妆台 ',900,0,1,'','','',NULL),
	(405,148,'','1650电视柜 ',900,0,1,'','','',NULL),
	(406,148,'','王朝五门柜 ',2480,0,1,'','','',NULL),
	(407,149,'','灰罗布布艺沙发 左贵妃 3.6米 ',3600,0,1,'','','',NULL),
	(408,149,'','611茶几 ',600,0,1,'','','',NULL),
	(409,150,'','星港2626红樱桃木床 ',2000,0,2,'','','',NULL),
	(410,150,'','1.8米星港康乃馨床垫 ',2000,0,2,'','','',NULL),
	(411,150,'','1.5米深色橡木床 ',2000,0,2,'','','',NULL),
	(412,150,'','1.5米星港七里香 ',2012,0,2,'','','',NULL),
	(413,150,'','茶色二合一项目园转台 ',1380,0,1,'','','',NULL),
	(414,150,'','床头柜一个 ',200,0,1,'','','',NULL),
	(415,150,'','橡木餐桌 ',1380,0,1,'','','',NULL),
	(416,150,'','1.5米 护垫被 ',0,0,1,'护垫被','null','Y',72),
	(417,150,'','1.8米 护垫被 ',0,0,1,'护垫被','null','Y',72),
	(418,151,'','1.8米深色橡木床 ',1000,0,1,'','','',NULL),
	(419,151,'','1.8米百姓床垫 ',782,0,1,'','','',NULL),
	(420,151,'','床头柜 ',200,0,2,'','','',NULL),
	(421,152,'','1.5米浅色橡木柜 松木 ',700,0,1,'','','',NULL),
	(422,152,'','1.5米百姓床垫 ',675,0,1,'','','',NULL),
	(423,152,'','床头柜 ',200,0,2,'','','',NULL),
	(424,153,'','大理石餐桌八件套 ',200,0,1,'','','',NULL),
	(425,154,'','浅色杉木大柜 ',1200,0,1,'','','',NULL),
	(426,154,'','妆台 ',551,0,1,'','','',NULL),
	(427,155,'','办公茶几 ',350,0,1,'','','',NULL),
	(428,156,'','深色杉木大柜 ',1200,0,1,'','','',NULL),
	(429,157,'','1.5米杉木床 ',500,0,1,'','','',NULL),
	(430,157,'','1.5米百姓床垫 ',500,0,1,'','','',NULL),
	(431,158,'','四门柜 红 ',800,0,1,'','','',NULL),
	(432,158,'','四门柜 海棠色 ',800,0,1,'','','',NULL),
	(433,158,'','1.5米杉木床 ',500,0,1,'','','',NULL),
	(434,158,'','普通棕垫 ',280,0,1,'','','',NULL),
	(435,159,'','带心黑茶几 ',1020,0,1,'','','',NULL),
	(436,159,'','1.6米黑玻璃电视柜 ',700,0,1,'','','',NULL),
	(437,160,'','1.4米电脑桌 ',300,0,1,'','','',NULL),
	(438,161,'','橡木收拉电视柜 ',1000,0,1,'','','',NULL),
	(439,161,'','茶色圆餐桌 ',1000,0,1,'','','',NULL),
	(440,161,'','1.8米新软海棠床 ',1000,0,1,'','','',NULL),
	(441,161,'','星港棕榈泉手工床垫 ',1000,0,1,'','','',NULL),
	(442,161,'','课桌 送 ',0,0,1,'','','',NULL),
	(443,161,'','护垫被 ',0,0,1,'','','',NULL),
	(444,161,'','枕头 ',0,0,1,'','','',NULL),
	(445,161,'','转盘 ',0,0,1,'','','',NULL),
	(446,161,'','1.2米星港手工棕垫 ',1000,0,1,'','','',NULL),
	(447,162,'','1.5米杉木床 ',450,0,1,'','','',NULL),
	(448,163,'','1.2米百姓床垫 ',400,0,1,'','','',NULL),
	(449,164,'','双层床 ',1000,0,1,'','','',NULL),
	(450,164,'','棕垫 ',1000,0,2,'','','',NULL),
	(451,164,'','8903兰梦缘1.5米床 ',1000,0,1,'','','',NULL),
	(452,164,'','1.5米百姓床垫 ',1000,0,1,'','','',NULL),
	(453,165,'','四门柜浅色1.2米 ',1000,0,2,'','','',NULL),
	(454,165,'','1.5米浅色杉木床 ',1000,0,2,'','','',NULL),
	(455,165,'','1.5米百姓棕垫 ',1000,0,2,'','','',NULL),
	(456,166,'','1.8米橡木床 ',900,0,1,'','','',NULL),
	(457,166,'','1.8米星港满天星床垫 ',800,0,1,'','','',NULL),
	(458,166,'','鞋柜 ',830,0,1,'','','',NULL),
	(459,166,'','友宾大柜 ',720,0,1,'','','',NULL),
	(460,166,'','白色电视柜 ',700,0,1,'','','',NULL),
	(461,166,'','1.8米星港满天星床垫 ',830,0,1,'','','',NULL),
	(462,167,'','美泰居左贵妃 ',3000,0,1,'','','',NULL),
	(463,167,'','白色茶几 ',800,0,1,'','','',NULL),
	(464,168,'','二门书柜 ',450,NULL,1,'','','',NULL),
	(465,168,'','青花瓷电脑桌 ',450,NULL,1,'','','',NULL),
	(466,169,'','633-2奈美轩沙发床（抱枕两个） ',900,NULL,1,'','','',NULL);

/*!40000 ALTER TABLE `jxc_order_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jxc_order_owner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jxc_order_owner`;

CREATE TABLE `jxc_order_owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_code` varchar(20) NOT NULL,
  `owner_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `jxc_order_owner` WRITE;
/*!40000 ALTER TABLE `jxc_order_owner` DISABLE KEYS */;

INSERT INTO `jxc_order_owner` (`id`, `owner_code`, `owner_name`)
VALUES
	(1,'01','文清平'),
	(2,'02','唐琪'),
	(3,'03','小游'),
	(4,'04','曾曼');

/*!40000 ALTER TABLE `jxc_order_owner` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jxc_std_goodsinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jxc_std_goodsinfo`;

CREATE TABLE `jxc_std_goodsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` varchar(20) NOT NULL,
  `standard` varchar(2048) NOT NULL,
  `productedBy` varchar(512) NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `jxc_std_goodsinfo` WRITE;
/*!40000 ALTER TABLE `jxc_std_goodsinfo` DISABLE KEYS */;

INSERT INTO `jxc_std_goodsinfo` (`id`, `name`, `type`, `standard`, `productedBy`, `updatetime`)
VALUES
	(44,'深蓝色布艺沙发','sofa','','广州','2014-04-20 13:06:54'),
	(45,'蓝灰色布艺沙发','sofa','','广州','2014-04-20 13:16:47'),
	(46,'棕黄色布艺沙发','sofa','','未知','2014-04-20 13:17:53'),
	(47,'银色布艺沙发','sofa','','未知','2014-04-20 13:19:20'),
	(48,'实木小茶桌','desk','','广州','2014-04-20 13:21:09'),
	(49,'黑白间色布艺沙发','sofa','','未知','2014-04-20 13:22:36'),
	(50,'浅黄色高档布艺沙发','sofa','','未知','2014-04-20 13:25:59'),
	(51,'藏青色布艺沙发','sofa','','未知','2014-04-20 13:27:46'),
	(52,'蓝白布艺沙发','sofa','','未知','2014-04-20 13:29:36'),
	(53,'橡皮凳','other','','未知','2014-04-20 13:30:09'),
	(54,'高档实木餐桌套装','desk','','未知','2014-04-20 13:30:51'),
	(55,'深色实木床01','bed','','未知','2014-04-20 13:32:59'),
	(56,'深色梳妆台','other','','未知','2014-04-20 13:33:26'),
	(57,'蓝白色套房','taofang','','未知','2014-04-20 13:34:02'),
	(58,'粉红色套房','taofang','','未知','2014-04-20 13:34:33'),
	(59,'书柜式儿童套房','taofang','','未知','2014-04-20 13:35:10'),
	(60,'浅色实木床01','bed','','未知','2014-04-20 13:36:01'),
	(62,'浅色实木床02','bed','','未知','2014-04-20 13:36:36'),
	(63,'浅色实木床03','bed','','未知','2014-04-20 13:43:21'),
	(64,'浅黄色皮床','bed','','未知','2014-04-20 13:43:51'),
	(65,'高档浅色皮床','bed','','未知','2014-04-20 13:45:13'),
	(67,'深色实木床01','bed','','未知','2014-04-20 13:45:51'),
	(68,'深色实木床02','other','','未知','2014-04-20 13:46:10'),
	(69,'深色皮床02','bed','','未知','2014-04-20 13:46:49'),
	(70,'深色实木床02','bed','','未知','2014-04-20 13:48:40');

/*!40000 ALTER TABLE `jxc_std_goodsinfo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jxc_std_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jxc_std_item`;

CREATE TABLE `jxc_std_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `STD_type` varchar(30) NOT NULL DEFAULT '07',
  `STD_name` varchar(30) NOT NULL,
  `STD_price` int(11) NOT NULL COMMENT '标准售价',
  `PRC_price` int(11) DEFAULT NULL COMMENT '进价',
  `standard` varchar(1024) NOT NULL DEFAULT 'no' COMMENT '商品标准',
  `updatetime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `jxc_std_item` WRITE;
/*!40000 ALTER TABLE `jxc_std_item` DISABLE KEYS */;

INSERT INTO `jxc_std_item` (`id`, `STD_type`, `STD_name`, `STD_price`, `PRC_price`, `standard`, `updatetime`)
VALUES
	(38,'','9017星港皮床',3888,NULL,'null','2014-03-05'),
	(39,'','1.8米星港康乃馨床垫',1850,NULL,'黄','2014-03-05'),
	(40,'','1.8米牛脑壳自产床',1080,NULL,'黄色','2014-03-05'),
	(41,'','1.8米百姓床垫',800,NULL,'黄色','2014-03-05'),
	(42,'','9038星港皮床',3280,NULL,'null','2014-03-05'),
	(43,'','1.5米蓝梦缘床',900,NULL,'粉色','2014-03-05'),
	(44,'','1.5米橡木床',800,NULL,'深色圈花','2014-03-05'),
	(45,'','1.5米星港紫罗兰床垫',1380,NULL,'null','2014-03-05'),
	(46,'','星港奥兰多床垫',2180,NULL,'null','2014-03-05'),
	(47,'','1.5米毛毯床',580,NULL,'null','2014-03-05'),
	(48,'','1.5米百姓床垫',600,NULL,'null','2014-03-05'),
	(49,'','皮沙发806',5000,NULL,'黄色','2014-03-05'),
	(50,'','1.2米杉木床',480,NULL,'null','2014-03-05'),
	(51,'','百姓床垫',700,NULL,'null','2014-03-05'),
	(52,'','伟业老板台',1480,NULL,'null','2014-03-05'),
	(53,'','1.5米龙凤床',900,NULL,'null','2014-03-05'),
	(54,'','1.5米欢乐少年床',960,NULL,'923粉色','2014-03-05'),
	(55,'','1.5米欢乐少年床床头柜',200,NULL,'粉色','2014-03-05'),
	(56,'','1.8米星港紫罗兰床垫',1590,NULL,'米白色','2014-03-05'),
	(57,'','星港康乃馨床垫',1850,NULL,'null','2014-03-05'),
	(58,'','圆转台1 6',1408,NULL,'茶色','2014-03-05'),
	(59,'','伊兰贝儿大理石餐桌',2380,NULL,'null','2014-03-05'),
	(60,'','伊兰贝儿大理石餐椅',0,NULL,'null','2014-03-05'),
	(61,'','推门柜',1980,NULL,'null','2014-03-05'),
	(62,'','韩式梳妆台',1280,NULL,'白色','2014-03-05'),
	(64,'','星港天堂鸟床垫',1980,NULL,'null','2014-03-05'),
	(65,'','1.3米圆大理石餐桌',1680,NULL,'null','2014-03-05'),
	(66,'','1.3米大理石茶几',980,NULL,'深色','2014-03-05'),
	(67,'','美泰居沙发',2180,NULL,'null','2014-03-05'),
	(68,'','白色藤椅1 4',1280,NULL,'null','2014-03-05'),
	(69,'','圆转台1 6',1408,NULL,'茶色','2014-03-05'),
	(70,'','布沙发 ',3200,NULL,'3*1.5m麻灰色','2014-03-05'),
	(71,'','茶几 ',700,NULL,'黑对角花','2014-03-05'),
	(72,'','护垫被 ',0,NULL,'null','2014-03-31'),
	(73,'','床头柜 ',200,NULL,'送','2014-04-09'),
	(74,'','床头柜 ',0,NULL,'送','2014-04-09'),
	(75,'','美泰居1011A ',2580,NULL,'null','2014-04-09'),
	(76,'','1.8米胭紫情缘床 ',1580,NULL,'null','2014-04-09');

/*!40000 ALTER TABLE `jxc_std_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jxc_std_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jxc_std_price`;

CREATE TABLE `jxc_std_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `STD_GOODS_ID` varchar(15) NOT NULL,
  `price` int(11) NOT NULL,
  `priceHistory` varchar(128) NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `jxc_std_price` WRITE;
/*!40000 ALTER TABLE `jxc_std_price` DISABLE KEYS */;

INSERT INTO `jxc_std_price` (`id`, `STD_GOODS_ID`, `price`, `priceHistory`, `updatetime`)
VALUES
	(40,'44',6000,'0','2014-04-20 13:06:54'),
	(41,'45',6000,'0','2014-04-20 13:16:47'),
	(42,'46',5000,'0','2014-04-20 13:17:53'),
	(43,'47',5000,'0','2014-04-20 13:19:20'),
	(44,'48',2000,'0','2014-04-20 13:21:09'),
	(45,'49',5000,'0','2014-04-20 13:22:36'),
	(46,'50',6000,'0','2014-04-20 13:25:59'),
	(47,'51',5000,'0','2014-04-20 13:27:46'),
	(48,'52',5000,'0','2014-04-20 13:29:36'),
	(49,'53',1000,'0','2014-04-20 13:30:09'),
	(50,'54',5000,'0','2014-04-20 13:30:51'),
	(51,'55',2000,'0','2014-04-20 13:32:59'),
	(52,'56',2000,'0','2014-04-20 13:33:26'),
	(53,'57',5000,'0','2014-04-20 13:34:02'),
	(54,'58',3000,'0','2014-04-20 13:34:33'),
	(55,'59',3000,'0','2014-04-20 13:35:10'),
	(56,'60',2000,'0','2014-04-20 13:36:01'),
	(57,'62',2000,'0','2014-04-20 13:36:36'),
	(58,'63',2000,'0','2014-04-20 13:43:21'),
	(59,'64',2000,'0','2014-04-20 13:43:51'),
	(60,'65',3000,'0','2014-04-20 13:45:13'),
	(61,'67',2000,'0','2014-04-20 13:45:51'),
	(62,'68',2000,'0','2014-04-20 13:46:10'),
	(63,'69',3000,'0','2014-04-20 13:46:49'),
	(64,'70',2000,'0','2014-04-20 13:48:40');

/*!40000 ALTER TABLE `jxc_std_price` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jxc_std_storage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jxc_std_storage`;

CREATE TABLE `jxc_std_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `STD_GOODS_ID` varchar(15) NOT NULL,
  `storage` varchar(15) NOT NULL,
  `fromStorage` varchar(15) NOT NULL,
  `stoke` int(10) NOT NULL DEFAULT '1',
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `jxc_std_storage` WRITE;
/*!40000 ALTER TABLE `jxc_std_storage` DISABLE KEYS */;

INSERT INTO `jxc_std_storage` (`id`, `STD_GOODS_ID`, `storage`, `fromStorage`, `stoke`, `updatetime`)
VALUES
	(40,'44','01','00',1,'2014-04-20 13:06:54'),
	(41,'45','01','01',2,'2014-04-20 13:16:47'),
	(42,'46','01','00',1,'2014-04-20 13:17:53'),
	(43,'47','01','06',1,'2014-04-20 13:19:20'),
	(44,'48','01','06',1,'2014-04-20 13:21:09'),
	(45,'49','01','00',1,'2014-04-20 13:22:36'),
	(46,'50','01','00',1,'2014-04-20 13:25:59'),
	(47,'51','01','00',1,'2014-04-20 13:27:46'),
	(48,'52','01','00',1,'2014-04-20 13:29:36'),
	(49,'53','01','00',1,'2014-04-20 13:30:09'),
	(50,'54','01','00',1,'2014-04-20 13:30:51'),
	(51,'55','02','00',1,'2014-04-20 13:32:59'),
	(52,'56','01','00',1,'2014-04-20 13:33:26'),
	(53,'57','02','00',1,'2014-04-20 13:34:02'),
	(54,'58','02','00',1,'2014-04-20 13:34:33'),
	(55,'59','02','00',2,'2014-04-20 13:35:10'),
	(56,'60','02','00',1,'2014-04-20 13:36:01'),
	(57,'62','02','00',1,'2014-04-20 13:36:36'),
	(58,'63','02','00',1,'2014-04-20 13:43:21'),
	(59,'64','02','00',1,'2014-04-20 13:43:51'),
	(60,'65','02','00',1,'2014-04-20 13:45:13'),
	(61,'67','02','00',1,'2014-04-20 13:45:51'),
	(62,'68','02','00',1,'2014-04-20 13:46:10'),
	(63,'69','02','00',2,'2014-04-20 13:46:49'),
	(64,'70','02','00',2,'2014-04-20 13:48:40');

/*!40000 ALTER TABLE `jxc_std_storage` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
