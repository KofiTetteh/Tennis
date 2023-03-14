-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 24, 2022 at 02:24 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction`
--
CREATE DATABASE IF NOT EXISTS `auction` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `auction`;

-- --------------------------------------------------------

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
CREATE TABLE IF NOT EXISTS `auction` (
  `auctionid` int(11) NOT NULL AUTO_INCREMENT,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `startprice` float(10,2) NOT NULL,
  `username` varchar(200) NOT NULL,
  `propertyid` int(11) NOT NULL,
  `soldstatus` varchar(200) NOT NULL,
  PRIMARY KEY (`auctionid`),
  KEY `username` (`username`),
  KEY `propertyid` (`propertyid`)
) ENGINE=InnoDB AUTO_INCREMENT=941122 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auction`
--

INSERT INTO `auction` (`auctionid`, `startdate`, `enddate`, `startprice`, `username`, `propertyid`, `soldstatus`) VALUES
(124570, '2019-11-22', '2020-01-31', 100000.00, 'admin', 21102, 'Unsold'),
(941121, '2019-11-25', '2020-02-28', 200000.00, 'admin', 21102, 'Unsold');

-- --------------------------------------------------------

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
CREATE TABLE IF NOT EXISTS `bid` (
  `bidid` int(11) NOT NULL AUTO_INCREMENT,
  `amount` float(10,2) NOT NULL,
  `auctionid` int(11) NOT NULL,
  `bidderid` int(11) NOT NULL,
  PRIMARY KEY (`bidid`),
  KEY `auctionid` (`auctionid`),
  KEY `bidderid` (`bidderid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bid`
--

INSERT INTO `bid` (`bidid`, `amount`, `auctionid`, `bidderid`) VALUES
(1, 125000.00, 124570, 4);

-- --------------------------------------------------------

--
-- Table structure for table `bidder`
--

DROP TABLE IF EXISTS `bidder`;
CREATE TABLE IF NOT EXISTS `bidder` (
  `bidderid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phonenumber` char(10) NOT NULL,
  `password` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`bidderid`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bidder`
--

INSERT INTO `bidder` (`bidderid`, `firstname`, `lastname`, `email`, `phonenumber`, `password`, `address`) VALUES
(3, 'Adjei', 'Amarh', 'amarh@gmail.com', '0124578963', 'MTIzNDU2Nzg5', 'Tema 22 Annex'),
(4, 'Ash', 'Ash', 'kingashysnr@gmail.com', '1234567890', 'MTIzNDU2Nzg5', '0123456789'),
(111, 'Nii', 'Ashitey', 'ashitey@gmail.com', '0203479793', 'YXNkZnF3ZXI=', 'Tema 22 Annex'),
(112, 'Naa', 'Mensa', 'naa@gmail.com', '0102145845', 'MTIzNDU2Nzg=', 'Tema 22 Annex');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
CREATE TABLE IF NOT EXISTS `owner` (
  `ownerid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phonenumber` char(10) NOT NULL,
  `password` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`ownerid`),
  KEY `ownerid` (`ownerid`)
) ENGINE=InnoDB AUTO_INCREMENT=11203 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`ownerid`, `firstname`, `lastname`, `email`, `phonenumber`, `password`, `address`) VALUES
(11201, 'Ashitey', 'Onukpa', 'kingashyjnr@gmail.com', '0203479793', 'c2FmbzA3NDc=', 'Tema 22 Annex'),
(11202, 'Naa Adjeley', 'Mansa', 'kingashysnr@gmail.com', '0203497979', 'MTIzNDU2Nzg5', 'Tema Comm 1');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `paymentid` int(11) NOT NULL AUTO_INCREMENT,
  `amount` float(10,2) NOT NULL,
  `propertyid` int(11) NOT NULL,
  PRIMARY KEY (`paymentid`),
  KEY `propertyid` (`propertyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `propertyid` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `documents` blob NOT NULL,
  `documentsname` varchar(200) NOT NULL,
  `image1` blob NOT NULL,
  `image1name` varchar(200) NOT NULL,
  `image2` blob NOT NULL,
  `image2name` varchar(200) NOT NULL,
  `buildingstatus` varchar(200) NOT NULL,
  `dateuploaded` date NOT NULL,
  `verification` varchar(200) NOT NULL,
  `ownerid` int(11) NOT NULL,
  PRIMARY KEY (`propertyid`),
  KEY `ownerid` (`ownerid`)
) ENGINE=InnoDB AUTO_INCREMENT=21105 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`propertyid`, `description`, `location`, `documents`, `documentsname`, `image1`, `image1name`, `image2`, `image2name`, `buildingstatus`, `dateuploaded`, `verification`, `ownerid`) VALUES
(21102, '2 Bedroom with Boys quatres', 'Accra North', 0x7363616e2e706466, 'scan.pdf', 0x37323530383036322e6a7067, '72508062.jpg', 0x352e6a7067, '5.jpg', 'Renovated', '2019-11-22', 'Verified', 11201),
(21103, '6 Bedroom Apartment, 2 Boys quaters', 'Kasoa', 0x646f6e652e706466, 'done.pdf', 0x686f7573652e6a7067, 'house.jpg', 0x686f7573652e6a7067, 'house.jpg', 'Old', '2019-11-23', 'Verified', 11201),
(21104, '6 bedroom', 'Accra', 0x424553534d4f4e5320666c79657220696e666f2e646f6378, 'BESSMONS flyer info.docx', 0x6b69746368656e2e6a7067, 'kitchen.jpg', 0x6b69746368656e2e6a7067, 'kitchen.jpg', 'New', '2019-11-23', 'Pending', 11202);

-- --------------------------------------------------------

--
-- Table structure for table `saved`
--

DROP TABLE IF EXISTS `saved`;
CREATE TABLE IF NOT EXISTS `saved` (
  `saveid` int(11) NOT NULL AUTO_INCREMENT,
  `bidderid` int(11) NOT NULL,
  `auctionid` int(11) NOT NULL,
  PRIMARY KEY (`saveid`),
  KEY `bidderid` (`bidderid`),
  KEY `auctionid` (`auctionid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saved`
--

INSERT INTO `saved` (`saveid`, `bidderid`, `auctionid`) VALUES
(4, 4, 124570);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(200) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `job` varchar(200) NOT NULL,
  `login_session_key` varchar(255) DEFAULT NULL,
  `email_status` varchar(20) DEFAULT NULL,
  `password_reset_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `job`, `login_session_key`, `email_status`, `password_reset_key`) VALUES
('admin', 'YWRtaW4xMjM0', 'Administrator', NULL, NULL, NULL),
('lands', 'bGFuZHMxMjM0', 'lands commission', NULL, NULL, NULL),
('receptionist', 'cmVjZXB0aW9uaXN0', 'Receptionist', NULL, NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auction`
--
ALTER TABLE `auction`
  ADD CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bid`
--
ALTER TABLE `bid`
  ADD CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`auctionid`) REFERENCES `auction` (`auctionid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`bidderid`) REFERENCES `bidder` (`bidderid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `property_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `owner` (`ownerid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `saved`
--
ALTER TABLE `saved`
  ADD CONSTRAINT `saved_ibfk_1` FOREIGN KEY (`bidderid`) REFERENCES `bidder` (`bidderid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `saved_ibfk_2` FOREIGN KEY (`auctionid`) REFERENCES `auction` (`auctionid`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `childrenpartyforyou`
--
CREATE DATABASE IF NOT EXISTS `childrenpartyforyou` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `childrenpartyforyou`;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `bookingid` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customername` varchar(30) NOT NULL,
  `Number` int(10) DEFAULT NULL,
  `BookingDate` date DEFAULT NULL,
  `PartyBooked` varchar(30) DEFAULT NULL,
  `fullcost` int(20) DEFAULT NULL,
  `amount_perchild` int(20) DEFAULT NULL,
  `reg_date` timestamp NULL DEFAULT NULL,
  `bookstatus` enum('1','0') NOT NULL,
  PRIMARY KEY (`bookingid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bookingid`, `customername`, `Number`, `BookingDate`, `PartyBooked`, `fullcost`, `amount_perchild`, `reg_date`, `bookstatus`) VALUES
(1, 'abena kwame', 348902387, '2017-03-12', 'bad bitches', 350, 7, '2022-03-23 14:17:44', '1'),
(2, 'abena kwame', 34, '2019-02-13', 'bad bitches', 6516, 543, '2022-03-23 19:16:14', '0');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customerid` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customername` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `childDateOfBirth` date NOT NULL,
  `childage` int(11) NOT NULL,
  `childgender` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `Accesslevel` varchar(30) NOT NULL DEFAULT 'user',
  `reg_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerid`, `customername`, `address`, `childDateOfBirth`, `childage`, `childgender`, `email`, `username`, `password`, `Accesslevel`, `reg_date`) VALUES
(1, 'thomas', 'hbwfy26', '2000-09-09', 21, 'M', 'thomas@gmail.com', 'thomas12', '123', 'admin', '2022-03-21 00:00:00'),
(2, 'abena kwame', 'jbskdnfj', '1993-03-20', 29, 'F', 'abena@gmail.com', 'Abena123', '8910', 'user', '2022-03-21 20:14:57');

-- --------------------------------------------------------

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
CREATE TABLE IF NOT EXISTS `party` (
  `partyid` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `partytype` varchar(30) NOT NULL,
  `partyDesc` text NOT NULL,
  `costperchild` double(9,2) DEFAULT NULL,
  `partylength` varchar(30) NOT NULL,
  `nochildattend` varchar(30) NOT NULL,
  `prodnservices` text NOT NULL,
  `reg_date` timestamp NULL DEFAULT NULL,
  `partyImg` varchar(100) NOT NULL,
  PRIMARY KEY (`partyid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `party`
--

INSERT INTO `party` (`partyid`, `partytype`, `partyDesc`, `costperchild`, `partylength`, `nochildattend`, `prodnservices`, `reg_date`, `partyImg`) VALUES
(1, 'bad bitches', 'iewih', 20.00, '4', '100', 'wuijfbjwb', '2022-03-23 14:16:08', 'party-img-(1).png');
--
-- Database: `drumeo`
--
CREATE DATABASE IF NOT EXISTS `drumeo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `drumeo`;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `postal_code` varchar(255) DEFAULT 'CCICC',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `address1`, `address2`, `city`, `postal_code`, `created_at`, `updated_at`) VALUES
(1, 'House de chaule ', '761 Riverside close Connedale', 'Arkansvilles', 'CCICC', '2017-04-14 13:50:00', '2017-04-14 13:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
CREATE TABLE IF NOT EXISTS `appointments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time_rang` varchar(30) NOT NULL,
  `waiting` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `hash` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `appoin_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `date`, `time_rang`, `waiting`, `created_at`, `updated_at`, `hash`, `customer_id`, `appoin_id`) VALUES
(1, '2017-10-21', '12:00 PM - 02:00PM', 1, '2017-10-21 09:51:10', '2017-10-21 09:51:10', 'c696fe8b364d9bfbc5438c4290b4da266d75aeb35395cbd7870bf6bfa385ad98', 5, 'b4fa2ae0');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `telephone`, `created_at`, `updated_at`) VALUES
(1, 'SHandel', 'shanleeey@yahoo.com', '0549834718', '2017-04-14 13:50:00', '2017-04-14 13:50:00'),
(2, 'xdfb df', 'solomonkaura@gmail.com', '0549834718', '2017-04-24 13:40:41', '2017-04-24 13:40:41'),
(3, 'Jonh Honaa', 'james@gmail.com', '0549834718', '2017-04-24 14:32:30', '2017-04-24 14:32:30'),
(4, 'David', 'david.smith@gmail.com', '0549834718', '2017-05-03 14:37:29', '2017-05-03 14:37:29'),
(5, 'Admon Moses', 'admon@demo.com', '0547484719', '2017-10-21 09:51:10', '2017-10-21 09:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) NOT NULL,
  `total` float NOT NULL,
  `delivered` tinyint(4) NOT NULL,
  `address_id` int(11) NOT NULL,
  `paid` tinyint(4) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
CREATE TABLE IF NOT EXISTS `orders_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `failed` tinyint(4) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `description`, `price`, `image`, `stock`, `created_at`, `updated_at`) VALUES
(1, 'old french horn isolated', 'it just an old french horn isolated', 'Buy the best old french horn isolated from us', 1230, '1.jpg', 20, '2017-04-09 13:33:08', '2017-04-09 13:33:08'),
(2, 'Gleaming Brass Saxophone', 'it just a Gleaming Brass Saxophone', 'Buy the best Gleaming Brass Saxophone from us', 1000, '2.jpg', 20, '2017-04-09 13:35:53', '2017-04-09 13:35:53'),
(3, 'Percussion', 'it just a Percussion', 'Buy the best Percussion', 500, '3.jpg', 20, '2017-04-09 13:36:39', '2017-04-09 13:36:39');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `appointment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `created_at`, `updated_at`, `appointment_id`) VALUES
(1, 'General Maintenance', '2017-10-21 09:51:10', '2017-10-21 09:51:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2016-12-29 00:55:10', '2017-01-06 14:29:42'),
(2, 'admin2', 'admin2@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '2022-03-07 00:00:00', '2022-03-20 00:00:00');
--
-- Database: `hospital`
--
CREATE DATABASE IF NOT EXISTS `hospital` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hospital`;

-- --------------------------------------------------------

--
-- Table structure for table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
CREATE TABLE IF NOT EXISTS `consultation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientid` int(11) NOT NULL,
  `weight` double NOT NULL,
  `pressure` double NOT NULL,
  `temperature` double NOT NULL,
  `symptom` text NOT NULL,
  `status` enum('pending','queue','seen') NOT NULL,
  `arrivaldate` date NOT NULL,
  `assignto` int(11) NOT NULL,
  `nurseid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consultation`
--

INSERT INTO `consultation` (`id`, `patientid`, `weight`, `pressure`, `temperature`, `symptom`, `status`, `arrivaldate`, `assignto`, `nurseid`) VALUES
(1, 7, 45, 232, 212, 'weludy eqiudb qu', 'seen', '2017-10-01', 3, 5),
(2, 6, 70, 90.5, 37, 'wwq eqwuqwsaa<br />\nwqueyqw qwuyqqd<br />\nqw45d 7qw, oiq<br />\n-qwygbd<br />\n- uywqiuqw <br />\n- qwiuyqw', 'seen', '2017-10-01', 3, 5),
(3, 6, 130, 45, 23, 'ewue euqoqwe qweqw eqwoi', 'seen', '2017-10-02', 3, 5),
(4, 11, 72, 50, 37, 'tr gryt gruy grjytg ruy', 'seen', '2017-10-05', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `labexam`
--

DROP TABLE IF EXISTS `labexam`;
CREATE TABLE IF NOT EXISTS `labexam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `WBC_COUNT` double DEFAULT NULL,
  `RBC_COUNT` double DEFAULT NULL,
  `HEMOGLOBIN` double DEFAULT NULL,
  `HEMATOCRIT` double DEFAULT NULL,
  `MCV` double DEFAULT NULL,
  `MCH` double DEFAULT NULL,
  `MCHC` double DEFAULT NULL,
  `RDW_CV` double DEFAULT NULL,
  `PLATELET_COUNT` double DEFAULT NULL,
  `MPV` double DEFAULT NULL,
  `madedate` date DEFAULT NULL,
  `pay` int(11) DEFAULT NULL,
  `status` enum('queue','done') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `labexam`
--

INSERT INTO `labexam` (`id`, `cid`, `WBC_COUNT`, `RBC_COUNT`, `HEMOGLOBIN`, `HEMATOCRIT`, `MCV`, `MCH`, `MCHC`, `RDW_CV`, `PLATELET_COUNT`, `MPV`, `madedate`, `pay`, `status`) VALUES
(3, 2, 12, 13, 24, 13, 21, 51, 54, 21, 21, 21, '2017-10-02', 70, 'done'),
(4, 4, 13, 13, 435, 53, 53, 353, 53, 53, 53, 53, '2017-10-05', 100, 'done');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay` double NOT NULL,
  `aid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `paydate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `pay`, `aid`, `pid`, `cid`, `paydate`) VALUES
(1, 70, 8, 7, 1, '2017-10-01 18:36:49'),
(3, 70, 8, 6, 2, '2017-10-01 18:37:36'),
(4, 120, 8, 6, 3, '2017-10-02 17:10:57'),
(5, 100, 8, 11, 4, '2017-10-05 12:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
CREATE TABLE IF NOT EXISTS `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `cdate` date NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`id`, `cid`, `did`, `cdate`, `note`) VALUES
(1, 1, 3, '2017-10-01', 'uqy weuwe qweuasd asiduas dasoiudqw eoasd asldihq wuass<br />\r\n- qwiueyqwueyoqw <br />\r\n-  wqueyoqwiehqwe<br />\r\n- qwoeuywqoieoqw <br />\r\n- qweuiqwe<br />\r\nquwewqe qwieuyq assduasodas dasudasd askuhs'),
(2, 1, 3, '2017-10-02', 'fewhy htrjd erjyf d<br />\r\njyr'),
(3, 1, 3, '2017-10-02', 'yqwtew qeqowieqw eoiqwb qw'),
(4, 2, 3, '2017-10-02', 'tqwiwq qwiuehqw eqwue asoidas dasouhdas douiqw dasoubd as'),
(5, 3, 3, '2017-10-02', 'wuwqyeoiw asdhna s,duqw e'),
(6, 4, 3, '2017-10-05', 'teuydhythgduyx reytr dhtgd');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `phone` int(9) UNSIGNED ZEROFILL NOT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `birthday` date NOT NULL,
  `usertype` int(1) NOT NULL,
  `registrationdate` datetime NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone`, `sex`, `birthday`, `usertype`, `registrationdate`, `username`, `pass`) VALUES
(1, 'Adminisatrator', 000000000, 'Male', '2014-04-15', 6, '2017-10-01 12:46:10', 'admin', '9dfde458b237e79c1ca78f48d3f1e2eab7db37f9'),
(3, 'Fredius Tout Court', 123456789, 'Male', '1993-11-06', 5, '2017-10-01 14:38:43', 'fredius', '9dfde458b237e79c1ca78f48d3f1e2eab7db37f9'),
(4, 'Fredius Tout Court Ori', 123456789, 'Male', '1993-11-06', 4, '2017-10-01 14:40:21', 'frediustc', '9dfde458b237e79c1ca78f48d3f1e2eab7db37f9'),
(5, 'Andreas Tout Court Gisel', 123456789, 'Female', '1994-06-06', 2, '2017-10-01 15:21:50', 'Andytc', '9dfde458b237e79c1ca78f48d3f1e2eab7db37f9'),
(6, 'Kouadio Kan', 123456789, 'Male', '2003-10-06', 1, '2017-10-01 16:48:06', NULL, NULL),
(7, 'Anabel Wong', 546161301, 'Female', '1990-12-12', 1, '2017-10-01 16:49:06', NULL, NULL),
(8, 'Barklays Don', 123456789, 'Male', '1992-11-11', 4, '2017-10-01 18:14:54', 'Barklays', '9dfde458b237e79c1ca78f48d3f1e2eab7db37f9'),
(9, 'Laboratoire', 123456789, 'Female', '1993-01-01', 3, '2017-10-01 20:31:02', 'labor', '9dfde458b237e79c1ca78f48d3f1e2eab7db37f9'),
(12, 'jerry', 987789271, 'Male', '2000-09-09', 1, '2022-03-14 00:00:00', 'jerry1', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
CREATE TABLE IF NOT EXISTS `usertype` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `type` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`id`, `type`) VALUES
(1, 'Patient'),
(2, 'Nurse'),
(3, 'Lab'),
(4, 'Acounting'),
(5, 'Doctor'),
(6, 'Admin');
--
-- Database: `hospitalps`
--
CREATE DATABASE IF NOT EXISTS `hospitalps` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hospitalps`;

-- --------------------------------------------------------

--
-- Table structure for table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
CREATE TABLE IF NOT EXISTS `consultation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientid` int(11) NOT NULL,
  `weight` double NOT NULL,
  `pressure` double NOT NULL,
  `temperature` double NOT NULL,
  `symptom` text NOT NULL,
  `status` enum('pending','queue','seen') NOT NULL,
  `arrivaldate` date NOT NULL,
  `assignto` int(11) NOT NULL,
  `nurseid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consultation`
--

INSERT INTO `consultation` (`id`, `patientid`, `weight`, `pressure`, `temperature`, `symptom`, `status`, `arrivaldate`, `assignto`, `nurseid`) VALUES
(1, 7, 45, 232, 212, 'weludy eqiudb qu', 'seen', '2017-10-01', 3, 5),
(2, 6, 70, 90.5, 37, 'wwq eqwuqwsaa<br />\nwqueyqw qwuyqqd<br />\nqw45d 7qw, oiq<br />\n-qwygbd<br />\n- uywqiuqw <br />\n- qwiuyqw', 'seen', '2017-10-01', 3, 5),
(3, 6, 130, 45, 23, 'ewue euqoqwe qweqw eqwoi', 'seen', '2017-10-02', 3, 5),
(4, 11, 72, 50, 37, 'tr gryt gruy grjytg ruy', 'seen', '2017-10-05', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `labexam`
--

DROP TABLE IF EXISTS `labexam`;
CREATE TABLE IF NOT EXISTS `labexam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `WBC_COUNT` double DEFAULT NULL,
  `RBC_COUNT` double DEFAULT NULL,
  `HEMOGLOBIN` double DEFAULT NULL,
  `HEMATOCRIT` double DEFAULT NULL,
  `MCV` double DEFAULT NULL,
  `MCH` double DEFAULT NULL,
  `MCHC` double DEFAULT NULL,
  `RDW_CV` double DEFAULT NULL,
  `PLATELET_COUNT` double DEFAULT NULL,
  `MPV` double DEFAULT NULL,
  `madedate` date DEFAULT NULL,
  `pay` int(11) DEFAULT NULL,
  `status` enum('queue','done') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `labexam`
--

INSERT INTO `labexam` (`id`, `cid`, `WBC_COUNT`, `RBC_COUNT`, `HEMOGLOBIN`, `HEMATOCRIT`, `MCV`, `MCH`, `MCHC`, `RDW_CV`, `PLATELET_COUNT`, `MPV`, `madedate`, `pay`, `status`) VALUES
(3, 2, 12, 13, 24, 13, 21, 51, 54, 21, 21, 21, '2017-10-02', 70, 'done'),
(4, 4, 13, 13, 435, 53, 53, 353, 53, 53, 53, 53, '2017-10-05', 100, 'done');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay` double NOT NULL,
  `aid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `paydate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `pay`, `aid`, `pid`, `cid`, `paydate`) VALUES
(1, 70, 8, 7, 1, '2017-10-01 18:36:49'),
(3, 70, 8, 6, 2, '2017-10-01 18:37:36'),
(4, 120, 8, 6, 3, '2017-10-02 17:10:57'),
(5, 100, 8, 11, 4, '2017-10-05 12:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
CREATE TABLE IF NOT EXISTS `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `cdate` date NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`id`, `cid`, `did`, `cdate`, `note`) VALUES
(1, 1, 3, '2017-10-01', 'uqy weuwe qweuasd asiduas dasoiudqw eoasd asldihq wuass<br />\r\n- qwiueyqwueyoqw <br />\r\n-  wqueyoqwiehqwe<br />\r\n- qwoeuywqoieoqw <br />\r\n- qweuiqwe<br />\r\nquwewqe qwieuyq assduasodas dasudasd askuhs'),
(2, 1, 3, '2017-10-02', 'fewhy htrjd erjyf d<br />\r\njyr'),
(3, 1, 3, '2017-10-02', 'yqwtew qeqowieqw eoiqwb qw'),
(4, 2, 3, '2017-10-02', 'tqwiwq qwiuehqw eqwue asoidas dasouhdas douiqw dasoubd as'),
(5, 3, 3, '2017-10-02', 'wuwqyeoiw asdhna s,duqw e'),
(6, 4, 3, '2017-10-05', 'teuydhythgduyx reytr dhtgd');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `phone` int(9) UNSIGNED ZEROFILL NOT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `birthday` date NOT NULL,
  `usertype` int(1) NOT NULL,
  `registrationdate` datetime NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone`, `sex`, `birthday`, `usertype`, `registrationdate`, `username`, `pass`) VALUES
(1, 'Adminisatrator', 000000000, 'Male', '2014-04-15', 6, '2017-10-01 12:46:10', 'admin', '9dfde458b237e79c1ca78f48d3f1e2eab7db37f9'),
(3, 'Fredius Tout Court', 123456789, 'Male', '1993-11-06', 5, '2017-10-01 14:38:43', 'fredius', '9dfde458b237e79c1ca78f48d3f1e2eab7db37f9'),
(4, 'Fredius Tout Court Ori', 123456789, 'Male', '1993-11-06', 4, '2017-10-01 14:40:21', 'frediustc', '9dfde458b237e79c1ca78f48d3f1e2eab7db37f9'),
(5, 'Andreas Tout Court Gisel', 123456789, 'Female', '1994-06-06', 2, '2017-10-01 15:21:50', 'Andytc', '9dfde458b237e79c1ca78f48d3f1e2eab7db37f9'),
(6, 'Kouadio Kan', 123456789, 'Male', '2003-10-06', 1, '2017-10-01 16:48:06', NULL, NULL),
(7, 'Anabel Wong', 546161301, 'Female', '1990-12-12', 1, '2017-10-01 16:49:06', NULL, NULL),
(8, 'Barklays Don', 123456789, 'Male', '1992-11-11', 4, '2017-10-01 18:14:54', 'Barklays', '9dfde458b237e79c1ca78f48d3f1e2eab7db37f9'),
(9, 'Laboratoire', 123456789, 'Female', '1993-01-01', 3, '2017-10-01 20:31:02', 'labor', '9dfde458b237e79c1ca78f48d3f1e2eab7db37f9'),
(10, 'Fredius Tout Court Jr', 987654321, 'Male', '1994-12-06', 1, '2017-10-02 18:11:22', NULL, NULL),
(11, 'Ernest', 123456789, 'Male', '1993-10-10', 6, '2017-10-05 12:06:55', 'jerry1', '8cb2237d0679ca88db6464eac60da96345513964');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
CREATE TABLE IF NOT EXISTS `usertype` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `type` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`id`, `type`) VALUES
(1, 'Patient'),
(2, 'Nurse'),
(3, 'Lab'),
(4, 'Acounting'),
(5, 'Doctor'),
(6, 'Admin');
--
-- Database: `restaurant`
--
CREATE DATABASE IF NOT EXISTS `restaurant` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `restaurant`;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `made` date NOT NULL,
  `uid` int(11) NOT NULL,
  `status` enum('queue','take') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `pid`, `qty`, `made`, `uid`, `status`) VALUES
(000059, 5, 3, '2017-10-13', 6, 'take'),
(000060, 4, 5, '2017-10-09', 7, 'take'),
(000061, 2, 5, '2017-10-13', 4, 'take'),
(000062, 5, 5, '2017-10-12', 4, 'take'),
(000063, 2, 15, '2017-10-14', 4, 'take'),
(000064, 3, 3, '2017-10-13', 8, 'take'),
(000065, 4, 3, '2017-10-13', 6, 'take'),
(000066, 7, 5, '2017-10-13', 6, 'take'),
(000067, 3, 4, '2017-10-14', 11, 'take'),
(000068, 4, 1, '2017-10-14', 11, 'take'),
(000069, 5, 1, '2017-10-14', 11, 'take'),
(000070, 7, 1, '2017-10-14', 11, 'take'),
(000071, 8, 1, '2017-10-15', 31, 'take'),
(000072, 8, 1, '2017-10-15', 31, 'take'),
(000073, 4, 1, '2017-10-15', 31, 'queue'),
(000074, 8, 1, '2017-10-18', 31, 'queue'),
(000075, 8, 1, '2017-10-24', 31, 'queue');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `creation` date NOT NULL,
  `day` enum('Mon','Tue','Wed','Thu','Fri','Sat','Sun') NOT NULL,
  `period` enum('Morning','Afternoon','Evening') NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `creation`, `day`, `period`, `qty`) VALUES
