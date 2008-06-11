-- MySQL dump 10.11
--
-- Host: localhost    Database: biblioteka_development
-- ------------------------------------------------------
-- Server version	5.0.51a-6

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `books` (
  `id` int(11) NOT NULL auto_increment,
  `quantity` bigint(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `owner_id` bigint(11) default NULL,
  `author` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `isbn` varchar(255) default NULL,
  `print` varchar(255) default NULL,
  `content` text,
  `version` bigint(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,2,'2008-06-10 15:09:33','2008-06-10 15:09:33',NULL,'Dave Thomas','Programowanie w języku Ruby',NULL,NULL,'Opis',NULL,NULL),(2,1,'2008-06-10 15:09:34','2008-06-10 15:09:34',NULL,'Grzegorz Chmurzyński','Ja wożu mandarinku',NULL,NULL,'Proza zycia, dzien jak codzien.',NULL,NULL),(4,2,'2008-06-10 15:10:58','2008-06-10 15:10:58',NULL,'Marcin Szopa','Ruby bez przyszlosci',NULL,NULL,'kilka stron na temat kompletnej beznadziejnosci ruby',NULL,NULL),(5,1,'2008-06-10 15:11:35','2008-06-10 15:11:35',NULL,'Jerzy Piątek','Łikend',NULL,NULL,'jak spedzac weekend',NULL,NULL),(6,1,'2008-06-10 15:12:16','2008-06-10 15:12:16',NULL,'Lucas Carlson','Ruby. Receptury',NULL,NULL,'brak',NULL,NULL),(7,3,'2008-06-10 15:12:37','2008-06-10 15:12:37',NULL,'Michał Gwozdzik','Filozofia zolwika',NULL,NULL,'schizy',NULL,NULL),(8,3,'2008-06-10 15:12:39','2008-06-10 15:12:39',NULL,'Rob Orsini','Rails. Receptury',NULL,NULL,'i kolejna',NULL,NULL),(9,2,'2008-06-10 19:40:09','2008-06-10 19:40:09',NULL,'Autor','Tytuł',NULL,NULL,'Brak',NULL,NULL);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-06-11 12:29:54
