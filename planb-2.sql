-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 18, 2022 at 06:50 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `planb-2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `user_name` text CHARACTER SET utf16 NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `first_name`, `last_name`, `user_name`, `password`) VALUES
(1, 'sara', 'khalid', 'sara_k', '123456789');

-- --------------------------------------------------------

--
-- Table structure for table `cake_shop`
--

CREATE TABLE `cake_shop` (
  `id` int(11) NOT NULL,
  `cake_shop_name` text NOT NULL,
  `description` text NOT NULL,
  `logo_pic` varchar(500) NOT NULL,
  `cake_type` int(11) NOT NULL,
  `prate` int(100) NOT NULL,
  `nrate` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cake_shop`
--

INSERT INTO `cake_shop` (`id`, `cake_shop_name`, `description`, `logo_pic`, `cake_type`, `prate`, `nrate`) VALUES
(1, 'Munch Bakery', 'Munch Bakery cake store is specializes in selling cakes of different sizes', 'munch1.png', 1, 5, 0),
(2, 'Sugar sprinkles', 'Sugar sprinkles Bakery cake store is specializes in selling cakes of different sizes', 'sugar1.png', 3, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cake_type`
--

CREATE TABLE `cake_type` (
  `id` int(11) NOT NULL,
  `cake_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cake_type`
--

INSERT INTO `cake_type` (`id`, `cake_type`) VALUES
(1, 'Vegetarians'),
(2, 'Diabetics'),
(3, 'Allergic'),
(4, 'Healthy'),
(5, 'All');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `cakeshopID` int(11) NOT NULL,
  `username` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `userID`, `cakeshopID`, `username`, `comment`) VALUES
(1, 1, 1, 'maha_a', 'it is one of the best cake shop in Riyadh'),
(2, 2, 2, 'bader_m', 'not bad'),
(3, 1, 2, 'maha_a', 'yum');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `user_name` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `user_name`, `password`) VALUES
(1, 'maha', 'ahmad', 'maha_a', '123456789'),
(2, 'bader', 'mohammed', 'bader_m', '123456789'),
(3, 'lama', 'fahad', 'lama_f', '123456789'),
(4, 'alhanouf', 'shafi', 'alhanouf_m', '123456789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cake_shop`
--
ALTER TABLE `cake_shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cake_type` (`cake_type`);

--
-- Indexes for table `cake_type`
--
ALTER TABLE `cake_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `cakeshopID` (`cakeshopID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cake_shop`
--
ALTER TABLE `cake_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cake_shop`
--
ALTER TABLE `cake_shop`
  ADD CONSTRAINT `cake_shop_ibfk_1` FOREIGN KEY (`cake_type`) REFERENCES `cake_type` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`cakeshopID`) REFERENCES `cake_shop` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
