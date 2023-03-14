-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 24, 2022 at 12:04 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tennis`
--

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
  `NHSNo` int(11) NOT NULL,
  PRIMARY KEY (`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`playerID`, `name`, `gender`, `dob`, `address`, `telNo`, `NHSNo`) VALUES
(1, 'Sela Sela', 'M', '1993-12-26', 'Accra', '02452546362', 2145215456);

-- --------------------------------------------------------

--
-- Table structure for table `playertour`
--

DROP TABLE IF EXISTS `playertour`;
CREATE TABLE IF NOT EXISTS `playertour` (
  `playerID` int(11) NOT NULL,
  `onDate` date NOT NULL,
  `StadiumID` int(11) NOT NULL,
  PRIMARY KEY (`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `training`
--

INSERT INTO `training` (`trainingNo`, `playerID`, `onDate`, `atTime`, `coachID`) VALUES
(1, 1, '2022-03-23', '12:00:00', 'I3'),
(6, 1, '2022-03-25', '16:00:00', 'I3'),
(7, 1, '2022-03-25', '12:00:00', 'I2'),
(8, 1, '2022-03-25', '12:00:00', 'I3'),
(30, 1, '2022-03-25', '10:00:00', 'I1'),
(31, 1, '2022-03-25', '10:00:00', 'I1'),
(32, 1, '2022-03-25', '10:00:00', 'I1'),
(33, 1, '2022-03-24', '10:00:00', 'I2');

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
