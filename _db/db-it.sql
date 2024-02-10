-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 10, 2024 at 09:48 AM
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
-- Database: `db-it`
--

-- --------------------------------------------------------

--
-- Table structure for table `cost_record`
--

CREATE TABLE `cost_record` (
  `id` int(11) NOT NULL,
  `pr_number` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `item_code` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `item_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `departmet_id` int(11) DEFAULT NULL,
  `item_type_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `remask` text CHARACTER SET latin1,
  `docs` text CHARACTER SET latin1,
  `ref` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cost_status`
--

CREATE TABLE `cost_status` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `cost_statuscol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cost_type`
--

CREATE TABLE `cost_type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `cost_statuscol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL COMMENT 'รหัส',
  `name` varchar(255) DEFAULT NULL COMMENT 'ชื่อแผนก',
  `detail` text COMMENT 'รายละเอียด',
  `department_head` int(11) DEFAULT NULL COMMENT 'หัวหน้าแผนก',
  `color` varchar(255) DEFAULT NULL COMMENT 'สี',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `code`, `name`, `detail`, `department_head`, `color`, `active`) VALUES
(1, 'GR', 'บริหาร', NULL, 11, '#379237', 1),
(2, 'WH', 'แผนกคลังสินค้า', NULL, 22, '#425F57', 1),
(3, 'QC\n', 'แผนกควบคุมคุณภาพ', NULL, 20, '#379237', 1),
(4, 'PC\n', 'แผนกจัดซื้อ', NULL, 29, '#C21010', 1),
(5, 'HR\n', 'แผนกบุคคล', NULL, 27, '#FF8787', 1),
(6, 'AC', 'แผนกบัญชี', NULL, 24, '#872341', 1),
(7, 'GM', 'ผู้จัดการทั่วไป', NULL, 15, '#ED5AB3', 1),
(8, 'PD', 'ฝ่ายผลิต', NULL, 4, '#EC8F5E', 1),
(9, 'RD', 'แผนกวิจัยและพัฒนา', NULL, 4, '#F3B664', 1),
(10, 'EN', 'แผนกวิศวกรรม', NULL, 26, '#2E97A7', 1),
(11, 'IT', 'แผนกไอที', NULL, 15, '#B0578D', 1),
(12, 'SL', 'ฝ่ายขาย', NULL, 12, '#186F65', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hardware`
--

CREATE TABLE `hardware` (
  `id` int(11) NOT NULL,
  `hardware_name` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hardware`
--

INSERT INTO `hardware` (`id`, `hardware_name`, `active`) VALUES
(1, 'IT01', 1),
(2, 'GM01', 1),
(3, 'MT01', 1),
(4, 'PN01', 1),
(5, 'PN02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL COMMENT 'สถานะ',
  `user_id` int(11) DEFAULT NULL COMMENT 'USER ID',
  `thai_name` varchar(200) DEFAULT NULL COMMENT 'ชื่อ-สกุล',
  `eng_name` varchar(200) DEFAULT NULL COMMENT 'ชื่ออังกฤษ',
  `nick_name` varchar(45) DEFAULT NULL COMMENT 'ชื่อเล่น',
  `department` int(11) DEFAULT NULL COMMENT 'แผนก',
  `location` varchar(200) DEFAULT NULL COMMENT 'สถานที่',
  `position` varchar(200) DEFAULT NULL COMMENT 'ตำแหน่ง',
  `email` varchar(200) DEFAULT NULL COMMENT 'อีเมล',
  `tel_number` varchar(45) DEFAULT NULL COMMENT 'เบอร์ภายใน',
  `mobile_number` varchar(45) DEFAULT NULL COMMENT 'เบอร์มือถือ',
  `emp_id` varchar(45) DEFAULT NULL COMMENT 'รหัสพนักงาน',
  `birth_date` date DEFAULT NULL COMMENT 'วันเกิด',
  `address` text COMMENT 'ที่อยู่',
  `starting_date` date DEFAULT NULL COMMENT 'วันเริ่มงาน',
  `resign_date` date DEFAULT NULL COMMENT 'วันลาออก',
  `avatar` text COMMENT 'อวทาร์',
  `note` text COMMENT 'บันทึก'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `software`
--

CREATE TABLE `software` (
  `id` int(11) NOT NULL,
  `software_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อ',
  `active` int(11) DEFAULT '1' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `software`
--

INSERT INTO `software` (`id`, `software_name`, `active`) VALUES
(1, 'Windows', 1),
(2, 'Office', 1),
(3, 'MRP', 1),
(4, 'Express', 1);

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `id` int(11) NOT NULL,
  `todo_code` varchar(45) NOT NULL COMMENT 'รหัส',
  `request_date` date DEFAULT NULL COMMENT 'วันที่ขอ',
  `title` varchar(255) NOT NULL COMMENT 'หัวข้อ',
  `department` int(11) NOT NULL COMMENT 'แผนก',
  `request_name` int(11) NOT NULL COMMENT 'ผู้แจ้ง',
  `photo` text COMMENT 'รูป',
  `status` int(11) DEFAULT NULL COMMENT 'สถานะ',
  `created_at` date DEFAULT NULL COMMENT 'เพิ่มเมื่อ',
  `created_by` int(11) DEFAULT NULL COMMENT 'เพิ่มโดย',
  `updated_at` date DEFAULT NULL COMMENT 'ปรับปรุงเมื่อ',
  `updated_by` int(11) DEFAULT NULL COMMENT 'ปรับปรุงโดย'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `todo_action`
--

CREATE TABLE `todo_action` (
  `id` int(11) NOT NULL,
  `todo_id` int(11) DEFAULT NULL COMMENT 'TO DO',
  `hardware` text COMMENT 'อุปกรณ์',
  `software` text,
  `cost` decimal(10,2) DEFAULT NULL COMMENT 'ค่าใช้จ่าย',
  `actor` int(11) DEFAULT NULL COMMENT 'ผู้ดำเนินการ',
  `activity` text COMMENT 'วิธีการ',
  `start_date` date DEFAULT NULL COMMENT 'วันที่เริ่ม',
  `end_date` date DEFAULT NULL COMMENT 'วันที่เสร็จ',
  `docs` text COMMENT 'แนบไฟล์'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `todo_status`
--

CREATE TABLE `todo_status` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `todo_status`
--

INSERT INTO `todo_status` (`id`, `name`, `color`, `active`) VALUES
(1, 'Open', '#FF004D', 1),
(2, 'Process', '#FF9800', 1),
(3, 'Close', '#294B29', 1),
(4, 'Hold', '#0766AD', 1),
(5, 'Cancel', '#C69774', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cost_record`
--
ALTER TABLE `cost_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cost_record_cost_status_idx` (`status_id`),
  ADD KEY `fk_cost_record_cost_type1_idx` (`item_type_id`);

--
-- Indexes for table `cost_status`
--
ALTER TABLE `cost_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cost_type`
--
ALTER TABLE `cost_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hardware`
--
ALTER TABLE `hardware`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_todo_todo_status1_idx` (`status`);

--
-- Indexes for table `todo_action`
--
ALTER TABLE `todo_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_todo_action_todo1_idx` (`todo_id`);

--
-- Indexes for table `todo_status`
--
ALTER TABLE `todo_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cost_record`
--
ALTER TABLE `cost_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cost_status`
--
ALTER TABLE `cost_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cost_type`
--
ALTER TABLE `cost_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `hardware`
--
ALTER TABLE `hardware`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `software`
--
ALTER TABLE `software`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `todo_action`
--
ALTER TABLE `todo_action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `todo_status`
--
ALTER TABLE `todo_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cost_record`
--
ALTER TABLE `cost_record`
  ADD CONSTRAINT `fk_cost_record_cost_status` FOREIGN KEY (`status_id`) REFERENCES `cost_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cost_record_cost_type1` FOREIGN KEY (`item_type_id`) REFERENCES `cost_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `todo`
--
ALTER TABLE `todo`
  ADD CONSTRAINT `fk_todo_todo_status1` FOREIGN KEY (`status`) REFERENCES `todo_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `todo_action`
--
ALTER TABLE `todo_action`
  ADD CONSTRAINT `fk_todo_action_todo1` FOREIGN KEY (`todo_id`) REFERENCES `todo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
