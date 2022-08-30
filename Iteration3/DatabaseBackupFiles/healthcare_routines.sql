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
-- Temporary table structure for view `patient_over_90`
--

DROP TABLE IF EXISTS `patient_over_90`;
/*!50001 DROP VIEW IF EXISTS `patient_over_90`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `patient_over_90` (
  `patID` tinyint NOT NULL,
  `patFName` tinyint NOT NULL,
  `AGE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `patient_contact`
--

DROP TABLE IF EXISTS `patient_contact`;
/*!50001 DROP VIEW IF EXISTS `patient_contact`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `patient_contact` (
  `patID` tinyint NOT NULL,
  `patFname` tinyint NOT NULL,
  `patPhoneNum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `patient_carer_relationship`
--

DROP TABLE IF EXISTS `patient_carer_relationship`;
/*!50001 DROP VIEW IF EXISTS `patient_carer_relationship`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `patient_carer_relationship` (
  `patID` tinyint NOT NULL,
  `patFName` tinyint NOT NULL,
  `carerID` tinyint NOT NULL,
  `carerFName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `patient_over_90`
--

/*!50001 DROP TABLE IF EXISTS `patient_over_90`*/;
/*!50001 DROP VIEW IF EXISTS `patient_over_90`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_over_90` AS select `patient`.`patID` AS `patID`,`patient`.`patFName` AS `patFName`,timestampdiff(YEAR,`patient`.`DOB`,curdate()) AS `AGE` from ((`contactlog` join `contactor`) join `patient` on(`contactlog`.`patID` = `patient`.`patID`)) where timestampdiff(YEAR,`patient`.`DOB`,curdate()) >= 90 group by `patient`.`patID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_contact`
--

/*!50001 DROP TABLE IF EXISTS `patient_contact`*/;
/*!50001 DROP VIEW IF EXISTS `patient_contact`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_contact` AS select `patient`.`patID` AS `patID`,`patient`.`patFName` AS `patFname`,`patient`.`patPhoneNum` AS `patPhoneNum` from ((`contactlog` join `contactor`) join `patient` on(`contactlog`.`patID` = `patient`.`patID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_carer_relationship`
--

/*!50001 DROP TABLE IF EXISTS `patient_carer_relationship`*/;
/*!50001 DROP VIEW IF EXISTS `patient_carer_relationship`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_carer_relationship` AS select `contactlog`.`patID` AS `patID`,`patient`.`patFName` AS `patFName`,`contactlog`.`carerID` AS `carerID`,`carer`.`carerFName` AS `carerFName` from (((`contactlog` join `contactor`) join `patient` on(`contactlog`.`patID` = `patient`.`patID`)) join `carer` on(`contactlog`.`carerID` = `carer`.`carerID`)) group by `carer`.`carerID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-31 10:11:31
