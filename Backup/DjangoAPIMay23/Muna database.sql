-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: munadb
-- ------------------------------------------------------
-- Server version	8.0.27

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add admin user',7,'add_adminuser'),(26,'Can change admin user',7,'change_adminuser'),(27,'Can delete admin user',7,'delete_adminuser'),(28,'Can view admin user',7,'view_adminuser'),(29,'Can add female user',8,'add_femaleuser'),(30,'Can change female user',8,'change_femaleuser'),(31,'Can delete female user',8,'delete_femaleuser'),(32,'Can view female user',8,'view_femaleuser'),(33,'Can add male user',9,'add_maleuser'),(34,'Can change male user',9,'change_maleuser'),(35,'Can delete male user',9,'delete_maleuser'),(36,'Can view male user',9,'view_maleuser'),(37,'Can add matching table',10,'add_matchingtable'),(38,'Can change matching table',10,'change_matchingtable'),(39,'Can delete matching table',10,'delete_matchingtable'),(40,'Can view matching table',10,'view_matchingtable'),(41,'Can add post',11,'add_post'),(42,'Can change post',11,'change_post'),(43,'Can delete post',11,'delete_post'),(44,'Can view post',11,'view_post');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'UserApp','adminuser'),(8,'UserApp','femaleuser'),(9,'UserApp','maleuser'),(10,'UserApp','matchingtable'),(11,'UserApp','post');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'UserApp','0001_initial','2021-12-28 06:31:24.490492'),(2,'UserApp','0002_post_postdetails_post_postphoto_post_poststatus_and_more','2022-01-03 02:06:07.155314'),(3,'contenttypes','0001_initial','2022-01-03 02:06:07.280284'),(4,'auth','0001_initial','2022-01-03 02:06:08.123981'),(5,'admin','0001_initial','2022-01-03 02:06:08.561763'),(6,'admin','0002_logentry_remove_auto_add','2022-01-03 02:06:08.577373'),(7,'admin','0003_logentry_add_action_flag_choices','2022-01-03 02:06:08.592998'),(8,'contenttypes','0002_remove_content_type_name','2022-01-03 02:06:08.749210'),(9,'auth','0002_alter_permission_name_max_length','2022-01-03 02:06:08.842940'),(10,'auth','0003_alter_user_email_max_length','2022-01-03 02:06:08.874177'),(11,'auth','0004_alter_user_username_opts','2022-01-03 02:06:08.874177'),(12,'auth','0005_alter_user_last_login_null','2022-01-03 02:06:08.967942'),(13,'auth','0006_require_contenttypes_0002','2022-01-03 02:06:08.967942'),(14,'auth','0007_alter_validators_add_error_messages','2022-01-03 02:06:08.983562'),(15,'auth','0008_alter_user_username_max_length','2022-01-03 02:06:09.077256'),(16,'auth','0009_alter_user_last_name_max_length','2022-01-03 02:06:09.345471'),(17,'auth','0010_alter_group_name_max_length','2022-01-03 02:06:09.407745'),(18,'auth','0011_update_proxy_permissions','2022-01-03 02:06:09.423369'),(19,'auth','0012_alter_user_first_name_max_length','2022-01-03 02:06:09.548340'),(20,'sessions','0001_initial','2022-01-03 02:06:09.595202'),(21,'UserApp','0003_matchingtable_matchingdetails','2022-01-03 02:27:50.325297'),(22,'UserApp','0004_post_posttype','2022-01-06 02:44:11.326649'),(23,'UserApp','0005_rename_user_pass_femaleuser_userpass_and_more','2022-01-06 08:48:00.052341');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_adminuser`
--

