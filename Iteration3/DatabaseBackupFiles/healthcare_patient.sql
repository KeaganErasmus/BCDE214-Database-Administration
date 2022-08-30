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
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patID` varchar(4) NOT NULL,
  `patFName` varchar(25) DEFAULT NULL,
  `patLName` varchar(25) DEFAULT NULL,
  `patPhoneNum` varchar(15) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`patID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('2279','Malik','Kane','945-6743','1963-12-13'),('2463','Jelani','Trujillo','629-8558','1962-09-27'),('3229','Uma','Chase','027-272-6352','1967-06-16'),('3300','Aaron','Wilkinson','027-467-2651','1932-02-28'),('4178','Eagan','Berg','027-368-4916','1945-10-04'),('4484','Jeremy','Graves','538-7575','1965-04-04'),('4506','Halee','Garza','020-336-3597','1961-12-29'),('4963','Shelby','Humphrey','020-352-1711','1944-06-17'),('5296','Jorden','Hebert','281-7501','1950-12-09'),('6213','Jermaine','Buck','816-0767','1952-06-09'),('6347','Tanek','Zimmerman','027-041-7296','1959-06-24'),('6734','Alvin','Dunn','020-367-1945','1930-08-29'),('7267','Kerry','Lindsay','027-748-2195','1947-12-10'),('7437','Serena','Whitaker','801-2753','1966-08-22'),('7477','Emily','Stevenson','027-257-9884','1968-10-28'),('7686','Zephania','Fowler','846-6355','1956-09-27'),('8095','Martina','Santana','027-938-6832','1967-06-03'),('8261','Quail','Gilliam','831-1012','1950-07-25'),('8648','Kevyn','Carver','020-375-9428','1969-10-16'),('9281','Rebekah','Vargas','027-083-5553','1969-01-15');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
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
