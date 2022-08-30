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
-- Table structure for table `carer`
--

DROP TABLE IF EXISTS `carer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carer` (
  `carerID` varchar(4) NOT NULL,
  `carerFName` varchar(25) DEFAULT NULL,
  `carerLName` varchar(25) DEFAULT NULL,
  `carerPhoneNum` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`carerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carer`
--

LOCK TABLES `carer` WRITE;
/*!40000 ALTER TABLE `carer` DISABLE KEYS */;
INSERT INTO `carer` VALUES ('1367','Jeanette','Moreno','218-2299\r'),('3357','Xena','O\'connor','527-2437\r'),('3710','Lawrence','Harvey','020-856-8465\r'),('3714','Vernon','Montgomery','175-0471\r'),('3886','Jason','Booker','698-0877\r'),('4302','Alma','Lowery','020-454-6762\r'),('5208','Abel','Simon','020-775-2451\r'),('5211','Lacy','Davis','020-464-0042\r'),('5235','Constance','Carpenter','020-415-5452\r'),('5244','Caleb','Harrington','873-4966\r'),('5531','Stephen','Ortiz','263-2673\r'),('6262','Leah','Terrell','622-9601\r'),('6959','Madeson','Ingram','020-059-9169\r'),('7283','Richard','Montoya','020-331-8346\r'),('7951','Carolyn','Fleming','415-6372\r'),('8517','Ivan','Hull','020-682-2498\r'),('8655','Rajah','Ferrell','020-480-9525\r'),('8675','Reuben','Wheeler','549-5404\r'),('8677','Regina','Villarreal','020-850-3131\r'),('9676','Plato','Witt','020-560-6921\r');
/*!40000 ALTER TABLE `carer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-31 11:16:32
