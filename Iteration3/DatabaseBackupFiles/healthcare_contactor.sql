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
-- Table structure for table `contactor`
--

DROP TABLE IF EXISTS `contactor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactor` (
  `carerID` varchar(4) NOT NULL,
  `patID` varchar(4) NOT NULL,
  PRIMARY KEY (`carerID`,`patID`),
  KEY `patID` (`patID`),
  CONSTRAINT `contactor_ibfk_1` FOREIGN KEY (`patID`) REFERENCES `patient` (`patID`),
  CONSTRAINT `contactor_ibfk_2` FOREIGN KEY (`carerID`) REFERENCES `carer` (`carerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactor`
--

LOCK TABLES `contactor` WRITE;
/*!40000 ALTER TABLE `contactor` DISABLE KEYS */;
INSERT INTO `contactor` VALUES ('1367','7686'),('3357','8648'),('3710','9281'),('3714','7267'),('3886','2463'),('4302','8261'),('5208','3300'),('5211','8095'),('5235','7437'),('5244','6734'),('5531','4484'),('6262','4178'),('6959','3229'),('7283','4963'),('7951','7477'),('8517','5296'),('8655','6347'),('8675','4506'),('8677','2279'),('9676','6213'),('care','patI');
/*!40000 ALTER TABLE `contactor` ENABLE KEYS */;
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
