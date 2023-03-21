-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: 6620estore
-- ------------------------------------------------------
-- Server version	8.0.32

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add product',7,'add_product'),(26,'Can change product',7,'change_product'),(27,'Can delete product',7,'delete_product'),(28,'Can view product',7,'view_product'),(29,'Can add order',8,'add_order'),(30,'Can change order',8,'change_order'),(31,'Can delete order',8,'delete_order'),(32,'Can view order',8,'view_order'),(33,'Can add user profile',9,'add_userprofile'),(34,'Can change user profile',9,'change_userprofile'),(35,'Can delete user profile',9,'delete_userprofile'),(36,'Can view user profile',9,'view_userprofile'),(37,'Can add cart',10,'add_cart'),(38,'Can change cart',10,'change_cart'),(39,'Can delete cart',10,'delete_cart'),(40,'Can view cart',10,'view_cart'),(41,'Can add comment',11,'add_comment'),(42,'Can change comment',11,'change_comment'),(43,'Can delete comment',11,'delete_comment'),(44,'Can view comment',11,'view_comment');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$ehszp19uwF5GtsbEjMTgw1$TepBegYl3hWs+WYI73OtBadIojB7TAB/AKcdIf2+hNo=','2023-02-15 10:10:48.346945',1,'zhuwang96','','','wang.zhu1@northeastern.edu',1,1,'2023-02-15 10:10:22.729568');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartapp_cart`
--

DROP TABLE IF EXISTS `cartapp_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartapp_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cartApp_cart_user_id_product_id_2cdb26bb_uniq` (`user_id`,`product_id`),
  KEY `cartApp_cart_product_id_8be73930_fk_productApp_product_id` (`product_id`),
  CONSTRAINT `cartApp_cart_product_id_8be73930_fk_productApp_product_id` FOREIGN KEY (`product_id`) REFERENCES `productapp_product` (`id`),
  CONSTRAINT `cartApp_cart_user_id_e6f02a45_fk_userApp_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartapp_cart`
--

LOCK TABLES `cartapp_cart` WRITE;
/*!40000 ALTER TABLE `cartapp_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartapp_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentapp_comment`
--

DROP TABLE IF EXISTS `commentapp_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentapp_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment_time` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commentApp_comment_product_id_a25c3aa6_fk_productApp_product_id` (`product_id`),
  KEY `commentApp_comment_user_id_f510549b_fk_userApp_userprofile_id` (`user_id`),
  CONSTRAINT `commentApp_comment_product_id_a25c3aa6_fk_productApp_product_id` FOREIGN KEY (`product_id`) REFERENCES `productapp_product` (`id`),
  CONSTRAINT `commentApp_comment_user_id_f510549b_fk_userApp_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentapp_comment`
--

