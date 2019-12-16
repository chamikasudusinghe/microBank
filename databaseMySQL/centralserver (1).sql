-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2019 at 04:38 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `centralserver`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountholder`
--

CREATE TABLE `accountholder` (
  `UserID` int(11) NOT NULL,
  `AccountNo` int(11) NOT NULL,
  `UserMobileNo` int(11) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `Pin` int(11) NOT NULL,
  `NIC` varchar(15) NOT NULL,
  `Name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `accounttype`
--

CREATE TABLE `accounttype` (
  `TypeID` int(11) NOT NULL,
  `TypeName` varchar(15) NOT NULL,
  `InterestRate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fixeddeposit`
--

CREATE TABLE `fixeddeposit` (
  `AccountNo` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Account_Balance` float NOT NULL,
  `OpeningDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fixeddeposittype`
--

CREATE TABLE `fixeddeposittype` (
  `TypeID` int(11) NOT NULL,
  `TypeName` varchar(15) NOT NULL,
  `InterestRate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mobileagent`
--

CREATE TABLE `mobileagent` (
  `AgentID` int(11) NOT NULL,
  `MobileAgentID` int(11) NOT NULL,
  `DevicePassword` varchar(15) NOT NULL,
  `DeviceID` int(11) NOT NULL,
  `AgentMobileNo` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `savingsaccount`
--

CREATE TABLE `savingsaccount` (
  `AccountNo` int(11) NOT NULL,
  `AccountType` varchar(15) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Balance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TransactionID` int(11) NOT NULL,
  `TransactionType` varchar(15) NOT NULL,
  `MobileAgentID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Amount` float NOT NULL,
  `TransactionPriority` int(11) NOT NULL,
  `AccountNo` int(11) NOT NULL,
  `TimeStamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountholder`
--
ALTER TABLE `accountholder`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `UserID` (`UserID`,`AccountNo`),
  ADD KEY `AccountNo` (`AccountNo`);

--
-- Indexes for table `accounttype`
--
ALTER TABLE `accounttype`
  ADD PRIMARY KEY (`TypeID`);

--
-- Indexes for table `fixeddeposit`
--
ALTER TABLE `fixeddeposit`
  ADD PRIMARY KEY (`AccountNo`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `fixeddeposittype`
--
ALTER TABLE `fixeddeposittype`
  ADD PRIMARY KEY (`TypeID`);

--
-- Indexes for table `mobileagent`
--
ALTER TABLE `mobileagent`
  ADD PRIMARY KEY (`AgentID`,`MobileAgentID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `savingsaccount`
--
ALTER TABLE `savingsaccount`
  ADD PRIMARY KEY (`AccountNo`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `UserID` (`UserID`,`AccountNo`),
  ADD KEY `AccountNo` (`AccountNo`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accountholder`
--
ALTER TABLE `accountholder`
  ADD CONSTRAINT `accountholder_ibfk_1` FOREIGN KEY (`AccountNo`) REFERENCES `savingsaccount` (`AccountNo`);

--
-- Constraints for table `fixeddeposit`
--
ALTER TABLE `fixeddeposit`
  ADD CONSTRAINT `fixeddeposit_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `accountholder` (`UserID`);

--
-- Constraints for table `mobileagent`
--
ALTER TABLE `mobileagent`
  ADD CONSTRAINT `mobileagent_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `accountholder` (`UserID`);

--
-- Constraints for table `savingsaccount`
--
ALTER TABLE `savingsaccount`
  ADD CONSTRAINT `savingsaccount_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `accountholder` (`UserID`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `accountholder` (`UserID`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`AccountNo`) REFERENCES `savingsaccount` (`AccountNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
