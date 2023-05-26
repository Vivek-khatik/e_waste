-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 26, 2023 at 05:21 AM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id20371762_ewaste_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `Address_Id` int(11) NOT NULL,
  `Landmark` varchar(20) NOT NULL,
  `Street1` varchar(20) NOT NULL,
  `Street2` varchar(20) NOT NULL,
  `Street3` varchar(20) NOT NULL,
  `Area` varchar(20) NOT NULL,
  `User_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_Id` int(11) NOT NULL,
  `Admin_Fname` varchar(12) NOT NULL,
  `Admin_Lname` varchar(15) NOT NULL,
  `Password` varchar(8) NOT NULL,
  `Contact_No` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_Id` int(11) NOT NULL,
  `Employee_Fname` varchar(12) NOT NULL,
  `Employee_Lname` varchar(15) NOT NULL,
  `Password` varchar(8) NOT NULL,
  `Contact_No` int(10) NOT NULL,
  `Email_Id` varchar(30) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Id_Proof` varchar(12) NOT NULL,
  `Address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `Feedback_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Feedback_Description` varchar(50) NOT NULL,
  `Feedback_Rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderList`
--

CREATE TABLE `orderList` (
  `orderId` int(11) NOT NULL,
  `userEmail` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `prodName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `prodPrice` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `prodImg` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orderList`
--

INSERT INTO `orderList` (`orderId`, `userEmail`, `prodName`, `prodPrice`, `prodImg`) VALUES
(79, 'viv@gmail.com', 'Samsung Note 20+', '16395', ''),
(80, 'viv@gmail.com', 'Iphone 11', '11000', ''),
(83, 'rrr', 'Samsung S27', '5346', ''),
(86, 'viv@gmail.com', 'Realme 10 Pro', '8505', ''),
(88, 'rohit@gmail.com', 'Samsung Note 20+', '13662', '');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_Id` int(11) NOT NULL,
  `Product_Name` varchar(20) NOT NULL,
  `Product_Category` varchar(6) NOT NULL,
  `Product_Img` varchar(60) NOT NULL,
  `Product_Type` varchar(20) NOT NULL,
  `Product_Brand` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `Request_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Date_and_Time` datetime NOT NULL,
  `Address_id` int(11) NOT NULL,
  `Latitude` int(20) NOT NULL,
  `Longtitude` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request_product`
--

CREATE TABLE `request_product` (
  `Request_Product_id` int(11) NOT NULL,
  `Request_id` int(11) NOT NULL,
  `Product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request_product_img`
--

CREATE TABLE `request_product_img` (
  `Request_Product_Img_id` int(11) NOT NULL,
  `Request_Product_id` int(11) NOT NULL,
  `Img_Url` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `first_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `contactNo` int(12) NOT NULL,
  `idProof` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `first_name`, `last_name`, `gender`, `password`, `email`, `contactNo`, `idProof`) VALUES
(53, 'virat', 'kohli', 'male', '1818', 'virat@gmail.com', 99999999, 1111),
(55, 'Vivek', 'Khatik', 'male', '1234', 'viv@gmail.com', 942914241, 6373637),
(57, 'rohit', 'sharma', 'male', '4545', 'rohit@gmail.com', 1234567890, 53636);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`Address_Id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_Id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_Id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`Feedback_id`);

--
-- Indexes for table `orderList`
--
ALTER TABLE `orderList`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_Id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`Request_id`);

--
-- Indexes for table `request_product`
--
ALTER TABLE `request_product`
  ADD PRIMARY KEY (`Request_Product_id`);

--
-- Indexes for table `request_product_img`
--
ALTER TABLE `request_product_img`
  ADD PRIMARY KEY (`Request_Product_Img_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `Address_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderList`
--
ALTER TABLE `orderList`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