LOCK TABLES `commentapp_comment` WRITE;
/*!40000 ALTER TABLE `commentapp_comment` DISABLE KEYS */;
INSERT INTO `commentapp_comment` VALUES (1,'2023-02-20 05:00:26.629655','sss',1,1),(4,'2023-02-20 05:07:04.216542','test',1,1),(5,'2023-02-20 05:07:22.827201','Hello， world\r\n',1,1),(6,'2023-02-20 05:11:55.752433','good tasty',2,1),(7,'2023-02-20 05:17:32.994469','jj',2,1),(8,'2023-02-20 06:19:28.325842','Delicious Coke, very satisfied!',1,2);
/*!40000 ALTER TABLE `commentapp_comment` ENABLE KEYS */;
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(10,'cartApp','cart'),(11,'commentApp','comment'),(5,'contenttypes','contenttype'),(8,'orderApp','order'),(7,'productApp','product'),(6,'sessions','session'),(9,'userApp','userprofile');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-02-15 10:08:43.504696'),(2,'auth','0001_initial','2023-02-15 10:08:43.824947'),(3,'admin','0001_initial','2023-02-15 10:08:43.888483'),(4,'admin','0002_logentry_remove_auto_add','2023-02-15 10:08:43.903484'),(5,'admin','0003_logentry_add_action_flag_choices','2023-02-15 10:08:43.908483'),(6,'contenttypes','0002_remove_content_type_name','2023-02-15 10:08:43.954321'),(7,'auth','0002_alter_permission_name_max_length','2023-02-15 10:08:43.982015'),(8,'auth','0003_alter_user_email_max_length','2023-02-15 10:08:44.008698'),(9,'auth','0004_alter_user_username_opts','2023-02-15 10:08:44.014697'),(10,'auth','0005_alter_user_last_login_null','2023-02-15 10:08:44.041697'),(11,'auth','0006_require_contenttypes_0002','2023-02-15 10:08:44.044696'),(12,'auth','0007_alter_validators_add_error_messages','2023-02-15 10:08:44.054699'),(13,'auth','0008_alter_user_username_max_length','2023-02-15 10:08:44.083706'),(14,'auth','0009_alter_user_last_name_max_length','2023-02-15 10:08:44.116700'),(15,'auth','0010_alter_group_name_max_length','2023-02-15 10:08:44.144697'),(16,'auth','0011_update_proxy_permissions','2023-02-15 10:08:44.149699'),(17,'auth','0012_alter_user_first_name_max_length','2023-02-15 10:08:44.178476'),(18,'sessions','0001_initial','2023-02-15 10:08:44.200479'),(19,'userApp','0001_initial','2023-02-15 22:44:20.164312'),(20,'productApp','0001_initial','2023-02-15 22:44:20.180312'),(21,'cartApp','0001_initial','2023-02-15 22:44:20.256312'),(22,'orderApp','0001_initial','2023-02-15 22:44:20.297312'),(23,'productApp','0002_product_description','2023-02-15 23:20:44.948458'),(24,'cartApp','0002_alter_cart_unique_together','2023-02-16 03:58:03.969617'),(25,'cartApp','0003_alter_cart_quantity','2023-02-16 04:09:02.411588'),(26,'commentApp','0001_initial','2023-02-20 04:07:31.557771'),(27,'userApp','0002_remove_userprofile_address_and_more','2023-02-20 06:15:23.636375');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3o0vin6wg39wyk39312iwtt1bo2my7ea','e30:1pTzWh:d1nKEBP3Ni8TtmGwR91NNYGa-zYv6Fl47Qt9zNbz_ZQ','2023-03-06 06:19:51.122326'),('4soiky1992mcn6ddy0whmhb9do3h9vlp','e30:1pSSeI:bh_DrIgOta5PUvIQbx_CRfDjRnge-19hvD6izqjo2Jo','2023-03-02 01:01:22.782668'),('9h84wsa33liilac20o3dci7e3nc5h7xt','e30:1pSSLg:ZBvrQMb-5b8uInLj_-mdiMPqnzFnQWJS98dzUYT9IOc','2023-03-02 00:42:08.172710'),('9ndct6ulh8gfhct4bis4wqowpebr9t4h','eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6InpodXdhbmcifX0:1pTvNr:KZvIksp20Ax6FJrO87RpZf6JbP-z-lFOoxoDfvmioFs','2023-03-06 01:54:27.984858'),('aua6x0ztq33wct4to6tbkvyigc87ley2','.eJxVjDsOwjAQBe_iGlmsP8GmpOcM0XrXiwPIluKkQtwdIqWA9s3Me6kR16WMa8_zOLE6K1CH3y0hPXLdAN-x3pqmVpd5SnpT9E67vjbOz8vu_h0U7OVbi2MO1hCkDEcSskMcXAxWvEPiKCwM3phTEMDoKAhCNInZB5shoqj3B_y2OKQ:1pSEkS:uAAQcCbhlkKiTass0J_HNcBWp_jgPW919G1jVrMnJWs','2023-03-01 10:10:48.348945'),('mn1aiylq2hoilr7iup19ck0n6z58t5hl','e30:1pSSNZ:6o6DiFQmhjJDYXShF6raMHSP5cH2wxNk73IeA-8sZ1o','2023-03-02 00:44:05.781656'),('qt69jh1x5jycfo5qu7fwf8ld9bfdhng2','e30:1pSSLF:kJqfU1ZdVZTaS9PAMN4ZRV8H264oASScpspB1x2dimw','2023-03-02 00:41:41.175020');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderapp_order`
--

DROP TABLE IF EXISTS `orderapp_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderapp_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_time` datetime(6) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderApp_order_user_id_d8756840_fk_userApp_userprofile_id` (`user_id`),
  CONSTRAINT `orderApp_order_user_id_d8756840_fk_userApp_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderapp_order`
