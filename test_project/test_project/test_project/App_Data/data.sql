-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.50-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for test_database
CREATE DATABASE IF NOT EXISTS `test_database` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test_database`;


-- Dumping structure for table test_database.customer_data
CREATE TABLE IF NOT EXISTS `customer_data` (
  `Customer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_Name` varchar(100) DEFAULT NULL,
  `Customer_Phone` varchar(50) DEFAULT NULL,
  `Customer_Address` varchar(250) DEFAULT NULL,
  `Customer_Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for procedure test_database.customer_Insert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_Insert`(IN `Customer_Name` VARCHAR(100), IN `Customer_Phone` VARCHAR(50), IN `Customer_Address` VARCHAR(200), IN `Customer_Email` VARCHAR(100))
    COMMENT 'customer_Insert'
BEGIN
 insert into customer_data (Customer_Name,Customer_Phone,Customer_Address,Customer_Email)values
 (Customer_Name,Customer_Phone,Customer_Address,Customer_Email);  
END//
DELIMITER ;


-- Dumping structure for procedure test_database.customer_Update
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_Update`(IN `Customer_ID` INT, IN `Customer_Name` VARCHAR(100), IN `Customer_Phone_Number` VARCHAR(100), IN `Customer_Address` VARCHAR(100), IN `Customer_Email` VARCHAR(100))
    COMMENT 'customer_Update'
BEGIN
 update customer_data
 set 
 Customer_Name=Customer_Name,
 Customer_Phone=Customer_Phone_Number,
 Customer_Address=Customer_Address,
 Customer_Email=Customer_Email where Customer_ID=Customer_ID  ; 
  
END//
DELIMITER ;


-- Dumping structure for procedure test_database.dbGrid_Full
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `dbGrid_Full`()
    COMMENT 'dbGrid_Full'
BEGIN
  select * from Customer_Data order by Customer_name; 
END//
DELIMITER ;


-- Dumping structure for procedure test_database.Invoice_Customer_Full
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Invoice_Customer_Full`()
    COMMENT 'Invoice_Customer_Full'
BEGIN
 select Customer_ID,Customer_Name from Customer_data order by Customer_name ; 
END//
DELIMITER ;


-- Dumping structure for table test_database.invoice_data
CREATE TABLE IF NOT EXISTS `invoice_data` (
  `InvoiceId_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_ID` int(11) DEFAULT NULL,
  `InvoiceId_DateTime` datetime DEFAULT NULL,
  `Value` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`InvoiceId_ID`),
  KEY `FK_invoice_customer` (`Customer_ID`),
  CONSTRAINT `FK_invoice_customer` FOREIGN KEY (`Customer_ID`) REFERENCES `customer_data` (`Customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for procedure test_database.Invoice_dbGrid
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Invoice_dbGrid`()
    COMMENT 'Invoice_dbGrid'
BEGIN
 select * from invoice_data where Customer_ID=Customer_ID ;
END//
DELIMITER ;


-- Dumping structure for procedure test_database.Invoice_Insert
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Invoice_Insert`(IN `Customer_ID` INT, IN `InvoiceId_DateTime` DATETIME, IN `Value` DECIMAL(10,0))
    COMMENT 'Invoice_Insert'
BEGIN
  insert into invoice_data (Customer_ID,InvoiceId_DateTime,Value)
                      values(Customer_ID,InvoiceId_DateTime,Value) ;
END//
DELIMITER ;


-- Dumping structure for procedure test_database.Invoice_Update
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Invoice_Update`(IN `InvoiceId_ID` INT, IN `Customer_ID` INT, IN `InvoiceId_DateTime` DATETIME)
    COMMENT 'Invoice_Update'
BEGIN
  update invoice_data 
  set Customer_ID=Customer_ID
  ,InvoiceId_DateTime=InvoiceId_DateTime,Value=Value where InvoiceId_ID=InvoiceId_ID;
END//
DELIMITER ;


-- Dumping structure for procedure test_database.Select_Cus
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_Cus`(IN `customer_ID` INT)
BEGIN
 select * from customer_data where customer_ID=customer_ID ;
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
