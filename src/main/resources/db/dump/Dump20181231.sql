-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dh
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.8-MariaDB

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
-- Table structure for table `mng_material_tb`
--

DROP TABLE IF EXISTS `mng_material_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mng_material_tb` (
  `VEND_CD` int(11) NOT NULL,
  `MODEL` varchar(15) NOT NULL,
  `ITEM_NUMBER` varchar(20) DEFAULT NULL,
  `ITEM_NAME` varchar(20) DEFAULT NULL,
  `QUALITY_MATERIAL` varchar(20) DEFAULT NULL,
  `HEAT_TREATMENT_HARDNESS` varchar(20) DEFAULT NULL,
  `REMARKS` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`VEND_CD`,`MODEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mng_material_tb`
--

LOCK TABLES `mng_material_tb` WRITE;
/*!40000 ALTER TABLE `mng_material_tb` DISABLE KEYS */;
INSERT INTO `mng_material_tb` VALUES (2,'ㄱ?','1','2','3','4','5'),(2,'ㄹ','ㄹ','ㅇ','ㅁ','ㄴ','ㅊ'),(3,'','ㅇ','ㅇ','ㅇ','ㅇ','ㅇ'),(3,'기종','품번','품명','재질','열처리경도','비고');
/*!40000 ALTER TABLE `mng_material_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mng_vend_tb`
--

DROP TABLE IF EXISTS `mng_vend_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mng_vend_tb` (
  `VEND_CD` int(11) NOT NULL AUTO_INCREMENT,
  `VEND_NAME` varchar(20) DEFAULT NULL,
  `VEND_REP` varchar(10) DEFAULT NULL,
  `VEND_NUM` varchar(15) DEFAULT NULL,
  `VEND_ADDR` varchar(45) DEFAULT NULL,
  `VEND_TEL` varchar(15) DEFAULT NULL,
  `VEND_FAX` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`VEND_CD`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mng_vend_tb`
--

LOCK TABLES `mng_vend_tb` WRITE;
/*!40000 ALTER TABLE `mng_vend_tb` DISABLE KEYS */;
INSERT INTO `mng_vend_tb` VALUES (1,'ㅁㄴㅇ','ㅁㄴㅇ','','','',''),(2,'ㅎㄹㅇ','ㅀㅇ','ㄴㅇ','ㄴ','ㄴ','ㄴ'),(3,'대한정밀','김현찬','123-12312-1','진주시 상대동','055-123-1234','055-123-1234');
/*!40000 ALTER TABLE `mng_vend_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dh'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-31 17:18:05
