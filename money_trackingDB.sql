-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: money_tracking_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `money_tb`
--

DROP TABLE IF EXISTS `money_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `money_tb` (
  `moneyId` int(11) NOT NULL AUTO_INCREMENT,
  `moneyDetail` varchar(100) NOT NULL,
  `moneyDate` varchar(100) NOT NULL,
  `moneyInOut` double NOT NULL,
  `moneyType` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`moneyId`),
  KEY `userId` (`userId`),
  CONSTRAINT `money_tb_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user_tb` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `money_tb`
--

/*!40000 ALTER TABLE `money_tb` DISABLE KEYS */;
INSERT INTO `money_tb` VALUES (1,'ซ์้อรองเท้า Nike Air มือ 2','2 กุมภาพันธ์ 2567',800,2,1),(2,'ขายของออนไลน์','12 มกราคม 2567',2200,1,1),(3,'ซื้อคีย์บอร์ด','10 มกราคม 2567',1250,2,2),(31,'ออมเงิน','2024-11-25',120,1,1),(32,'foodTruck','2024-11-26',100,2,1);
/*!40000 ALTER TABLE `money_tb` ENABLE KEYS */;

--
-- Table structure for table `user_tb`
--

DROP TABLE IF EXISTS `user_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tb` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userFullName` varchar(100) NOT NULL,
  `userBirthDate` varchar(100) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `userPassword` varchar(50) NOT NULL,
  `userImage` varchar(100) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tb`
--

/*!40000 ALTER TABLE `user_tb` DISABLE KEYS */;
INSERT INTO `user_tb` VALUES (1,'Dusit Pakdeekunakorn','27 กรกฎาคม 2547','nkm','1','img1.png'),(2,'Dusis Pakdeekunakorn','28 กรกฎาคม 2547','ds','1','img2.png'),(6,'dusit Pak','27 กรกฎาคม พ.ศ. 2547','knm','q','ProfilePic_6740773141513_1732278065268.jpg');
/*!40000 ALTER TABLE `user_tb` ENABLE KEYS */;

--
-- Dumping routines for database 'money_tracking_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-02 17:18:15
