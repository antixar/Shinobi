-- MySQL dump 10.13  Distrib 5.6.38, for Linux (x86_64)
--
-- Host: localhost    Database: camera
-- ------------------------------------------------------
-- Server version	5.6.38

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
-- Table structure for table `API`
--

DROP TABLE IF EXISTS `API`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `API` (
  `ke` varchar(50) DEFAULT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `ip` tinytext,
  `code` varchar(100) DEFAULT NULL,
  `details` text,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `API`
--

LOCK TABLES `API` WRITE;
/*!40000 ALTER TABLE `API` DISABLE KEYS */;
/*!40000 ALTER TABLE `API` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Events`
--

DROP TABLE IF EXISTS `Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Events` (
  `ke` varchar(50) DEFAULT NULL,
  `mid` varchar(50) DEFAULT NULL,
  `details` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Events`
--

LOCK TABLES `Events` WRITE;
/*!40000 ALTER TABLE `Events` DISABLE KEYS */;
/*!40000 ALTER TABLE `Events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Logs`
--

DROP TABLE IF EXISTS `Logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Logs` (
  `ke` varchar(50) DEFAULT NULL,
  `mid` varchar(50) DEFAULT NULL,
  `info` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Monitors`
--

DROP TABLE IF EXISTS `Monitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Monitors` (
  `mid` varchar(50) DEFAULT NULL,
  `ke` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `shto` text,
  `shfr` text,
  `details` longtext,
  `type` varchar(50) DEFAULT 'jpeg',
  `ext` varchar(50) DEFAULT 'webm',
  `protocol` varchar(50) DEFAULT 'http',
  `host` varchar(100) DEFAULT '0.0.0.0',
  `path` varchar(100) DEFAULT '/',
  `port` int(8) DEFAULT '80',
  `fps` int(8) DEFAULT '1',
  `mode` varchar(15) DEFAULT NULL,
  `width` int(11) DEFAULT '640',
  `height` int(11) DEFAULT '360'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Presets`
--

DROP TABLE IF EXISTS `Presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Presets` (
  `ke` varchar(50) DEFAULT NULL,
  `name` text,
  `details` text,
  `type` enum('monitor','event','user') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `ke` varchar(50) DEFAULT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `auth` varchar(50) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `details` longtext,
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('2Df5hBE','XDf5hB3','8dbd2cb8c2f5fbc0de57461007016fef','ccio@m03.ca','5f4dcc3b5aa765d61d8327deb882cf99','{\"days\":\"10\"}');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Videos`
--

DROP TABLE IF EXISTS `Videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Videos` (
  `mid` varchar(50) DEFAULT NULL,
  `ke` varchar(50) DEFAULT NULL,
  `ext` enum('webm','mp4') DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `size` float DEFAULT NULL,
  `frames` int(11) DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '0:Building,1:Complete,2:Read,3:Archive',
  `details` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-27 23:09:11
