-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2024 at 03:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Electronics'),
(2, 'Foods'),
(3, 'Furnitures'),
(10, 'Cool drink');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `invoice_id` int(10) NOT NULL,
  `orderdate` date NOT NULL,
  `subtotal` int(30) NOT NULL,
  `discount` int(20) NOT NULL,
  `sgst` int(20) NOT NULL,
  `cgst` int(20) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment_type` varchar(30) NOT NULL,
  `due` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`invoice_id`, `orderdate`, `subtotal`, `discount`, `sgst`, `cgst`, `total`, `payment_type`, `due`, `paid`) VALUES
(20, '2024-11-25', 36000, 7200, 5400, 5400, 39600.00, 'CASH', 0.00, 39600.00),
(21, '2024-11-25', 600, 120, 90, 90, 660.00, 'CASH', 0.00, 660.00),
(22, '2024-11-25', 50250, 10050, 7538, 7538, 55275.00, 'CASH', 0.00, 55275.00),
(23, '2024-11-28', 600, 120, 90, 90, 660.00, 'CASH', 660.00, 0.00),
(24, '2024-11-28', 200, 40, 30, 30, 220.00, 'CASH', 220.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `productdetails`
--

CREATE TABLE `productdetails` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `saleprice` decimal(10,2) NOT NULL,
  `orderdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productdetails`
--

INSERT INTO `productdetails` (`id`, `invoice_id`, `barcode`, `product_id`, `product_name`, `qty`, `rate`, `saleprice`, `orderdate`) VALUES
(29, 20, '2147483647', 4, 'Real me XT', 2, 18000.00, 36000.00, '2024-11-25 06:38:50'),
(30, 21, '5120819', 1, 'Veg Burger', 1, 150.00, 150.00, '2024-11-25 06:55:40'),
(31, 21, '7121434', 2, 'Lenova Charger', 1, 450.00, 450.00, '2024-11-25 06:55:40'),
(32, 22, '5120820', 26, 'Pizza', 1, 250.00, 250.00, '2024-11-25 10:05:19'),
(33, 22, '7121436', 25, 'Dell Laptop', 1, 50000.00, 50000.00, '2024-11-25 10:05:19'),
(34, 23, '5120819', 1, 'Veg Burger', 1, 150.00, 150.00, '2024-11-28 14:28:10'),
(35, 23, '7121434', 2, 'Lenova Charger', 1, 450.00, 450.00, '2024-11-28 14:28:10'),
(36, 24, '5120821', 27, 'Sprite', 1, 200.00, 200.00, '2024-11-28 14:31:29');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `barcode` int(30) NOT NULL,
  `productname` varchar(200) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `stock` int(10) NOT NULL,
  `purchase` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `barcode`, `productname`, `category`, `description`, `stock`, `purchase`, `price`, `image`) VALUES
(1, 5120819, 'Veg Burger', 'Veg', 'It is Awesome Veg Burgur', 200, 200, 150, '/uploads/1732185519222.jfif'),
(2, 7121434, 'Lenova Charger', 'Laptop', 'It has long backup charging.', 94, 500, 450, '/uploads/1732171609432.jpg'),
(3, 12114804, 'Mix Spices', 'Grocery', 'Mix Spices Pack 500gm', 296, 240, 180, '/uploads/1731941911092.jfif'),
(4, 2147483647, 'Real me XT', 'Mobile', 'Model: RMX1921', 145, 21500, 18000, '/uploads/1731942038229.jfif'),
(5, 2147483623, 'Modelling Comb for all', 'Electronics', 'Electronic Comb for all.', 120, 250, 150, '/uploads/1732511127039.jfif'),
(25, 7121436, 'Dell Laptop', 'Electronics', 'It is awesome Dell laptop', 200, 60000, 50000, '/uploads/1732523771918.jfif'),
(26, 5120820, 'Pizza', 'Foods', 'It is awesome pizza', 100, 300, 250, '/uploads/1732524023233.jfif'),
(27, 5120821, 'Sprite', 'Cool drink', 'It is nice drink', 200, 250, 200, '/uploads/1732804267702.webp');

-- --------------------------------------------------------

--
-- Table structure for table `taxdiscount`
--

CREATE TABLE `taxdiscount` (
  `id` int(11) NOT NULL,
  `sgst` int(11) NOT NULL,
  `cgst` int(11) NOT NULL,
  `discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taxdiscount`
--

INSERT INTO `taxdiscount` (`id`, `sgst`, `cgst`, `discount`) VALUES
(1, 5, 5, 10),
(2, 10, 10, 20),
(3, 15, 15, 20);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('User','Admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`) VALUES
(1, 'Hemanth', 'hemanth@gmail.com', 'Hemanth@123', 'User'),
(2, 'Admin', 'admin@gmail.com', 'Admin@123', 'Admin'),
(5, 'test', 'test@gmail.com', 'Test@123', 'User'),
(6, 'Tharun', 'Tharun@gmail.com', 'Tharun@123', 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `productdetails`
--
ALTER TABLE `productdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxdiscount`
--
ALTER TABLE `taxdiscount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `invoice_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `productdetails`
--
ALTER TABLE `productdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `taxdiscount`
--
ALTER TABLE `taxdiscount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