DROP TABLE IF EXISTS `userapp_adminuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userapp_adminuser` (
  `adminId` int NOT NULL AUTO_INCREMENT,
  `adminUserName` varchar(500) DEFAULT NULL,
  `adminPass` varchar(500) NOT NULL,
  `adminFullName` varchar(500) NOT NULL,
  `adminLevel` varchar(500) NOT NULL,
  `adminStatus` varchar(500) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_adminuser`
--

LOCK TABLES `userapp_adminuser` WRITE;
/*!40000 ALTER TABLE `userapp_adminuser` DISABLE KEYS */;
INSERT INTO `userapp_adminuser` VALUES (1,'we','123','12','12','inactive'),(3,'we','123','12','highight','inactive'),(4,'we','123','12','hyyy','inactive'),(6,'new','rrr','12','hyyy','inactive'),(7,'e','e','e','e','e'),(10,'frt','f45','ff','fdd','fdd'),(11,'r','f','f','f','f'),(12,'9','8','7','4','3'),(13,'5','5','6','5','6');
/*!40000 ALTER TABLE `userapp_adminuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_femaleuser`
--

DROP TABLE IF EXISTS `userapp_femaleuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userapp_femaleuser` (
  `femaleId` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(100) DEFAULT NULL,
  `nickName` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `cellPhone` varchar(100) DEFAULT NULL,
  `workPhone` varchar(100) DEFAULT NULL,
  `homePhone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `personalWebsite` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `placeOfBirth` varchar(100) DEFAULT NULL,
  `health` varchar(100) DEFAULT NULL,
  `maritalStatus` varchar(100) DEFAULT NULL,
  `children` varchar(100) DEFAULT NULL,
  `childrenNumber` int DEFAULT NULL,
  `childrenAges` varchar(100) DEFAULT NULL,
  `immigrationStatus` varchar(100) DEFAULT NULL,
  `highSchool` varchar(100) DEFAULT NULL,
  `highSchoolYear` int DEFAULT NULL,
  `bachelors` varchar(100) DEFAULT NULL,
  `bachelorsYear` int DEFAULT NULL,
  `masters` varchar(100) DEFAULT NULL,
  `mastersYear` int DEFAULT NULL,
  `doctorate` varchar(100) DEFAULT NULL,
  `doctorateYear` int DEFAULT NULL,
  `otherDegree` varchar(200) DEFAULT NULL,
  `otherDegreeYear` int DEFAULT NULL,
  `employed` varchar(100) DEFAULT NULL,
  `employment` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `income` int DEFAULT NULL,
  `religiousPractice` varchar(100) DEFAULT NULL,
  `religiousPracticeBrief` varchar(500) DEFAULT NULL,
  `revertTime` varchar(100) DEFAULT NULL,
  `wear` varchar(100) DEFAULT NULL,
  `smoker` varchar(100) DEFAULT NULL,
  `preReligious` varchar(100) DEFAULT NULL,
  `preReligiousBrief` varchar(100) DEFAULT NULL,
  `preBeard` varchar(100) DEFAULT NULL,
  `preSmoking` varchar(100) DEFAULT NULL,
  `preEthnic` varchar(100) DEFAULT NULL,
  `preEthnicSpecific` varchar(500) DEFAULT NULL,
  `preImmigrationStatus` varchar(100) DEFAULT NULL,
  `preMaritalStatus` varchar(100) DEFAULT NULL,
  `preChildren` varchar(100) DEFAULT NULL,
  `preEducation` varchar(100) DEFAULT NULL,
  `preEmployment` varchar(100) DEFAULT NULL,
  `preIncome` varchar(100) DEFAULT NULL,
  `preAgeGap` varchar(100) DEFAULT NULL,
  `guarName` varchar(100) DEFAULT NULL,
  `guarAddress` varchar(500) DEFAULT NULL,
  `guarCity` varchar(100) DEFAULT NULL,
  `guarState` varchar(100) DEFAULT NULL,
  `guarCountry` varchar(100) DEFAULT NULL,
  `guarPhone` varchar(100) DEFAULT NULL,
  `guarEmail` varchar(100) DEFAULT NULL,
  `guarProfession` varchar(100) DEFAULT NULL,
  `familyBrief` varchar(500) DEFAULT NULL,
  `refName1` varchar(100) DEFAULT NULL,
  `refRelation1` varchar(100) DEFAULT NULL,
  `refPhone1` varchar(100) DEFAULT NULL,
  `refName2` varchar(100) DEFAULT NULL,
  `refRelation2` varchar(100) DEFAULT NULL,
  `refPhone2` varchar(100) DEFAULT NULL,
  `refName3` varchar(100) DEFAULT NULL,
  `refRelation3` varchar(100) DEFAULT NULL,
  `refPhone3` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `cv` varchar(100) DEFAULT NULL,
  `album` varchar(100) DEFAULT NULL,
  `govIssuedId` varchar(100) DEFAULT NULL,
  `matchShowLimit` int DEFAULT NULL,
  `userPass` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `openingDate` datetime(6) DEFAULT NULL,
  `lastEdit` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`femaleId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_femaleuser`
--

LOCK TABLES `userapp_femaleuser` WRITE;
/*!40000 ALTER TABLE `userapp_femaleuser` DISABLE KEYS */;
INSERT INTO `userapp_femaleuser` VALUES (1,'ABC','hubi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'gello','rtc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `userapp_femaleuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_maleuser`
--

DROP TABLE IF EXISTS `userapp_maleuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userapp_maleuser` (
  `maleId` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(100) DEFAULT NULL,
  `nickName` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `cellPhone` varchar(100) DEFAULT NULL,
  `workPhone` varchar(100) DEFAULT NULL,
  `homePhone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `personalWebsite` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `placeOfBirth` varchar(100) DEFAULT NULL,
  `health` varchar(100) DEFAULT NULL,
  `maritalStatus` varchar(100) DEFAULT NULL,
  `children` varchar(100) DEFAULT NULL,
  `childrenNumber` int DEFAULT NULL,
  `childrenAges` varchar(100) DEFAULT NULL,
  `immigrationStatus` varchar(100) DEFAULT NULL,
  `highSchool` varchar(100) DEFAULT NULL,
  `highSchoolYear` int DEFAULT NULL,
  `bachelors` varchar(100) DEFAULT NULL,
  `bachelorsYear` int DEFAULT NULL,
  `masters` varchar(100) DEFAULT NULL,
  `mastersYear` int DEFAULT NULL,
  `doctorate` varchar(100) DEFAULT NULL,
  `doctorateYear` int DEFAULT NULL,
  `otherDegree` varchar(200) DEFAULT NULL,
  `otherDegreeYear` int DEFAULT NULL,
  `employed` varchar(100) DEFAULT NULL,
  `employment` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `income` int DEFAULT NULL,
  `religiousPractice` varchar(100) DEFAULT NULL,
  `religiousPracticeBrief` varchar(500) DEFAULT NULL,
  `revertTime` varchar(100) DEFAULT NULL,
  `beard` varchar(100) DEFAULT NULL,
  `smoker` varchar(100) DEFAULT NULL,
  `preReligious` varchar(100) DEFAULT NULL,
  `preReligiousBrief` varchar(100) DEFAULT NULL,
  `preWear` varchar(100) DEFAULT NULL,
  `preSmoking` varchar(100) DEFAULT NULL,
  `preEthnic` varchar(100) DEFAULT NULL,
  `preEthnicSpecific` varchar(500) DEFAULT NULL,
  `preImmigrationStatus` varchar(100) DEFAULT NULL,
  `preMaritalStatus` varchar(100) DEFAULT NULL,
  `preChildren` varchar(100) DEFAULT NULL,
  `preEducation` varchar(100) DEFAULT NULL,
  `preEmployment` varchar(100) DEFAULT NULL,
  `preIncome` varchar(100) DEFAULT NULL,
  `preAgeGap` varchar(100) DEFAULT NULL,
  `guarName` varchar(100) DEFAULT NULL,
  `guarAddress` varchar(500) DEFAULT NULL,
  `guarCity` varchar(100) DEFAULT NULL,
  `guarState` varchar(100) DEFAULT NULL,
  `guarCountry` varchar(100) DEFAULT NULL,
  `guarPhone` varchar(100) DEFAULT NULL,
  `guarEmail` varchar(100) DEFAULT NULL,
  `guarProfession` varchar(100) DEFAULT NULL,
  `familyBrief` varchar(500) DEFAULT NULL,
  `refName1` varchar(100) DEFAULT NULL,
  `refRelation1` varchar(100) DEFAULT NULL,
  `refPhone1` varchar(100) DEFAULT NULL,
  `refName2` varchar(100) DEFAULT NULL,
  `refRelation2` varchar(100) DEFAULT NULL,
  `refPhone2` varchar(100) DEFAULT NULL,
  `refName3` varchar(100) DEFAULT NULL,
  `refRelation3` varchar(100) DEFAULT NULL,
  `refPhone3` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `cv` varchar(100) DEFAULT NULL,
  `album` varchar(100) DEFAULT NULL,
  `govIssuedId` varchar(100) DEFAULT NULL,
  `matchShowLimit` int DEFAULT NULL,
  `userPass` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `openingDate` datetime(6) DEFAULT NULL,
  `lastEdit` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`maleId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_maleuser`
--

LOCK TABLES `userapp_maleuser` WRITE;
/*!40000 ALTER TABLE `userapp_maleuser` DISABLE KEYS */;
INSERT INTO `userapp_maleuser` VALUES (3,'fgbkjl','fff','io',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'abuf','1','1','1','1','1','1','1','1','1','1','1',1,'0001-01-11',11,1,'1','1','1','1',1,'1','1','1',1,'1',1,'1',1,'1',1,'1',1,'1','1','1',1,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1',1,'1','1','0001-01-11 00:00:00.000000','0001-01-11 00:00:00.000000'),(5,'1','1','1','1','1','1','1','1','1','1','1','1',1,'0001-01-11',1,0,'1','1','1','1',0,'1','1','1',0,'1',1,'1',0,'1',1,'1',0,'1','1','1',1,'1','1','1','1','1','1','11','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','11','11','11','1','1','1','1','1','1','1','1','1','1','1','1',1,'1','1','0001-01-11 00:00:00.000000','0001-01-11 00:00:00.000000'),(6,'1','1','1','1','1','1','1','1','1','1','1','1',1,'0001-01-11',1,0,'1','1','1','1',0,'1','1','1',0,'1',1,'1',0,'1',1,'1',0,'1','1','1',1,'1','1','1','1','1','1','11','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','11','11','11','1','1','1','1','1','1','1','1','1','1','1','1',1,'1','e','0001-01-11 00:00:00.000000','0001-01-11 00:00:00.000000'),(7,'1','1','1','1','1','1','1','1','1','1','1','1',1,'0001-01-11',1,0,'1','1','1','1',0,'1','1','1',0,'1',1,'1',0,'1',1,'1',0,'1','1','1',1,'1','1','1','1','1','1','11','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','11','11','11','1','1','1','1','1','1','1','1','1','1','1','1',1,'1','e','0001-01-11 00:00:00.000000','0001-01-11 00:00:00.000000'),(8,'1','1','1','1','21','1','1','1','1','1','1','1',1,'0001-01-01',1,1,'1','1','1','1',1,'1','1','1',1,'1',1,'1',1,'1',1,'1',1,'1','1','1',1,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1',1,'1','Inactive','0001-01-11 00:00:00.000000','0001-01-11 00:00:00.000000');
/*!40000 ALTER TABLE `userapp_maleuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_matchingtable`
--

DROP TABLE IF EXISTS `userapp_matchingtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userapp_matchingtable` (
  `matchingId` int NOT NULL AUTO_INCREMENT,
  `matchingIndicator` varchar(500) DEFAULT NULL,
  `malePoint` int DEFAULT NULL,
  `femalePoint` int DEFAULT NULL,
  `matchingDetails` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`matchingId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_matchingtable`
--

LOCK TABLES `userapp_matchingtable` WRITE;
/*!40000 ALTER TABLE `userapp_matchingtable` DISABLE KEYS */;
INSERT INTO `userapp_matchingtable` VALUES (1,'religiousPractice',10,10,'Preferred Religious practices'),(2,'wifeWearing',10,NULL,'preferences for a wife with wearing'),(3,'beard',NULL,10,'preferences for a husband with'),(4,'smoking',10,10,'Are you fine with smoking?'),(5,'immigrationStatus',10,10,'Immigration Status—: I would prefer my future spouse is a'),(6,'maritalStatus',10,10,'Marital Status—I prefer a spouse who’s'),(7,'children',10,10,'Children—I am willing to consider a spouse with existing children'),(8,'educationLevel',10,10,'Preffered spouce education level'),(9,'employement',10,10,'Preffered employment of future spouce-'),(10,'minimumIncome',10,10,'Preffered minimum yearly Income of future spouce (USD)'),(11,'ageGap',10,10,'Preferred maximum age gap');
/*!40000 ALTER TABLE `userapp_matchingtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_post`
--

DROP TABLE IF EXISTS `userapp_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userapp_post` (
  `postId` int NOT NULL AUTO_INCREMENT,
  `postDetails` varchar(4000) DEFAULT NULL,
  `postPhoto` varchar(200) DEFAULT NULL,
  `postStatus` varchar(200) DEFAULT NULL,
  `postTitle` varchar(200) DEFAULT NULL,
  `postType` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`postId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_post`
--

LOCK TABLES `userapp_post` WRITE;
/*!40000 ALTER TABLE `userapp_post` DISABLE KEYS */;
INSERT INTO `userapp_post` VALUES (2,'r','r','f','5555','4'),(3,'f','f','f','ff','be'),(4,'রাজধানীর বাংলামোটরে ১১ তলাবিশিষ্ট রাহাত টাওয়ারের ১১ তলায় আগুন লেগেছে। আজ বৃহস্পতিবার বেলা ১১টা ১০ মিনিটের দিকে এ ঘটনা ঘটে।  ফায়ার সার্ভিসের দায়িত্বরত কর্মকর্তা রোজিনা আক্তার প্রথম আলোকে বলেন, খবর পেয়ে ঘটনাস্থলে ফায়ার সার্ভিসের নয়টি ইউনিট ঘটনাস্থলে যায়। তারা আগুন নিয়ন্ত্রণে কাজ করছে। তিনি বলেন, ভবনটিতে কীভাবে আগুন লাগল, সে সম্পর্কে এখনো কিছু জানা যায়নি।','n/a','active','রাজধানীর বাংলামোটরে বহুতল ভবনে আগুন','News');
/*!40000 ALTER TABLE `userapp_post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-06 19:05:34
