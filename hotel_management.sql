-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2025 at 04:58 PM
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
-- Database: `hotel_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `c_password` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `username`, `c_password`, `email`, `phonenumber`, `address`, `member_id`) VALUES
(2, 'Kessigan', 'kc2109', 'abc123', 'kessigan@gmail.com', '01111407244', 'No.3, Jalan 7, Taman Selayang, 68100 Batu Caves, Selangor', 5);

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `member_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `loyalty_points` int(11) DEFAULT 0,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`member_id`, `customer_id`, `startdate`, `enddate`, `loyalty_points`, `status`) VALUES
(5, 2, '2025-01-27', '2026-01-27', 60, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `reservation_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `refund_status` varchar(50) DEFAULT 'Received'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `customer_id`, `reservation_id`, `payment_date`, `payment_amount`, `payment_method`, `payment_type`, `refund_status`) VALUES
(1, 2, 16, '2025-01-27', 100.00, 'Debit/Credit Card', 'Reservation', 'Refunded'),
(2, 2, NULL, '2025-01-27', 100.00, 'Debit/Credit Card', 'Membership', 'Received'),
(3, 2, 17, '2025-01-27', 150.00, 'Debit/Credit Card', 'Reservation', 'Received'),
(4, 2, 16, '2025-01-27', 50.00, 'Debit/Credit Card', 'Reservation', 'Refunded'),
(5, 2, 16, '2025-01-27', 100.00, 'Debit/Credit Card', 'Reservation', 'Refunded'),
(6, 2, 20, '2025-01-27', 150.00, 'Debit/Credit Card', 'Reservation', 'Received');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `roomnumber` varchar(11) DEFAULT NULL,
  `check_in_date` date DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `customer_id`, `payment_id`, `reservation_date`, `roomnumber`, `check_in_date`, `check_out_date`, `status`) VALUES
(16, 2, 1, '2025-01-27', 'R002', '2025-01-27', '2025-01-31', 'cancelled'),
(17, 2, 3, '2025-01-27', 'R006', '2025-02-02', '2025-02-06', 'active'),
(18, 2, 4, '2025-01-27', 'R003', '2025-01-27', '2025-01-31', 'cancelled'),
(19, 2, 5, '2025-01-27', 'R010', '2025-01-27', '2025-01-31', 'cancelled'),
(20, 2, 6, '2025-01-27', 'R012', '2025-03-01', '2025-03-10', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `roomnumber` varchar(11) DEFAULT NULL,
  `roomtype` varchar(50) DEFAULT NULL,
  `roomprice` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `roomnumber`, `roomtype`, `roomprice`, `status`) VALUES
(1, 'R001', 'Single', 100.00, 'Available'),
(2, 'R002', 'Single', 100.00, 'Available'),
(3, 'R003', 'Single', 100.00, 'Available'),
(4, 'R004', 'Double', 150.00, 'Available'),
(5, 'R005', 'Double', 150.00, 'Available'),
(6, 'R006', 'Double', 150.00, 'Available'),
(7, 'R007', 'Suite', 200.00, 'Available'),
(8, 'R008', 'Suite', 200.00, 'Available'),
(9, 'R009', 'Suite', 200.00, 'Available'),
(10, 'R010', 'Single', 100.00, 'Available'),
(11, 'R011', 'Single', 100.00, 'Available'),
(12, 'R012', 'Double', 150.00, 'Available'),
(13, 'R013', 'Double', 150.00, 'Available'),
(14, 'R014', 'Suite', 200.00, 'Available'),
(15, 'R015', 'Suite', 200.00, 'Available'),
(16, 'R016', 'Double', 150.00, 'Available'),
(18, 'R018', 'Single', 125.00, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `s_password` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `name`, `username`, `s_password`, `email`, `phonenumber`, `address`) VALUES
(3, 'Jonathan', 'John21', 'abc123', 'jonathan21@gmail.com', '0111514375', 'No.7, Jalan Sejahtera 5, Taman Bukit Tambun, 48000 Rawang, Selangor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
