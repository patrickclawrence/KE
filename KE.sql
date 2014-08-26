-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: KE
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(25,'Can add battle user',9,'add_battleuser'),(26,'Can change battle user',9,'change_battleuser'),(27,'Can delete battle user',9,'delete_battleuser'),(28,'Can add battle log',10,'add_battlelog'),(29,'Can change battle log',10,'change_battlelog'),(30,'Can delete battle log',10,'delete_battlelog');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (3,'pbkdf2_sha256$12000$I7BXuDKX4Jyp$3OOHXOayyEpJF2aoRXFBBRtGkEAXiIJjE4ptvT4jYBk=','2014-08-23 00:40:23',1,'patrick','Patrick','Lawrence','patrickclawrence@gmail.com',1,1,'2014-08-23 00:40:01'),(4,'pbkdf2_sha256$12000$2MbPFITE6tvh$mMHkGvk1nihwMToDxc1pZHKAMu7vellnj9EZF3LbsLA=','2014-08-23 00:41:10',1,'monkey','Monkey','Man','monk@tree.com',1,1,'2014-08-23 00:41:10');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (25,3,1),(26,3,2),(27,3,3),(28,3,4),(29,3,5),(30,3,6),(31,3,7),(32,3,8),(33,3,9),(34,3,10),(35,3,11),(36,3,12),(37,3,13),(38,3,14),(39,3,15),(40,3,16),(41,3,17),(42,3,18),(43,3,25),(44,3,26),(45,3,27),(46,3,28),(47,3,29),(48,3,30),(1,4,1),(2,4,2),(3,4,3),(4,4,4),(5,4,5),(6,4,6),(7,4,7),(8,4,8),(9,4,9),(10,4,10),(11,4,11),(12,4,12),(13,4,13),(14,4,14),(15,4,15),(16,4,16),(17,4,17),(18,4,18),(19,4,25),(20,4,26),(21,4,27),(22,4,28),(23,4,29),(24,4,30);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (10,'2014-08-23 00:41:10',3,4,'4','monkey',1,''),(11,'2014-08-23 00:41:46',3,4,'4','monkey',2,'Changed first_name, last_name, email, is_staff and is_superuser.'),(12,'2014-08-23 00:42:18',3,9,'3','Battle User Jane Doe',1,''),(13,'2014-08-23 01:08:50',3,4,'4','monkey',2,'Changed user_permissions.'),(14,'2014-08-23 01:09:34',3,4,'3','patrick',2,'Changed first_name and last_name.'),(15,'2014-08-23 01:09:44',3,4,'3','patrick',2,'Changed user_permissions.'),(16,'2014-08-23 01:38:04',3,9,'4','Battle User poppa diddy',3,''),(17,'2014-08-23 01:40:47',3,9,'5','Battle User poppa diddy',2,'Changed created and last_seen.'),(18,'2014-08-25 11:44:39',3,9,'15','Battle User TestUser1 TestUser1',1,''),(19,'2014-08-26 15:15:17',3,4,'3','patrick',2,'Changed password.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(9,'battle user','users','battleuser'),(10,'battle log','users','battlelog');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('us6kj3w5ab1txju1rv24yglvyzvgoo1o','OTk5YWJiYjY4NWNlZDVkNWM4YzgwMTUzNmY2ZDBhNWVmZDZjMzNiZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=','2014-09-06 00:40:23');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_battlelog`
--

DROP TABLE IF EXISTS `users_battlelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_battlelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attacker_id` int(11) NOT NULL,
  `defender_id` int(11) NOT NULL,
  `winner_id` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_battlelog_f13d64eb` (`attacker_id`),
  KEY `users_battlelog_74a82789` (`defender_id`),
  KEY `users_battlelog_bfcfac82` (`winner_id`),
  CONSTRAINT `attacker_id_refs_id_d6b5c398` FOREIGN KEY (`attacker_id`) REFERENCES `users_battleuser` (`id`),
  CONSTRAINT `defender_id_refs_id_d6b5c398` FOREIGN KEY (`defender_id`) REFERENCES `users_battleuser` (`id`),
  CONSTRAINT `winner_id_refs_id_d6b5c398` FOREIGN KEY (`winner_id`) REFERENCES `users_battleuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_battlelog`
--

LOCK TABLES `users_battlelog` WRITE;
/*!40000 ALTER TABLE `users_battlelog` DISABLE KEYS */;
INSERT INTO `users_battlelog` VALUES (4,14,1,1,'2014-08-25 13:51:30','2014-08-25 13:51:30'),(5,14,1,1,'2014-08-25 21:08:07','2014-08-25 21:08:07'),(6,14,1,1,'2014-08-25 21:08:10','2014-08-25 21:08:10'),(7,14,1,1,'2014-08-25 21:08:11','2014-08-25 21:08:11'),(8,14,1,1,'2014-08-25 21:08:14','2014-08-25 21:08:14'),(9,14,1,1,'2014-08-25 21:08:16','2014-08-25 21:08:16'),(10,14,1,1,'2014-08-25 21:08:17','2014-08-25 21:08:17'),(11,14,1,1,'2014-08-26 15:23:16','2014-08-26 15:23:16');
/*!40000 ALTER TABLE `users_battlelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_battleuser`
--

DROP TABLE IF EXISTS `users_battleuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_battleuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `nickName` varchar(100) NOT NULL,
  `wins` int(11) NOT NULL,
  `losses` int(11) NOT NULL,
  `winStreak` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `last_seen` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_battleuser`
--

LOCK TABLES `users_battleuser` WRITE;
/*!40000 ALTER TABLE `users_battleuser` DISABLE KEYS */;
INSERT INTO `users_battleuser` VALUES (1,'piiidsodsppa','dsdsdiasddy','pdsdidasddy',0,0,0,'2014-08-25 13:09:46','2014-08-25 13:09:46'),(2,'Monkey','Man','monkeyman',10,11,9,'2014-08-22 19:01:56','2014-08-22 19:01:56'),(3,'Jane','Doe','JD',2,22,1,'2014-08-23 00:41:57','2014-08-23 00:41:57'),(5,'poppa','diddy','pdiddy',0,0,0,'2014-08-23 18:40:41','2014-08-23 18:40:44'),(6,'popa','diddy','pdiddy',0,0,0,'2014-08-24 20:22:44','2014-08-24 20:22:44'),(7,'popa','diddy','pdiddy',0,0,0,'2014-08-24 20:24:59','2014-08-24 20:24:59'),(8,'popa','diddy','pdiddy',0,0,0,'2014-08-24 20:25:10','2014-08-24 20:25:10'),(9,'popa','diddy','pdiddy',0,0,0,'2014-08-24 21:14:36','2014-08-24 21:14:36'),(10,'popa','diddy','pdiddy',0,0,0,'2014-08-24 21:17:36','2014-08-24 21:17:36'),(11,'piiioppa','dsdiddy','pdiddy',0,0,0,'2014-08-25 11:14:17','2014-08-25 11:14:17'),(12,'piiiodsppa','dsdsdiddy','pdsdiddy',0,0,0,'2014-08-25 11:19:19','2014-08-25 11:19:19'),(13,'piiiodsppa','dsdsdiddy','pdsdiddy',0,0,0,'2014-08-25 11:19:24','2014-08-25 11:19:24'),(14,'piiidsodsppa','dsdsdiasddy','pdsdidasddy',0,0,0,'2014-08-25 11:19:36','2014-08-25 11:19:36'),(15,'TestUser1','TestUser1','TestUser1',1,1,1,'2014-08-25 11:44:12','2014-08-25 11:44:12'),(16,'piiioppa','diddy','pdiddy',0,0,0,'2014-08-25 12:13:19','2014-08-25 12:13:19'),(17,'piiioppa','diddy','pdiddy',0,0,0,'2014-08-25 12:14:04','2014-08-25 12:14:04'),(18,'piiiofppa','diddfdy','pdidsfdy',0,0,0,'2014-08-25 12:35:02','2014-08-25 12:35:02'),(19,'piiioppa','diddy','pdiddy',0,0,0,'2014-08-26 14:42:29','2014-08-26 14:42:29');
/*!40000 ALTER TABLE `users_battleuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `nickName` varchar(100) NOT NULL,
  `wins` int(11) NOT NULL,
  `losses` int(11) NOT NULL,
  `winStreak` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `last_seen` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'Patrick','Lawrence','pLaw',10,1,10,'2014-08-21 20:07:28','2014-08-21 20:07:33');
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-26  8:25:10
