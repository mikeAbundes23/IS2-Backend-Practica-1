-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: app
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add task',7,'add_task'),(26,'Can change task',7,'change_task'),(27,'Can delete task',7,'delete_task'),(28,'Can view task',7,'view_task'),(29,'Can add blacklisted token',8,'add_blacklistedtoken'),(30,'Can change blacklisted token',8,'change_blacklistedtoken'),(31,'Can delete blacklisted token',8,'delete_blacklistedtoken'),(32,'Can view blacklisted token',8,'view_blacklistedtoken'),(33,'Can add outstanding token',9,'add_outstandingtoken'),(34,'Can change outstanding token',9,'change_outstandingtoken'),(35,'Can delete outstanding token',9,'delete_outstandingtoken'),(36,'Can view outstanding token',9,'view_outstandingtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-08-24 00:38:08.889447','1','Hacer tarea de IS2',1,'[{\"added\": {}}]',7,1),(2,'2025-08-24 22:52:04.860966','1','mike@gmail.com',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',6,1),(3,'2025-08-24 23:13:53.103939','1','mike@gmail.com',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',6,1),(4,'2025-08-24 23:16:26.738841','4','marco@gmail.com',3,'',6,1),(5,'2025-08-24 23:16:26.738841','3','pedro@gmail.com',3,'',6,1),(6,'2025-08-24 23:16:26.738841','2','irving@gmail.com',3,'',6,1),(7,'2025-08-24 23:17:11.750931','1','mike@gmail.com',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',6,1),(8,'2025-08-24 23:27:42.924028','5','irving@gmail.com',3,'',6,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(8,'token_blacklist','blacklistedtoken'),(9,'token_blacklist','outstandingtoken'),(7,'user','task'),(6,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-08-21 04:15:22.227424'),(2,'contenttypes','0002_remove_content_type_name','2025-08-21 04:15:22.362041'),(3,'auth','0001_initial','2025-08-21 04:15:22.766048'),(4,'auth','0002_alter_permission_name_max_length','2025-08-21 04:15:22.893168'),(5,'auth','0003_alter_user_email_max_length','2025-08-21 04:15:22.905395'),(6,'auth','0004_alter_user_username_opts','2025-08-21 04:15:22.914744'),(7,'auth','0005_alter_user_last_login_null','2025-08-21 04:15:22.936856'),(8,'auth','0006_require_contenttypes_0002','2025-08-21 04:15:22.938866'),(9,'auth','0007_alter_validators_add_error_messages','2025-08-21 04:15:22.948221'),(10,'auth','0008_alter_user_username_max_length','2025-08-21 04:15:22.956263'),(11,'auth','0009_alter_user_last_name_max_length','2025-08-21 04:15:22.960975'),(12,'auth','0010_alter_group_name_max_length','2025-08-21 04:15:22.974258'),(13,'auth','0011_update_proxy_permissions','2025-08-21 04:15:22.996036'),(14,'auth','0012_alter_user_first_name_max_length','2025-08-21 04:15:23.006730'),(15,'user','0001_initial','2025-08-21 04:15:23.404720'),(16,'admin','0001_initial','2025-08-21 04:15:23.598045'),(17,'admin','0002_logentry_remove_auto_add','2025-08-21 04:15:23.607945'),(18,'admin','0003_logentry_add_action_flag_choices','2025-08-21 04:15:23.607945'),(19,'sessions','0001_initial','2025-08-21 04:15:23.654760'),(20,'user','0002_task','2025-08-24 00:34:54.081306'),(21,'user','0003_rename_state_task_status','2025-08-24 00:34:54.123732'),(22,'token_blacklist','0001_initial','2025-08-24 01:34:41.965711'),(23,'token_blacklist','0002_outstandingtoken_jti_hex','2025-08-24 01:34:42.016688'),(24,'token_blacklist','0003_auto_20171017_2007','2025-08-24 01:34:42.065432'),(25,'token_blacklist','0004_auto_20171017_2013','2025-08-24 01:34:42.281996'),(26,'token_blacklist','0005_remove_outstandingtoken_jti','2025-08-24 01:34:42.409361'),(27,'token_blacklist','0006_auto_20171017_2113','2025-08-24 01:34:42.491414'),(28,'token_blacklist','0007_auto_20171017_2214','2025-08-24 01:34:42.979365'),(29,'token_blacklist','0008_migrate_to_bigautofield','2025-08-24 01:34:43.519972'),(30,'token_blacklist','0010_fix_migrate_to_bigautofield','2025-08-24 01:34:43.564262'),(31,'token_blacklist','0011_linearizes_history','2025-08-24 01:34:43.567256'),(32,'token_blacklist','0012_alter_outstandingtoken_user','2025-08-24 01:34:43.584406');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3xwctfkpcnxhpcgfdlydpmq3bi3833gt','.eJxVjEEOwiAQRe_C2hBGEKhL956hGWYYqRpISrsy3l2bdKHb_977LzXiupRx7XkeJ1ZnBerwuyWkR64b4DvWW9PU6jJPSW-K3mnX18b5edndv4OCvXxrJ9E4tIMxEdAKMaCwS8ZHixHygMiCGax3Xijg0UdPBMwnE1ziIOr9Ae4lOIQ:1uoxJH:laKPTf2B8rprLhtgTMthhc_o7pRiGVhYducqySUlJmM','2025-09-04 04:53:59.500428'),('9a72yc1lszwnobc4vmmd0kuvdoo5ngey','.eJxVjEEOwiAQRe_C2hBGEKhL956hGWYYqRpISrsy3l2bdKHb_977LzXiupRx7XkeJ1ZnBerwuyWkR64b4DvWW9PU6jJPSW-K3mnX18b5edndv4OCvXxrJ9E4tIMxEdAKMaCwS8ZHixHygMiCGax3Xijg0UdPBMwnE1ziIOr9Ae4lOIQ:1upyjB:KA-ivB8nr-4riPJ3nSpBSJGQ5LbJJPKNAV-XocWoDYw','2025-09-07 00:36:57.469789');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_blacklistedtoken` VALUES (1,'2025-08-24 22:25:15.823970',2),(2,'2025-08-24 22:32:22.163849',3),(3,'2025-08-24 22:50:33.612767',7),(4,'2025-08-24 22:52:19.357906',9),(6,'2025-08-24 23:06:12.224232',15),(7,'2025-08-24 23:29:08.055564',23),(8,'2025-08-24 23:33:12.233127',25),(9,'2025-08-24 23:35:12.380451',26);
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_user_user` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_user_user` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzc3NTMxNywiaWF0IjoxNzU1OTk5MzE3LCJqdGkiOiI2OWEzZjdkNGE1OTc0ZTkyOTM4MGIwM2JjOTBkYWExNSIsInVzZXJfaWQiOjF9._WbQXBnNqF1AJ6EOIoyVpkmJCg0DAC3IBNauj-vXIEo','2025-08-24 01:35:17.388649','2025-11-22 01:35:17.000000',1,'69a3f7d4a5974e929380b03bc90daa15'),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg0ODgxNSwiaWF0IjoxNzU2MDcyODE1LCJqdGkiOiIwZjY2NmZhNzA4YWY0ZDY5OWNiZjY2MDM3MzEyYzkzMiIsInVzZXJfaWQiOjF9.nICytErmqhevMixuC3lSw5hjq0tKZJmiJA00e5g2L7E','2025-08-24 22:00:15.377779','2025-11-22 22:00:15.000000',1,'0f666fa708af4d699cbf66037312c932'),(3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MDMxNSwiaWF0IjoxNzU2MDc0MzE1LCJqdGkiOiJhMjU2ZjU0M2Y1MTA0ODhmOGIyMTYyYWQ2Y2Y3YzFmZCIsInVzZXJfaWQiOjEsImlkIjoxfQ.yRY-dLN61F-gUpL6u-3HxtIVjE3mOh2kJgeIO9e2xsA','2025-08-24 22:25:15.801759','2025-11-22 22:25:15.000000',1,'a256f543f510488f8b2162ad6cf7c1fd'),(4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MDc0MiwiaWF0IjoxNzU2MDc0NzQyLCJqdGkiOiI2YmNkNTdkMGRkZTg0YjViOTE0NjkyYzQwNTA0YWNhZiIsInVzZXJfaWQiOjEsImlkIjoxfQ.jjQY_shwOVKzEeO65X_aLiYvGdvBCgRrl55AslRilc0','2025-08-24 22:32:22.130938','2025-11-22 22:32:22.000000',1,'6bcd57d0dde84b5b914692c40504acaf'),(5,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MTMzNiwiaWF0IjoxNzU2MDc1MzM2LCJqdGkiOiIzNGY3NWFjODFlYzU0NjZmOWVmNWI5YzRmMDk0MzllZSIsInVzZXJfaWQiOjF9.iIYta4-c3Ko0ZxPr-FOOeYPUKGCtDK3we-QEPFnf9xE','2025-08-24 22:42:16.161782','2025-11-22 22:42:16.000000',1,'34f75ac81ec5466f9ef5b9c4f09439ee'),(6,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MTM2NywiaWF0IjoxNzU2MDc1MzY3LCJqdGkiOiI1MTFhMWI0MjU0OTI0ODQ2ODJkZDAxYjUyNWY3Y2E2ZSIsInVzZXJfaWQiOjF9.8kA-J84lN6u6vUOX0RwgK3_ZwXKjurh2e3wpp0mFOsE','2025-08-24 22:42:47.228462','2025-11-22 22:42:47.000000',1,'511a1b425492484682dd01b525f7ca6e'),(7,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MTQyOSwiaWF0IjoxNzU2MDc1NDI5LCJqdGkiOiIzYjM0YWRmYWE3N2Y0NGNkYTY1ZjBjZTgwODgyMzBiNSIsInVzZXJfaWQiOjF9.TWzM7UcWko8_ofD_bQ830qM5KT7FDGMr2fPxkqhBshs','2025-08-24 22:43:49.538446','2025-11-22 22:43:49.000000',1,'3b34adfaa77f44cda65f0ce8088230b5'),(8,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MTgzMywiaWF0IjoxNzU2MDc1ODMzLCJqdGkiOiJjMjg5NTA2NzViNjc0ZmYyYTdmYThlMjY1Yzc4NjcwOSIsInVzZXJfaWQiOjEsImlkIjoxfQ.mRepeuXbq-qZZ4bGOPhIItQ_MyM1CK4wczcsGIOfpdE','2025-08-24 22:50:33.595537','2025-11-22 22:50:33.000000',1,'c28950675b674ff2a7fa8e265c786709'),(9,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MTg1NSwiaWF0IjoxNzU2MDc1ODU1LCJqdGkiOiI2M2RiYTQ0NDZmMTg0NTMyYWVkMWQ1NTI4ODU4N2ViNCIsInVzZXJfaWQiOjF9.raEiJfTcye1tbM1lvrdQ1Td5CFC55yczixKscMpIxug','2025-08-24 22:50:55.920690','2025-11-22 22:50:55.000000',1,'63dba4446f184532aed1d55288587eb4'),(10,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MTkzOSwiaWF0IjoxNzU2MDc1OTM5LCJqdGkiOiJkMmY2YWE4OWY2YzA0MTYyOTc4ZTcxZjM1OTcxYmNmMCIsInVzZXJfaWQiOjEsImlkIjoxfQ.n_nAzJKj7SUM_WXUWt8xhARYDZPRtiNYaMX8lbb2VOA','2025-08-24 22:52:19.339944','2025-11-22 22:52:19.000000',1,'d2f6aa89f6c04162978e71f35971bcf0'),(11,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MTkzOSwiaWF0IjoxNzU2MDc1OTM5LCJqdGkiOiI1OWM5ZTBiMjc3NDc0MDg3OThjZTljOTQ2YTUxNDg2ZiIsInVzZXJfaWQiOjEsImlkIjoxfQ.D6l5qIsMsj30FGl5EjKzxQhcxHPgOCvzOGcXaIS8Alk','2025-08-24 22:52:19.362967','2025-11-22 22:52:19.000000',1,'59c9e0b27747408798ce9c946a51486f'),(12,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MTk2MiwiaWF0IjoxNzU2MDc1OTYyLCJqdGkiOiJiOGMzNGI5Zjg0MmE0MjNlODc4MWZlZmVmZGJiYTA3MSIsInVzZXJfaWQiOjF9.76g1SyU6ia-GdSijWfs2D3EI0TBENRCyUGhxKnS8B5k','2025-08-24 22:52:42.449924','2025-11-22 22:52:42.000000',1,'b8c34b9f842a423e8781fefefdbba071'),(13,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MjExNiwiaWF0IjoxNzU2MDc2MTE2LCJqdGkiOiJjNjQwYmUwOGI5YTc0MzU4YjViODQyNzgxOTAwZjg5MiIsInVzZXJfaWQiOjF9.auZRTLFMSHifHmhmQj-_-2hMi2kRdq1OF-SjtW0SasQ','2025-08-24 22:55:16.429960','2025-11-22 22:55:16.000000',1,'c640be08b9a74358b5b842781900f892'),(14,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MjE4NCwiaWF0IjoxNzU2MDc2MTg0LCJqdGkiOiJiYjNiNGE0ZTU1MWQ0ZGUzYWU2NWM2ZTFmNzUwNmExNiIsInVzZXJfaWQiOjF9._H7WnMs9bV8aA6XcpcgjN8703d4F9sGBV5JJgaDO2DY','2025-08-24 22:56:24.732256','2025-11-22 22:56:24.000000',1,'bb3b4a4e551d4de3ae65c6e1f7506a16'),(15,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MjQ1OSwiaWF0IjoxNzU2MDc2NDU5LCJqdGkiOiJhZTQxN2E5OGNjMzA0NTk4YTM1MmRiNGQ2OTk3ZDYwYSIsInVzZXJfaWQiOjF9.qehAuLMIGvsVAFi1DJhixXcaWhyzUckrE7TMcuJckHc','2025-08-24 23:00:59.049159','2025-11-22 23:00:59.000000',1,'ae417a98cc304598a352db4d6997d60a'),(16,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1Mjc3MiwiaWF0IjoxNzU2MDc2NzcyLCJqdGkiOiIzNzkwYjE2N2VkNzg0MjA2YjYzZDBiZGQ2NWIwZTRjMSIsInVzZXJfaWQiOjEsImlkIjoxfQ.JLQOYrGTd0I6gua9Dx6n0OT67R7p_RdLL4gKYp-f0n8','2025-08-24 23:06:12.200356','2025-11-22 23:06:12.000000',1,'3790b167ed784206b63d0bdd65b0e4c1'),(17,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1Mjc5NSwiaWF0IjoxNzU2MDc2Nzk1LCJqdGkiOiIwNGYyNzQxYmNiNmY0M2FhYjI4OGRjYzc0ZjEyY2Y2YSIsInVzZXJfaWQiOjF9.f_y9gRYL4b6QPiB-sN2lAMOy0Y9W_4noljLeijb-wI0','2025-08-24 23:06:35.140069','2025-11-22 23:06:35.000000',1,'04f2741bcb6f43aab288dcc74f12cf6a'),(18,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1Mjk0OSwiaWF0IjoxNzU2MDc2OTQ5LCJqdGkiOiIzZDUwZjlhNjc4NTk0NDgzODhiZWNmYzgyM2EwODFhNSIsInVzZXJfaWQiOjF9.9cF0CaEjk3WOixOHA4CGt3mgY4DoQrw9XKCrWqVFbFM','2025-08-24 23:09:09.065693','2025-11-22 23:09:09.000000',1,'3d50f9a67859448388becfc823a081a5'),(19,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MzA1NywiaWF0IjoxNzU2MDc3MDU3LCJqdGkiOiI2OGI0Nzg0M2M0MTQ0MzJjOWNlMWFjZTk2MDIwNzMwMSIsInVzZXJfaWQiOjF9.uaIkIXR8Ta35u7aszqkJfTo-nw_9nwL43BX_JLfnI2g','2025-08-24 23:10:57.996799','2025-11-22 23:10:57.000000',1,'68b47843c414432c9ce1ace960207301'),(20,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MzE0NCwiaWF0IjoxNzU2MDc3MTQ0LCJqdGkiOiI5YzQwZDQxMGY0ZTI0NWJmOTkzODQ5YTg5YWRhODVjMSIsInVzZXJfaWQiOjF9.todVx0aDLt_LeAYGfwfTn5g24mU6BnvxhpaNc1hbJfc','2025-08-24 23:12:24.537891','2025-11-22 23:12:24.000000',1,'9c40d410f4e245bf993849a89ada85c1'),(21,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MzQ0NCwiaWF0IjoxNzU2MDc3NDQ0LCJqdGkiOiI3Y2JkNzM4ODg1MWI0YmQ4OGZjOWI0ODNiYzBlZjQzNiIsInVzZXJfaWQiOjF9.4qy6AKJf6r1BE9jzWpoYdQKb80kHA8KNi_CTNpPL0xM','2025-08-24 23:17:24.046248','2025-11-22 23:17:24.000000',1,'7cbd7388851b4bd88fc9b483bc0ef436'),(22,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1MzUwOSwiaWF0IjoxNzU2MDc3NTA5LCJqdGkiOiI2ZmU2NzMxYWQxZDQ0MWUyYTRkM2RhNzczOWZhYjRlYSIsInVzZXJfaWQiOjF9.JO9PRJWPn9RO_qUkJW3Ox8Wkp3Wl8puKoOWzHphySrA','2025-08-24 23:18:29.428956','2025-11-22 23:18:29.000000',1,'6fe6731ad1d441e2a4d3da7739fab4ea'),(23,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1NDExNSwiaWF0IjoxNzU2MDc4MTE1LCJqdGkiOiJhZjgyNmY0MTY5NGY0ODZiYWIyNTkxODE2NTZhNmI3ZSIsInVzZXJfaWQiOjZ9.jqKwqNV_QwVMeJacyn9PUJyWC4GouIEDf_-mits39P8','2025-08-24 23:28:35.289222','2025-11-22 23:28:35.000000',6,'af826f41694f486bab259181656a6b7e'),(24,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1NDE0OCwiaWF0IjoxNzU2MDc4MTQ4LCJqdGkiOiI4ZGE4YmFmYjQ4YzU0ODNlODk3OGQ2ZjUxOGI1MDM2ZCIsInVzZXJfaWQiOjYsImlkIjo2fQ.DqBn_eOyy_k8v9h4_3LEw3Vistbm1Z9f8yEtrU5H8yk','2025-08-24 23:29:08.037046','2025-11-22 23:29:08.000000',6,'8da8bafb48c5483e8978d6f518b5036d'),(25,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1NDI3MiwiaWF0IjoxNzU2MDc4MjcyLCJqdGkiOiIzOGU3ODkwNjg4ODk0NDVjYjI0ZGExOGM5MDc2YzVkNSIsInVzZXJfaWQiOjZ9.zILq0r8XE6xVLObgO-aKHdmrg9v586StOPsjQ4I4Vts','2025-08-24 23:31:12.050924','2025-11-22 23:31:12.000000',6,'38e789068889445cb24da18c9076c5d5'),(26,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1NDM5MiwiaWF0IjoxNzU2MDc4MzkyLCJqdGkiOiJiMTcwMWQxYjExZWY0M2ViYmY1ODZhNTA1YWI0ZDhlMiIsInVzZXJfaWQiOjYsImlkIjo2fQ.zPaOsOLlWrGqT8CjdOb4yX5Ed2cwLBYppwwcIpng4w0','2025-08-24 23:33:12.213156','2025-11-22 23:33:12.000000',6,'b1701d1b11ef43ebbf586a505ab4d8e2'),(27,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2Mzg1NDUxMiwiaWF0IjoxNzU2MDc4NTEyLCJqdGkiOiI1YmIzZjNiYzM0ZmY0ZWM2ODhkZjE1ZTcxNmJhNzZkOSIsInVzZXJfaWQiOjYsImlkIjo2fQ.U3F4ZRT59EB30F6sttL8mcT9oxMmVYl9KoQFYu2kI0c','2025-08-24 23:35:12.367359','2025-11-22 23:35:12.000000',6,'5bb3f3bc34ff4ec688df15e716ba76d9');
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_task`
--

DROP TABLE IF EXISTS `user_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `owner_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_task_owner_id_32861f4d_fk_user_user_id` (`owner_id`),
  CONSTRAINT `user_task_owner_id_32861f4d_fk_user_user_id` FOREIGN KEY (`owner_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_task`
--

LOCK TABLES `user_task` WRITE;
/*!40000 ALTER TABLE `user_task` DISABLE KEYS */;
INSERT INTO `user_task` VALUES (1,'Hacer tarea de IS2','Completar el crud para el usuario y el login',0,1);
/*!40000 ALTER TABLE `user_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES (1,'pbkdf2_sha256$1000000$ACGkqxoRWx5l57flvxAsY7$LWmicEJSv98vl8qM3RMvN+1q2hrPmPgHrgYa1i/2L7s=','2025-08-24 00:36:57.000000',1,'Mike','Abundes','mike@gmail.com','profile_pics/nakazato.jpg',1,1),(6,'pbkdf2_sha256$1000000$6ZWQW6TDms5vFmiDEVUyj3$2d13Uaiz2AFUxDAQ4J7LjpntZS5ci1LDFtH7VEV3FmQ=',NULL,0,'Irving','Abundes','irving@gmail.com','profile_pics/image.png',1,0);
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_groups_user_id_group_id_bb60391f_uniq` (`user_id`,`group_id`),
  KEY `user_user_groups_group_id_c57f13c0_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_user_groups_group_id_c57f13c0_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_user_groups_user_id_13f9a20d_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_user_permissions`
--

DROP TABLE IF EXISTS `user_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq` (`user_id`,`permission_id`),
  KEY `user_user_user_permi_permission_id_ce49d4de_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_user_user_permi_permission_id_ce49d4de_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_user_user_permissions_user_id_31782f58_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_user_permissions`
--

LOCK TABLES `user_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-24 18:13:51