(2, 'Burger', 'Comes with bacon and cheese ', 27, '2017-10-12', 'Sat', 'Afternoon', 20),
(3, 'Mushroom Pizza ', 'Pizza with Mushrooms and Ham ', 48, '2017-10-12', 'Tue', 'Evening', 15),
(4, 'Sliced Vegeterian Pizza', 'Pizza Vegetarian ', 8, '2017-10-12', 'Mon', 'Afternoon', 10),
(5, 'Milkshake Chocolate', 'Milkshake Chocolate', 10, '2017-10-12', 'Tue', 'Afternoon', 30),
(6, 'Hamburger B', 'Hamburger Beef', 75.5, '2017-10-13', 'Fri', 'Evening', 30),
(7, 'Cappuchino', 'Cappuchino', 15, '2017-10-13', 'Thu', 'Afternoon', 100),
(8, 'Waakye', 'Our Ghanaian cooked waakye comes with gari, spaghetti, eggs, meat and fish at an affordable price', 2, '2017-10-15', 'Mon', 'Morning', 150),
(9, 'Milkshake Chocolate', 'Milkshake Chocolate', 10, '2017-10-15', 'Mon', 'Evening', 50),
(10, 'Banku and Tilapia', 'Fresh Tilapia with fine banku', 20, '2017-10-15', 'Fri', 'Evening', 80),
(11, 'Fried Rice and Chicken', 'Fried Rice and Chicken', 25, '2017-10-15', 'Sun', 'Afternoon', 100),
(12, 'Jollof', 'Ghanaian Jollof', 10, '2017-10-15', 'Mon', 'Evening', 40),
(13, 'Fries and Spiced Chicken', 'Fried Potatoes and Freid Chicken', 15, '2017-10-15', 'Sat', 'Evening', 200),
(14, 'Strawberry Milkshake', 'Strawberry Milkshake', 10, '2017-10-15', 'Sun', 'Morning', 40),
(15, 'Waakye', 'Our Ghanaian cooked waakye comes with gari, spaghetti, eggs, meat and fish at an affordable price', 2, '2017-10-15', 'Tue', 'Morning', 100),
(16, 'Meat Lovers Pizza ', 'Comes with sliced chicken,sausage, beef', 62, '2017-10-15', 'Tue', 'Evening', 60);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fn` varchar(100) NOT NULL,
  `em` varchar(100) NOT NULL,
  `nb` varchar(10) NOT NULL,
  `ps` varchar(100) NOT NULL,
  `ut` enum('Customer','Administrator') NOT NULL,
  `reg` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fn`, `em`, `nb`, `ps`, `ut`, `reg`) VALUES