--

LOCK TABLES `orderapp_order` WRITE;
/*!40000 ALTER TABLE `orderapp_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderapp_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product`
--

DROP TABLE IF EXISTS `product_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img_url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product`
--

LOCK TABLES `product_product` WRITE;
/*!40000 ALTER TABLE `product_product` DISABLE KEYS */;
INSERT INTO `product_product` VALUES (1,'strawberry','very red',14.00,'../static/strawberry.jpg'),(2,'blueberry','very blue',10.00,'../static/blueberry.jpg'),(3,'banana','very yellow',8.00,'../static/banana.jpg');
/*!40000 ALTER TABLE `product_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_shoppingcart`
--

DROP TABLE IF EXISTS `product_shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_shoppingcart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_shoppingcart_product_id_70c485ef_fk_product_product_id` (`product_id`),
  KEY `product_shoppingcart_user_id_76ca6f72_fk_product_user_id` (`user_id`),
  CONSTRAINT `product_shoppingcart_product_id_70c485ef_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `product_shoppingcart_user_id_76ca6f72_fk_product_user_id` FOREIGN KEY (`user_id`) REFERENCES `product_user` (`id`),
  CONSTRAINT `product_shoppingcart_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_shoppingcart`
--

LOCK TABLES `product_shoppingcart` WRITE;
/*!40000 ALTER TABLE `product_shoppingcart` DISABLE KEYS */;
INSERT INTO `product_shoppingcart` VALUES (7,3,2,1),(9,1,3,1),(10,4,1,1);
/*!40000 ALTER TABLE `product_shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_transaction`
--

DROP TABLE IF EXISTS `product_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_transaction_product_id_cfbf52b5_fk_product_product_id` (`product_id`),
  KEY `product_transaction_user_id_d5c24199_fk_product_user_id` (`user_id`),
  CONSTRAINT `product_transaction_product_id_cfbf52b5_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `product_transaction_user_id_d5c24199_fk_product_user_id` FOREIGN KEY (`user_id`) REFERENCES `product_user` (`id`),
  CONSTRAINT `product_transaction_chk_1` CHECK ((`order_id` >= 0)),
  CONSTRAINT `product_transaction_chk_2` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_transaction`
--

LOCK TABLES `product_transaction` WRITE;
/*!40000 ALTER TABLE `product_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_user`
--

DROP TABLE IF EXISTS `product_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_user`
--

LOCK TABLES `product_user` WRITE;
/*!40000 ALTER TABLE `product_user` DISABLE KEYS */;
INSERT INTO `product_user` VALUES (1,'lei','123');
/*!40000 ALTER TABLE `product_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productapp_product`
--

DROP TABLE IF EXISTS `productapp_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productapp_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productapp_product`
--

LOCK TABLES `productapp_product` WRITE;
/*!40000 ALTER TABLE `productapp_product` DISABLE KEYS */;
INSERT INTO `productapp_product` VALUES (1,'Coke',10.99,10,'../static/coke.png','good product1'),(2,'Sprite',20.99,10,'../static/sprite.png','hello, it is product2'),(3,'Fanta',30.99,10,'../static/fanta.png','unbelievably great product');
/*!40000 ALTER TABLE `productapp_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_userprofile`
--

DROP TABLE IF EXISTS `userapp_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userapp_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_userprofile`
--

LOCK TABLES `userapp_userprofile` WRITE;
/*!40000 ALTER TABLE `userapp_userprofile` DISABLE KEYS */;
INSERT INTO `userapp_userprofile` VALUES (1,'zhuwang','abc123'),(2,'bob','123');
/*!40000 ALTER TABLE `userapp_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-21 13:14:25
