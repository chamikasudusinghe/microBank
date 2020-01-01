-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2020 at 02:39 PM
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
  `FirstName` varchar(10) NOT NULL,
  `LastName` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customeragent`
--

CREATE TABLE `customeragent` (
  `UserID` int(11) NOT NULL,
  `AgentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `DepositID` int(11) NOT NULL,
  `MobileAgentID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Amount` float NOT NULL,
  `Priority` int(11) NOT NULL,
  `AccountNo` int(11) NOT NULL,
  `TimeStamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fixeddeposit`
--

CREATE TABLE `fixeddeposit` (
  `FDAccountNo` int(11) NOT NULL,
  `Account_Balance` float NOT NULL,
  `OpeningDate` date NOT NULL,
  `FDTypeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fixeddeposittype`
--

CREATE TABLE `fixeddeposittype` (
  `TypeID` int(11) NOT NULL,
  `InterestRate` float NOT NULL,
  `TimeDurationInMonth` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `holds`
--

CREATE TABLE `holds` (
  `SAccountNo` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mobileagent`
--

CREATE TABLE `mobileagent` (
  `AgentID` int(11) NOT NULL,
  `DevicePassword` varchar(15) NOT NULL,
  `DeviceID` int(11) NOT NULL,
  `AgentMobileNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `savingsaccount`
--

CREATE TABLE `savingsaccount` (
  `SAccountNo` int(11) NOT NULL,
  `SATypeID` int(11) NOT NULL,
  `Balance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `savingsaccounttype`
--

CREATE TABLE `savingsaccounttype` (
  `TypeID` int(11) NOT NULL,
  `MinimumBalance` float NOT NULL,
  `InterestRate` float NOT NULL,
  `TimeDurationInMonths` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--

CREATE TABLE `withdraw` (
  `WithrawID` int(11) NOT NULL,
  `MobileAgentID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Amount` float NOT NULL,
  `Priority` int(11) NOT NULL,
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
-- Indexes for table `customeragent`
--
ALTER TABLE `customeragent`
  ADD PRIMARY KEY (`UserID`,`AgentID`),
  ADD KEY `UserID` (`UserID`,`AgentID`),
  ADD KEY `AgentID` (`AgentID`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`DepositID`),
  ADD KEY `UserID` (`UserID`,`AccountNo`),
  ADD KEY `AccountNo` (`AccountNo`);

--
-- Indexes for table `fixeddeposit`
--
ALTER TABLE `fixeddeposit`
  ADD PRIMARY KEY (`FDAccountNo`),
  ADD KEY `FDTypeID` (`FDTypeID`);

--
-- Indexes for table `fixeddeposittype`
--
ALTER TABLE `fixeddeposittype`
  ADD PRIMARY KEY (`TypeID`);

--
-- Indexes for table `holds`
--
ALTER TABLE `holds`
  ADD PRIMARY KEY (`SAccountNo`,`UserID`),
  ADD KEY `SAccountNo` (`SAccountNo`,`UserID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `mobileagent`
--
ALTER TABLE `mobileagent`
  ADD PRIMARY KEY (`AgentID`);

--
-- Indexes for table `savingsaccount`
--
ALTER TABLE `savingsaccount`
  ADD PRIMARY KEY (`SAccountNo`),
  ADD KEY `SATypeID` (`SATypeID`);

--
-- Indexes for table `savingsaccounttype`
--
ALTER TABLE `savingsaccounttype`
  ADD PRIMARY KEY (`TypeID`);

--
-- Indexes for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`WithrawID`),
  ADD KEY `UserID` (`UserID`,`AccountNo`),
  ADD KEY `withdraw_ibfk_1` (`AccountNo`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customeragent`
--
ALTER TABLE `customeragent`
  ADD CONSTRAINT `customeragent_ibfk_1` FOREIGN KEY (`AgentID`) REFERENCES `mobileagent` (`AgentID`),
  ADD CONSTRAINT `customeragent_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `accountholder` (`UserID`);

--
-- Constraints for table `deposit`
--
ALTER TABLE `deposit`
  ADD CONSTRAINT `deposit_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `accountholder` (`UserID`),
  ADD CONSTRAINT `deposit_ibfk_2` FOREIGN KEY (`AccountNo`) REFERENCES `accountholder` (`AccountNo`);

--
-- Constraints for table `fixeddeposit`
--
ALTER TABLE `fixeddeposit`
  ADD CONSTRAINT `fixeddeposit_ibfk_2` FOREIGN KEY (`FDTypeID`) REFERENCES `fixeddeposittype` (`TypeID`);

--
-- Constraints for table `holds`
--
ALTER TABLE `holds`
  ADD CONSTRAINT `holds_ibfk_1` FOREIGN KEY (`SAccountNo`) REFERENCES `savingsaccount` (`SAccountNo`),
  ADD CONSTRAINT `holds_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `accountholder` (`UserID`);

--
-- Constraints for table `savingsaccount`
--
ALTER TABLE `savingsaccount`
  ADD CONSTRAINT `savingsaccount_ibfk_2` FOREIGN KEY (`SATypeID`) REFERENCES `savingsaccounttype` (`TypeID`);

--
-- Constraints for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD CONSTRAINT `withdraw_ibfk_1` FOREIGN KEY (`AccountNo`) REFERENCES `accountholder` (`AccountNo`),
  ADD CONSTRAINT `withdraw_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `accountholder` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
