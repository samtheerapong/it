-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 14, 2024 at 07:29 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-hr`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `license_plate` varchar(45) DEFAULT NULL COMMENT 'ทะเบียนรถ',
  `car_type_id` int(11) DEFAULT NULL COMMENT 'ประเภทรถ',
  `seats` int(11) DEFAULT NULL COMMENT 'จำนวนที่นั่ง',
  `photo` varchar(255) DEFAULT NULL COMMENT 'รูปรถ',
  `last_service` date DEFAULT NULL COMMENT 'ซ่อมบำรุงล่าสุด',
  `status_id` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `license_plate`, `car_type_id`, `seats`, `photo`, `last_service`, `status_id`) VALUES
(1, 'กก 88', 1, 4, NULL, '2024-02-01', 1),
(2, 'กบ 99', 2, 3, NULL, '2024-02-01', 1),
(7, 'ตต 123', 3, 12, NULL, '2024-02-01', 1),
(8, 'บท 1', 5, 1, NULL, '2024-02-01', 1),
(9, 'ฟล 1', 6, 0, NULL, '2024-02-01', 1),
(10, 'ฟล 2', 6, 0, NULL, '2024-02-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cars_status`
--

CREATE TABLE `cars_status` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL COMMENT 'ชื่อ',
  `color` varchar(45) DEFAULT NULL COMMENT 'สี',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars_status`
--

INSERT INTO `cars_status` (`id`, `name`, `color`, `active`) VALUES
(1, 'พร้อมใช้', '#12372A', 1),
(2, 'ซ่อม', '#FFA732', 1),
(3, 'เสีย', '#B80000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cars_type`
--

CREATE TABLE `cars_type` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL COMMENT 'ชื่อ',
  `color` varchar(45) DEFAULT NULL COMMENT 'สี',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars_type`
--

INSERT INTO `cars_type` (`id`, `name`, `color`, `active`) VALUES
(1, 'เก๋ง', '#525CEB', 1),
(2, 'กระบะ', '#362FD9', 1),
(3, 'ตู้', '#E55604', 1),
(4, 'มอเตอร์ไซค์', '#47A992', 1),
(5, 'บรรทุก', '#47A992', 1),
(6, 'โฟล์ค ลิฟท์', '#0D1282', 1);

-- --------------------------------------------------------

--
-- Table structure for table `car_reserve`
--

CREATE TABLE `car_reserve` (
  `id` int(11) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT 'รหัส',
  `destination` varchar(255) NOT NULL COMMENT 'ที่หมาย',
  `description` text COMMENT 'รายละเอียด',
  `passenger` int(11) DEFAULT '1' COMMENT 'จำนวนผู้โดยสาร',
  `date_start` datetime NOT NULL COMMENT 'วันที่ไป',
  `date_end` datetime NOT NULL COMMENT 'วันที่กลับ',
  `note` varchar(255) DEFAULT NULL COMMENT 'บันทึก',
  `user_id` int(11) DEFAULT NULL COMMENT 'ผู้จจอง',
  `car_id` int(11) DEFAULT NULL COMMENT 'รถ',
  `rider_id` int(11) DEFAULT NULL COMMENT 'ผู้ขับ',
  `approve_by` int(11) DEFAULT NULL COMMENT 'ผู้อนุมัติ',
  `approve_date` date DEFAULT NULL COMMENT 'อนุมัติเมื่อ',
  `approve_comment` text COMMENT 'ความคิดเห็นผู้อนุมัติ',
  `status_id` int(11) NOT NULL DEFAULT '1' COMMENT 'สถานะ',
  `created_at` date DEFAULT NULL COMMENT 'บันทึกเมื่อ',
  `updated_at` date DEFAULT NULL COMMENT 'ปรับปรุงเมื่อ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `car_reserve_status`
--

CREATE TABLE `car_reserve_status` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL COMMENT 'ชื่อ',
  `color` varchar(45) DEFAULT NULL COMMENT 'สี',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_reserve_status`
--

INSERT INTO `car_reserve_status` (`id`, `name`, `color`, `active`) VALUES
(1, 'จอง', '#FE0000', 1),
(2, 'อนุมัติ', '#0079FF', 1),
(3, 'เสร็จ', '#004225', 1),
(4, 'ยกเลิก', '#3C3633', 1);

-- --------------------------------------------------------

--
-- Table structure for table `car_rider`
--

CREATE TABLE `car_rider` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'ชื่อ-สกุล',
  `photo` varchar(255) DEFAULT NULL COMMENT 'รูป',
  `exp` date DEFAULT NULL COMMENT 'วันหมดอายุใบขับขี่',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_rider`
--

INSERT INTO `car_rider` (`id`, `name`, `photo`, `exp`, `active`) VALUES
(1, 'คนขับ 1', NULL, NULL, 1),
(2, 'คนขับ 2', NULL, NULL, 1),
(3, 'คนขับ 3', NULL, NULL, 1),
(4, 'คนขับ 4', NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cars_cars_status_idx` (`status_id`),
  ADD KEY `fk_cars_cars_type1_idx` (`car_type_id`);

--
-- Indexes for table `cars_status`
--
ALTER TABLE `cars_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cars_type`
--
ALTER TABLE `cars_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_reserve`
--
ALTER TABLE `car_reserve`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_car_reserve_cars1_idx` (`car_id`),
  ADD KEY `fk_car_reserve_car_rider1_idx` (`rider_id`),
  ADD KEY `fk_car_reserve_car_reserve_status1_idx` (`status_id`);

--
-- Indexes for table `car_reserve_status`
--
ALTER TABLE `car_reserve_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_rider`
--
ALTER TABLE `car_rider`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cars_status`
--
ALTER TABLE `cars_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cars_type`
--
ALTER TABLE `cars_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `car_reserve`
--
ALTER TABLE `car_reserve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car_reserve_status`
--
ALTER TABLE `car_reserve_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `car_rider`
--
ALTER TABLE `car_rider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `fk_cars_cars_status` FOREIGN KEY (`status_id`) REFERENCES `cars_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cars_cars_type1` FOREIGN KEY (`car_type_id`) REFERENCES `cars_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `car_reserve`
--
ALTER TABLE `car_reserve`
  ADD CONSTRAINT `fk_car_reserve_car_reserve_status1` FOREIGN KEY (`status_id`) REFERENCES `car_reserve_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_car_reserve_car_rider1` FOREIGN KEY (`rider_id`) REFERENCES `car_rider` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_car_reserve_cars1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
