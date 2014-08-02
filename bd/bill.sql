CREATE DATABASE  IF NOT EXISTS `bill` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bill`;
-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bill
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
-- Table structure for table `invoices_to_pay`
--

DROP TABLE IF EXISTS `invoices_to_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices_to_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `value` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices_to_pay`
--

LOCK TABLES `invoices_to_pay` WRITE;
/*!40000 ALTER TABLE `invoices_to_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices_to_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices_to_receive`
--

DROP TABLE IF EXISTS `invoices_to_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices_to_receive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `value` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices_to_receive`
--

LOCK TABLES `invoices_to_receive` WRITE;
/*!40000 ALTER TABLE `invoices_to_receive` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices_to_receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotas_to_pay_id` int(11) NOT NULL,
  `value` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payments_quotas_to_pay_idx` (`quotas_to_pay_id`),
  CONSTRAINT `fk_payments_quotas_to_pay` FOREIGN KEY (`quotas_to_pay_id`) REFERENCES `quotas_to_pay` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotas_to_pay`
--

DROP TABLE IF EXISTS `quotas_to_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotas_to_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoices_to_pay_id` int(11) NOT NULL,
  `quota_value` decimal(12,2) NOT NULL,
  `value_to_pay` decimal(12,2) NOT NULL,
  `paid` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_quotas_to_pay_invoices_to_pay_idx` (`invoices_to_pay_id`),
  CONSTRAINT `fk_quotas_to_pay_invoices_to_pay` FOREIGN KEY (`invoices_to_pay_id`) REFERENCES `invoices_to_pay` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotas_to_pay`
--

LOCK TABLES `quotas_to_pay` WRITE;
/*!40000 ALTER TABLE `quotas_to_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotas_to_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotas_to_receive`
--

DROP TABLE IF EXISTS `quotas_to_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotas_to_receive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_to_receive_id` int(11) NOT NULL,
  `quota_value` decimal(12,2) NOT NULL,
  `value_to_receive` decimal(12,2) NOT NULL,
  `received` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_quotas_to_receive_invoices_to_receive_idx` (`invoice_to_receive_id`),
  CONSTRAINT `fk_quotas_to_receive_invoices_to_receive` FOREIGN KEY (`invoice_to_receive_id`) REFERENCES `invoices_to_receive` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotas_to_receive`
--

LOCK TABLES `quotas_to_receive` WRITE;
/*!40000 ALTER TABLE `quotas_to_receive` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotas_to_receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotas_to_receive_id` int(11) NOT NULL,
  `value` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payments_quotas_to_receive_idx` (`quotas_to_receive_id`),
  CONSTRAINT `fk_payments_quotas_to_receive` FOREIGN KEY (`quotas_to_receive_id`) REFERENCES `quotas_to_receive` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipts`
--

LOCK TABLES `receipts` WRITE;
/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-28 12:12:16
