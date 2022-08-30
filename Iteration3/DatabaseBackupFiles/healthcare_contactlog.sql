-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: healthcare
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `contactlog`
--

DROP TABLE IF EXISTS `contactlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactlog` (
  `contactID` varchar(4) NOT NULL,
  `logDate` date DEFAULT NULL,
  `workerID` varchar(4) DEFAULT NULL,
  `patID` varchar(4) DEFAULT NULL,
  `carerID` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`contactID`),
  KEY `workerID` (`workerID`),
  KEY `carerID` (`carerID`),
  KEY `patID` (`patID`),
  CONSTRAINT `contactlog_ibfk_1` FOREIGN KEY (`workerID`) REFERENCES `worker` (`workerID`),
  CONSTRAINT `contactlog_ibfk_2` FOREIGN KEY (`carerID`) REFERENCES `contactor` (`carerID`),
  CONSTRAINT `contactlog_ibfk_3` FOREIGN KEY (`patID`) REFERENCES `contactor` (`patID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactlog`
--

LOCK TABLES `contactlog` WRITE;
/*!40000 ALTER TABLE `contactlog` DISABLE KEYS */;
INSERT INTO `contactlog` VALUES ('1178','2013-03-12','1556','4484','5531'),('1583','2010-06-04','7749','2463','3886'),('347','2018-02-07','1799','4178','6262'),('4913','2020-02-02','5936','9281','3710'),('5161','2019-09-30','7341','8648','3357'),('5170','2004-09-30','6868','5296','8517'),('5564','2018-06-22','4585','7437','5235'),('5570','2011-10-30','278','7477','7951'),('5572','2002-08-02','1416','3229','6959'),('610','2009-05-15','1697','4963','7283'),('6155','2011-05-18','8757','2279','8677'),('6482','2011-08-05','4818','6213','9676'),('6627','2009-11-10','919','7686','1367'),('6656','2000-10-12','1086','4506','8675'),('6844','2002-04-12','5315','8095','5211'),('7056','2012-04-27','3422','3300','5208'),('7210','2020-01-28','6454','6347','8655'),('7277','2021-02-12','2188','7267','3714'),('8168','2009-02-19','6655','6734','5244'),('8407','2003-02-26','3721','8261','4302'),('cont','0000-00-00','work','patI','care');
/*!40000 ALTER TABLE `contactlog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-31 10:11:31