(1, 'Fredius Tout Court', 'frediustc@gmail.com', '0123456789', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Administrator', '2017-10-13'),
(4, 'Diomande Dro Freddy Junior', 'ddfj@gmail.com', '0123456789', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Customer', '2017-10-12'),
(6, 'Andy Tout Court', 'andytc@gmail.com', '1234567890', '9dfde458b237e79c1ca78f48d3f1e2eab7db37f9', 'Customer', '2017-10-13'),
(7, 'Barklays Don', 'barklays@gmail.com', '0123456789', '9dfde458b237e79c1ca78f48d3f1e2eab7db37f9', 'Customer', '2017-10-13'),
(8, 'Selassie', 'selassieametame@outlook.com', '0505579571', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Customer', '2017-10-13'),
(9, 'Administrator', 'admin@admin.com', '1234567890', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrator', '2017-10-13'),
(11, 'Selassie Ametame', 'selassieametame@icloud.com', '0302611611', 'b7ed088190c204b31cd71484e6a1c538986b5f77', 'Customer', '2017-10-14'),
(25, 'Kofi Antwi', 'akotob@aol.com', '1234567896', '123456789', 'Administrator', '2017-10-14'),
(30, 'Administrator', 'kojoselassie@ramsys.com', '0505579571', '8cfafeec93c7be1ecd3b85439e07e08ee007e8c7', 'Administrator', '2017-10-14'),
(31, 'Fouad Burke', 'fburke@aol.com', '1234567890', '20eabe5d64b0e216796e834f52d61fd0b70332fc', 'Customer', '2017-10-15'),
(151, 'kevin', 'kevin@gmail.com', '898089731', '8cb2237d0679ca88db6464eac60da96345513964', 'Administrator', '2022-03-13');
--
-- Database: `sms`
--
CREATE DATABASE IF NOT EXISTS `sms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sms`;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `abbr` varchar(8) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `coursesmodules`
--

DROP TABLE IF EXISTS `coursesmodules`;
CREATE TABLE IF NOT EXISTS `coursesmodules` (
  `cid` int(3) NOT NULL,
  `mid` int(3) NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
CREATE TABLE IF NOT EXISTS `days` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `day` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `abbr` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `noticeboard`
--

DROP TABLE IF EXISTS `noticeboard`;
CREATE TABLE IF NOT EXISTS `noticeboard` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `info` text NOT NULL,
  `target` int(1) NOT NULL,
  `createddate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `cid` int(3) NOT NULL,
  `paid` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `mid` int(3) NOT NULL,
  `description` varchar(200) NOT NULL,
  `view` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
CREATE TABLE IF NOT EXISTS `results` (
  `mid` int(3) NOT NULL,
  `uid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `result` int(3) NOT NULL,
  `rid` int(11) NOT NULL,
  `createdat` date NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `room` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `studentincourse`
--

DROP TABLE IF EXISTS `studentincourse`;
CREATE TABLE IF NOT EXISTS `studentincourse` (
  `cid` int(3) NOT NULL,
  `uid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `since` datetime NOT NULL,
  PRIMARY KEY (`cid`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teachermodules`
--

DROP TABLE IF EXISTS `teachermodules`;
CREATE TABLE IF NOT EXISTS `teachermodules` (
  `mid` int(3) NOT NULL,
  `uid` int(8) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`mid`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
CREATE TABLE IF NOT EXISTS `timetable` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `module` varchar(5) NOT NULL,
  `day` varchar(10) NOT NULL,
  `rid` int(3) NOT NULL,
  `c` varchar(8) NOT NULL,
  `uid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `sh` int(2) UNSIGNED ZEROFILL NOT NULL,
  `sm` int(2) UNSIGNED ZEROFILL NOT NULL,
  `eh` int(2) UNSIGNED ZEROFILL NOT NULL,
  `em` int(2) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `phone` int(10) UNSIGNED ZEROFILL DEFAULT NULL,
  `salary` int(10) DEFAULT NULL,
  `initpass` varchar(16) NOT NULL,
  `password` varchar(100) NOT NULL,
  `registdate` datetime NOT NULL,
  `usertype` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
CREATE TABLE IF NOT EXISTS `usertype` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `role` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Database: `tennis`
--
CREATE DATABASE IF NOT EXISTS `tennis` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tennis`;

-- --------------------------------------------------------

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
CREATE TABLE IF NOT EXISTS `coach` (
  `coachID` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `telNo` char(20) NOT NULL,
  `courtNo` int(11) NOT NULL,
  PRIMARY KEY (`coachID`),
  KEY `courtNo` (`courtNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coach`
--

INSERT INTO `coach` (`coachID`, `name`, `gender`, `address`, `telNo`, `courtNo`) VALUES
('I1', 'Jane Jones', 'F', 'South Street, 4th Ave', '4421254662325', 1),
('I2', 'Jane Smith', 'F', 'South Well, Block 54A', '4585665623025', 1),
('I3', 'Yasser Crimp', 'M', 'Broadway Street, 465B', '4457856232216', 3);

-- --------------------------------------------------------

--
-- Table structure for table `court`
--

DROP TABLE IF EXISTS `court`;
CREATE TABLE IF NOT EXISTS `court` (
  `courtNo` int(11) NOT NULL,
  `location` varchar(200) NOT NULL,
  PRIMARY KEY (`courtNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `court`
--

INSERT INTO `court` (`courtNo`, `location`) VALUES
(1, 'corridor 8'),
(2, 'corridor 1'),
(3, 'new annexe');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
CREATE TABLE IF NOT EXISTS `player` (
  `playerID` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(200) NOT NULL,
  `telNo` char(20) NOT NULL,
  `NHSNo` char(12) NOT NULL,
  PRIMARY KEY (`playerID`),
  UNIQUE KEY `NHSNo` (`NHSNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`playerID`, `name`, `gender`, `dob`, `address`, `telNo`, `NHSNo`) VALUES
(1, 'Sela Sela', 'M', '1993-12-26', 'Accra', '02452546362', '2145215456'),
(2, 'Sue Flay', 'F', '1992-11-01', '34 High Street, Maidstone', '0116 629136', '021-932-1529'),
(3, 'Mike Stand', 'M', '1987-05-21', '34 High Street, Maidstone', '07557 812015', '119-034-9814'),
(4, 'Sue Flay', 'F', '1979-09-01', '3 The Sidings, Canterbury', '08877903102', '010-692-0013'),
(5, 'Wayne Bow', 'M', '1985-02-13', '1 The Sidings, Canterbury', '04695654978', '912-968-5287');

-- --------------------------------------------------------

--
-- Table structure for table `playertour`
--

DROP TABLE IF EXISTS `playertour`;
CREATE TABLE IF NOT EXISTS `playertour` (
  `playerID` int(11) NOT NULL,
  `onDate` date NOT NULL,
  `StadiumID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playertour`
--

INSERT INTO `playertour` (`playerID`, `onDate`, `StadiumID`) VALUES
(2, '2017-02-27', 2),
(4, '2017-02-27', 2),
(2, '2017-02-27', 2),
(4, '2017-02-27', 2),
(2, '2017-02-25', 2),
(3, '2017-02-25', 1),
(4, '2017-02-25', 1),
(1, '2017-02-25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
CREATE TABLE IF NOT EXISTS `stadium` (
  `stadiumID` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `telNo` char(20) NOT NULL,
  PRIMARY KEY (`stadiumID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stadium`
--

INSERT INTO `stadium` (`stadiumID`, `name`, `address`, `telNo`) VALUES
(1, 'City Centre Stadium', '12 Main Lane, CT1 7RQ', '01227829567'),
(2, 'Olympic Stadium', '52 Thanet Way ME4 0RY', '07337-612-965');

-- --------------------------------------------------------

--
-- Table structure for table `tournament`
--

DROP TABLE IF EXISTS `tournament`;
CREATE TABLE IF NOT EXISTS `tournament` (
  `onDate` date NOT NULL,
  `result` varchar(200) NOT NULL,
  `coachID` varchar(200) NOT NULL,
  `StadiumID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tournament`
--

INSERT INTO `tournament` (`onDate`, `result`, `coachID`, `StadiumID`) VALUES
('2017-02-27', 'Win', 'I1', 2),
('2017-02-25', 'Lose', 'I2', 2),
('2017-02-27', 'Win', 'I1', 2),
('2017-02-25', 'Lose', 'I2', 2),
('2017-02-27', 'Win', 'I1', 2),
('2017-02-25', 'Lose', 'I2', 2),
('2017-06-27', 'win', 'I2', 1),
('2017-02-25', 'Win', 'I1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
CREATE TABLE IF NOT EXISTS `training` (
  `trainingNo` int(11) NOT NULL AUTO_INCREMENT,
  `playerID` int(11) NOT NULL,
  `onDate` date NOT NULL,
  `atTime` time NOT NULL,
  `coachID` varchar(200) NOT NULL,
  PRIMARY KEY (`trainingNo`),
  KEY `coachID` (`coachID`),
  KEY `playerID` (`playerID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `training`
--

INSERT INTO `training` (`trainingNo`, `playerID`, `onDate`, `atTime`, `coachID`) VALUES
(1, 2, '2017-02-25', '10:00:00', 'I1'),
(2, 2, '2017-01-09', '16:00:00', 'I2'),
(3, 3, '2017-02-25', '12:00:00', 'I2'),
(4, 2, '2017-02-26', '10:00:00', 'I2'),
(5, 4, '2017-01-25', '10:00:00', 'I3');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coach`
--
ALTER TABLE `coach`
  ADD CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`courtNo`) REFERENCES `court` (`courtNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `training_ibfk_1` FOREIGN KEY (`coachID`) REFERENCES `coach` (`coachID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `training_ibfk_2` FOREIGN KEY (`playerID`) REFERENCES `player` (`playerID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
