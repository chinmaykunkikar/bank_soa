-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: dbcustomer
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `dbcustomer`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbcustomer` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dbcustomer`;

--
-- Table structure for table `tcustomer`
--

DROP TABLE IF EXISTS `tcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcustomer` (
  `_id` smallint unsigned NOT NULL,
  `customername` varchar(50) NOT NULL DEFAULT 'customer_auto',
  `customeraddress` varchar(255) DEFAULT NULL,
  `customerphone` varchar(20) DEFAULT '88776655',
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodifieddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(255) DEFAULT 'SYS',
  `lastmodifiedby` varchar(255) DEFAULT 'SYS',
  PRIMARY KEY (`_id`,`customername`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER `customer_insert` AFTER INSERT ON `tcustomer` FOR EACH ROW BEGIN
  IF @trigger_flag = 1 THEN
    SET @trigger_flag = NULL;
  ELSE
    SET @trigger_flag = 1;
    INSERT INTO `dbaccount`.`tcustomer`(_id, customername, customeraddress, customerphone) VALUES (NEW._id, NEW.customername, NEW.customeraddress, NEW.customerphone);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER `customer_update` AFTER UPDATE ON `tcustomer` FOR EACH ROW BEGIN
IF @trigger_flag = 1 THEN
    SET @trigger_flag = NULL;
  ELSE
    SET @trigger_flag = 1;
	IF NEW._id <> OLD._id or NEW.customername <> OLD.customername or NEW.customeraddress <> OLD.customeraddress or NEW.customerphone <> OLD.customerphone THEN
		UPDATE `dbaccount`.`tcustomer` SET
        _id = NEW._id,
		customername = NEW.customername,
		customeraddress = NEW.customeraddress,
        customerphone = NEW.customerphone
		WHERE _id = NEW._id;
	END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER `customer_delete` AFTER DELETE ON `tcustomer` FOR EACH ROW BEGIN
IF @trigger_flag = 1 THEN
    SET @trigger_flag = NULL;
  ELSE
  SET @trigger_flag = 1;
  DELETE from `dbaccount`.`tcustomer` where _id = OLD._id;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tevents`
--

DROP TABLE IF EXISTS `tevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tevents` (
  `_id` smallint NOT NULL AUTO_INCREMENT,
  `eventsource` varchar(400) DEFAULT '',
  `eventdestination` varchar(400) DEFAULT '',
  `eventdata` json DEFAULT NULL,
  `eventstatus` tinyint DEFAULT '0',
  `eventdirection` tinyint DEFAULT '-1',
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(255) DEFAULT 'SYS',
  PRIMARY KEY (`_id`)
) AUTO_INCREMENT = 0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `dbtransactions`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbtransactions` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dbtransactions`;

--
-- Table structure for table `taccount`
--

DROP TABLE IF EXISTS `taccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccount` (
  `_id` smallint unsigned NOT NULL,
  `accountname` varchar(50) DEFAULT NULL,
  `accountbalance` int unsigned DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodifieddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(255) DEFAULT 'SYS',
  `lastmodifiedby` varchar(255) DEFAULT 'SYS',
  PRIMARY KEY (`_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER `transactions_insert` AFTER INSERT ON `taccount` FOR EACH ROW BEGIN
  IF @trigger_flag = 1 THEN
    SET @trigger_flag = NULL;
  ELSE
    SET @trigger_flag = 1;
    INSERT INTO `dbaccount`.`taccount` (_id, accountname, accountbalance) VALUES (NEW._id, NEW.accountname, NEW.accountbalance);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER `transactions_update` AFTER UPDATE ON `taccount` FOR EACH ROW BEGIN
IF @trigger_flag = 1 THEN
    SET @trigger_flag = NULL;
  ELSE
    SET @trigger_flag = 1;
IF NEW._id <> OLD._id or NEW.accountname <> OLD.accountname or NEW.accountbalance <> OLD.accountbalance THEN
UPDATE `dbaccount`.`taccount` SET
    _id = NEW._id,
    accountname = NEW.accountname,
    accountbalance = NEW.accountbalance
WHERE _id = NEW._id;
END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER `transactions_delete` AFTER DELETE ON `taccount` FOR EACH ROW BEGIN
IF @trigger_flag = 1 THEN
    SET @trigger_flag = NULL;
  ELSE
  SET @trigger_flag = 1;
  DELETE from `dbaccount`.`taccount` where _id = OLD._id;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tevents`
--

DROP TABLE IF EXISTS `tevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tevents` (
  `_id` smallint NOT NULL AUTO_INCREMENT,
  `eventsource` varchar(400) DEFAULT '',
  `eventdestination` varchar(400) DEFAULT '',
  `eventdata` json DEFAULT NULL,
  `eventstatus` tinyint DEFAULT '0',
  `eventdirection` tinyint DEFAULT '-1',
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(255) DEFAULT 'SYS',
  PRIMARY KEY (`_id`)
) AUTO_INCREMENT = 0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttransactions`
--

DROP TABLE IF EXISTS `ttransactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttransactions` (
  `_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `idsender` smallint unsigned NOT NULL,
  `idreceiver` smallint unsigned NOT NULL,
  `transferamount` int DEFAULT '50000',
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(20) DEFAULT 'SYS',
  PRIMARY KEY (`_id`),
  KEY `fk_taccount_from_idx` (`idsender`),
  KEY `fk_account_to_idx` (`idreceiver`),
  CONSTRAINT `fk_taccount_from` FOREIGN KEY (`idsender`) REFERENCES `taccount` (`_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_taccount_to` FOREIGN KEY (`idreceiver`) REFERENCES `taccount` (`_id`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT = 0;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER `new_transaction` AFTER INSERT ON `ttransactions` FOR EACH ROW BEGIN

    UPDATE `dbtransactions`.`taccount` as A
	SET A.accountbalance = A.accountbalance - NEW.transferamount
	where A._id = NEW.idsender;
	
    UPDATE `dbtransactions`.`taccount` as A
	SET A.accountbalance = A.accountbalance + NEW.transferamount
	where A._id = NEW.idreceiver;
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER `txn_update` BEFORE UPDATE ON `ttransactions` FOR EACH ROW BEGIN
signal sqlstate '45000' set message_text = 'UPDATE on transaction prevented';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `dbaccount`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbaccount` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dbaccount`;

--
-- Table structure for table `taccount`
--

DROP TABLE IF EXISTS `taccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccount` (
  `_id` smallint unsigned NOT NULL,
  `accountname` varchar(50) DEFAULT NULL,
  `accountbalance` int unsigned DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodifieddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(20) DEFAULT 'SYS',
  `lastmodifiedby` varchar(20) DEFAULT 'SYS',
  PRIMARY KEY (`_id`),
  KEY `fk_customer_name_idx` (`accountname`),
  KEY `fk_id_name_idx` (`_id`,`accountname`),
  CONSTRAINT `fk_id_name` FOREIGN KEY (`_id`, `accountname`) REFERENCES `tcustomer` (`_id`, `customername`) ON DELETE CASCADE ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER `account_insert` AFTER INSERT ON `taccount` FOR EACH ROW BEGIN
  IF @trigger_flag = 1 THEN
    SET @trigger_flag = NULL;
  ELSE
    SET @trigger_flag = 1;
    INSERT INTO `dbtransactions`.`taccount`(_id, accountname, accountbalance) VALUES (NEW._id, NEW.accountname, NEW.accountbalance);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER `account_update` AFTER UPDATE ON `taccount` FOR EACH ROW BEGIN
IF @trigger_flag = 1 THEN
    SET @trigger_flag = NULL;
  ELSE
    SET @trigger_flag = 1;
	IF NEW._id <> OLD._id or NEW.accountname <> OLD.accountname or NEW.accountbalance <> OLD.accountbalance THEN
		UPDATE `dbtransactions`.`taccount` SET
        _id = NEW._id,
		accountname = NEW.accountname,
		accountbalance = NEW.accountbalance
		WHERE _id = NEW._id;
	END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER `account_delete` AFTER DELETE ON `taccount` FOR EACH ROW BEGIN
IF @trigger_flag = 1 THEN
    SET @trigger_flag = NULL;
  ELSE
  SET @trigger_flag = 1;
  DELETE from `dbtransactions`.`taccount` where _id = OLD._id;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tcustomer`
--

DROP TABLE IF EXISTS `tcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcustomer` (
  `_id` smallint unsigned NOT NULL,
  `customername` varchar(50) NOT NULL DEFAULT 'customer_auto',
  `customeraddress` varchar(255) DEFAULT NULL,
  `customerphone` varchar(20) DEFAULT '88776655',
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodifieddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(255) DEFAULT 'SYS',
  `lastmodifiedby` varchar(255) DEFAULT 'SYS',
  PRIMARY KEY (`_id`,`customername`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER `acc_insert` AFTER INSERT ON `tcustomer` FOR EACH ROW BEGIN
  IF @trigger_flag = 1 THEN
    SET @trigger_flag = NULL;
  ELSE
    SET @trigger_flag = 1;
    INSERT INTO `dbcustomer`.`tcustomer`(_id, customername, customeraddress, customerphone) VALUES (NEW._id, NEW.customername, NEW.customeraddress, NEW.customerphone);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER `acc_update` AFTER UPDATE ON `tcustomer` FOR EACH ROW BEGIN
IF @trigger_flag = 1 THEN
    SET @trigger_flag = NULL;
  ELSE
    SET @trigger_flag = 1;
	IF NEW._id <> OLD._id or NEW.customername <> OLD.customername or NEW.customeraddress <> OLD.customeraddress or NEW.customerphone <> OLD.customerphone THEN
		UPDATE `dbcustomer`.`tcustomer` SET
        _id = NEW._id,
		customername = NEW.customername,
		customeraddress = NEW.customeraddress,
        customerphone = NEW.customerphone
		WHERE _id = NEW._id;
	END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER `acc_delete` AFTER DELETE ON `tcustomer` FOR EACH ROW BEGIN
IF @trigger_flag = 1 THEN
    SET @trigger_flag = NULL;
  ELSE
  SET @trigger_flag = 1;
  DELETE from `dbcustomer`.`tcustomer` where _id = OLD._id;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tevents`
--

DROP TABLE IF EXISTS `tevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tevents` (
  `_id` smallint NOT NULL AUTO_INCREMENT,
  `eventsource` varchar(400) DEFAULT '',
  `eventdestination` varchar(400) DEFAULT '',
  `eventdata` json DEFAULT NULL,
  `eventstatus` tinyint DEFAULT '0',
  `eventdirection` tinyint DEFAULT '-1',
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(255) DEFAULT 'SYS',
  PRIMARY KEY (`_id`)
) AUTO_INCREMENT = 0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `dbeventsync`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbeventsync` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dbeventsync`;

--
-- Table structure for table `tevents`
--

DROP TABLE IF EXISTS `tevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tevents` (
  `_id` smallint NOT NULL AUTO_INCREMENT,
  `eventsource` varchar(400) DEFAULT '',
  `eventdestination` varchar(400) DEFAULT '',
  `eventdata` json DEFAULT NULL,
  `eventstatus` tinyint DEFAULT '0',
  `eventdirection` tinyint DEFAULT '-1',
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(255) DEFAULT 'SYS',
  PRIMARY KEY (`_id`)
) AUTO_INCREMENT = 0;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-17 12:54:45
