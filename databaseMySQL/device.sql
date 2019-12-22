-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2019 at 07:48 PM
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
-- Database: `device`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_id` int(11) NOT NULL,
  `NIC` varchar(15) NOT NULL,
  `Customer_Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `savingsaccount`
--

CREATE TABLE `savingsaccount` (
  `Account_id` int(11) NOT NULL,
  `Account_Type` varchar(15) NOT NULL,
  `Account_Balance` float NOT NULL,
  `Customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `Transaction_id` int(11) NOT NULL,
  `Transaction_Time` datetime NOT NULL,
  `Transaction_Type` varchar(15) NOT NULL,
  `Transaction_Status` tinyint(1) NOT NULL,
  `Transaction_Priority` int(11) NOT NULL,
  `Transaction_Amount` float NOT NULL,
  `Agent_id` int(11) NOT NULL,
  `Account_id` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_id`);

--
-- Indexes for table `savingsaccount`
--
ALTER TABLE `savingsaccount`
  ADD PRIMARY KEY (`Account_id`),
  ADD KEY `Customer_id` (`Customer_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`Transaction_id`),
  ADD KEY `Account_id` (`Account_id`,`Customer_id`),
  ADD KEY `Customer_id` (`Customer_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `savingsaccount`
--
ALTER TABLE `savingsaccount`
  ADD CONSTRAINT `savingsaccount_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`Account_id`) REFERENCES `savingsaccount` (`Account_id`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
