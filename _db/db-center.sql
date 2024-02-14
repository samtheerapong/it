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
-- Database: `db-center`
--

-- --------------------------------------------------------

--
-- Table structure for table `auto_number`
--

CREATE TABLE `auto_number` (
  `group` varchar(32) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `optimistic_lock` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'GR', 'บริหาร', '', 11, '#379237', 1),
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
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thai_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อ-สกุล',
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT '1',
  `rule_id` int(11) DEFAULT '1',
  `department_id` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `thai_name`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`, `role_id`, `rule_id`, `department_id`) VALUES
(1, 'admin', 'ผู้ดูแลระบบ', '2tzscTHLNpS0rJlIJx_Uz1qZnvi6yS_q', '$2y$13$YjwG6MXUIcpOyoMmzX9fDuXo854gmWBxG8SuzInWi4MSr9jZ.91Di', NULL, 'admin@admin.com', 10, 1689666356, 1706705520, 'SA3gozOob2BBbQR0Ue5t4mJQpoyb0gcp_1689666356', 2, 1, 1),
(2, 'demo', 'ทดสอบระบบ', 'lJsMEFiO-XjqJrVhH2aDcjXyrP0oC0vy', '$2y$13$bbMdrjq8fjTTMuEs43DPIuOVIhx1.AzYZQ6WUnJFLqggjRrqxaCme', NULL, 'demo1@demo.com', 9, 1689756005, 1699692001, 'sfLH5psKTa0wMf7dH-kiSrkNcSPqn9OD_1689756005', 1, 2, 1),
(3, 'onanong', 'อรอนงค์ ชมภู', '2bj5VmZ1PEwJDerqRsj3fhE8i2zvsVZq', '$2y$13$74uWJc.fpRzx2rTrowVDYOsIYWK0Qa0h9An3DKiM1iRx4LM4qMcoO', NULL, 'chumphu2538@gmail.com', 10, 1689759317, 1706704387, '9NqfkSJcx8KkIodMLNCeH9HLqhOUmcxw_1689759317', 6, 1, 3),
(4, 'phitchai', 'พิชญ์ชัย พิชญ์ชานุวัฒน์', 'yJwBMulOJv3IDmDkCXrdYZ-VMEw_zwLZ', '$2y$13$Q.1smIJmmAJ28OJ9v2F1wupBzXmYum8Fx79DgyBozTi8OoGNx03Lq', NULL, 'qc.northernfoodcomplex@gmail.com', 10, 1689759339, 1706236584, '4Zgy1uVGJvXg2nZOAHcFCSj0NK0Ll3Ze_1689759339', 5, 1, 3),
(5, 'prakaiwan', 'ประกายวรรณ เทพมณี', 'y2RYhV3E1NG68CUaa8svzBknRdbCTO79', '$2y$13$Skm6AuVq/Qi/E2r6BouzBOn.3GR8aJT5.iaHIpr2KCDsJLUPKU8B2', NULL, 'prakaiwan4213@gmail.com', 10, 1689759362, 1706705617, '2qNZk71gb01_K-bdCiscD38z36G9exZH_1689759362', 3, 7, 3),
(6, 'sale', 'ฝ่ายขาย', 'EHSvx6uElywR8fG2XRQ_xKE4sups-8cO', '$2y$13$0UZFJxx7tUAPdy972cvXEejPhldI17L0Ld7C3KnSKUk7KTLYVUP0y', NULL, 'sale@nfc.com', 10, 1689759388, 1706704441, '9ZnxmSRzPpvLgxD0MPSamdokpcp_eMul_1689759388', 10, 5, 12),
(7, 'planning', 'ฝ่ายวางแผน', 'JWT4BgIkYF4TIN62mLaKv5iL0uLMn7C9', '$2y$13$g08zQ7xjXISzs99kS2yApuOCRcV6QpMOfdzNAwYY8fP9N96pEuAye', NULL, 'planning@localhost.com', 9, 1689759413, 1698802241, '7xCjBXE9xNLx1gWqKX2LaVex2ah0IWt4_1689759413', 1, 1, 1),
(8, 'production', 'ฝ่ายผลิต', 'FjE8vrSWJ1uVTanpvQJDnpq_OiUySrzg', '$2y$13$Oa3U4rEqDwN8W0ytkDHCjuPw8CW4d44l9tEWbi3N3myBogr4mmzBy', NULL, 'production@localhost.com', 9, 1689759430, 1698802250, 'qNJ-e9RkWlfqvHqmvmSsItU1rlpb_D3j_1689759430', 1, 1, 1),
(9, 'watsara', 'วรรษรา หลวงเป็ง', 'XEPSPmb7Bt0oI_tklPUc5Uh4Jq4HM4Ig', '$2y$13$5iA/KWda5k7mbunRRwdNUOXn62jWJ/Ipoc.CzW3XYr69iVHThV1yC', NULL, 'watsara.nfc@gmail.com', 10, 1690430330, 1706704483, 't1iesBNA9TNHWotQHvGzbLCVhrK6LF9O_1690430330', 4, 7, 9),
(10, 'somsak', 'สมศักดิ์ ชาญเกียรติก้อง', '3tiUcswenYgRTZTfuvfv_Tv4V7BXwAcn', '$2y$13$RaVMZpvieW5IfdwpInG4JejNTn8rb7rTCluwPUDO6R8kAJBj1l7D.', NULL, 'somsak@northernfoodcomplex.com', 10, 1691631165, 1706704493, 'Pj5G3y6R8VeykAb0cyXVIHChtnlpquo9_1691631165', 3, 1, 1),
(11, 'peeranai', 'พีรนัย โสทรทวีพงศ์', 'G3b3XCgv3uFzzly7jDX0cJXzNm45qoUV', '$2y$13$5gM/232mFQdlLwbqiQOdE.n2zbN3cLuDGdhIsTK0USk.ASVILRPZy', NULL, 'peeranai@northernfoodcomplex.com', 10, 1691631423, 1706704502, 'HmjAFfcWByo3VbwpZDD9qeBA-shqds8q_1691631423', 13, 1, 1),
(12, 'theerapong', 'ธีรพงศ์ ขันตา', 'tWXwJZ5JEXbWCN0M-0zpCouAUJcL5BwZ', '$2y$13$WG5mTZIZ4ZcL3BoA/vA/7urFzlU2xQ2g4NU29gJegyCCcIte0TCP.', NULL, 'theerapong.khan@gmail.com', 10, 1691639318, 1706704517, NULL, 2, 1, 11),
(13, 'chonlatee', 'ชลธี ลือเลิศ', 'EOXd5DKbM2Jcs6aK9sD62YxeP7VboVhg', '$2y$13$DuO5fXzy/9xaD9VOoJXU2OcqxdQngl30FQjoqrcN6mLNGY/XjzXGO', NULL, 'chonlatee.l@local.com', 10, 1699687514, 1706704534, NULL, 1, 2, 8),
(14, 'yosaporn', 'ยศพร พยัคฆญาติ', 'GOI-0AQj0nAYGBIpppuSe-O3IK4OSs2h', '$2y$13$gnj.Vuf7hYLvMcPCesdU4eXqC4GAZR0iwhYbvBcVxlPNnTvB9mmji', NULL, 'ypayakayat@yahoo.com', 10, 1692180393, 1706704543, NULL, 3, 1, 8),
(15, 'sawika', 'สาวิกา พินิจ', 'GOI-0AQj0nAYGBIpppuSe-O3IK4OSs2h', '$2y$13$ggQkc27TiQ2iQSAW6jcr3OpNGzVRjsE5/etsA7BeM5MubC/RwnhP.', NULL, 'sawika_pinit@yahoo.co.th', 10, 1692180393, 1706704561, NULL, 3, 1, 2),
(16, 'premmika', 'เปรมมิกา พินิจ', 'GOI-0AQj0nAYGBIpppuSe-O3IK4OSs2h', '$2y$13$JNF9k6WursfrumEFcQkYCO1aM6Ikced40Zwsa0wIaOtrGDTBM/Y0y', NULL, 'pinit@yahoo.co.th', 10, 1692180393, 1706704580, NULL, 4, 1, 4),
(17, 'charinee', 'ชาริณี จันต๊ะนาเขต', 'wLQMbhfIHnG07ZHdPZA2IGb5JfIWjm37', '$2y$13$jbb8tfUMLQNpU40y65.1yei8N.iKlbQ5JZg7HA6fFABmc7wvDqyjy', NULL, 'charinee@localhost.com', 10, 1698800364, 1706704601, NULL, 6, 1, 3),
(18, 'benjarat', 'เบญจรัตน์ คงชำนาญ', '-WVnwHhiOWQdUJ3KYypIVVJ1WgFO_NUv', '$2y$13$q4n53.fViyRFwgVoxnWiw.PwWLsY4uuWLRetp8iTIypiYFqcXCJ/W', NULL, 'khongchanan1996@gmail.com', 10, 1698800565, 1706704613, NULL, 6, 1, 3),
(19, 'natthawat', 'ณัฐวัฒน์ วรรณราช', 'Kb6gw6VW_6c9O_CAnGJPnhsX85rF9zyx', '$2y$13$El.F4z5hUULPGAorAABTSObuecQ88VldJxIPZkIT8pRY79tZHuRG2', NULL, 'coi.northernfoodcomplex@gmail.com', 10, 1698800639, 1706704628, NULL, 6, 1, 3),
(20, 'thaksin', 'ทักษิณ อินทรศิลา', 'TZGAEflaZm143CsHlFjJZMMYZdKQeMVE', '$2y$13$BwKpULbKpy7h4gpHinfdJelEu3LEtHGC.mEKhvZWmD1HJlThpFuuq', NULL, 'notethaksin@hotmail.com', 10, 1698800733, 1706704648, NULL, 7, 1, 5),
(21, 'chadaporn', 'ชฎาภรณ์ แก้วคำ', '7HasNWHP_M5-W_fBPDKb1M_0sXyd2Dsc', '$2y$13$O66yoesXcMWn1fNB3AUmiubpNRcH9q/VDv5ARGQT3aMjLU8fIr.7a', NULL, 'kaewkhamchadaporn@gmail.com', 10, 1698801098, 1706704698, NULL, 4, 7, 5),
(22, 'araya', 'อารยา เทพโพธา', 'iOtjB0XK4SiRHsuOwg_vudd0epMz0wHW', '$2y$13$FwNHx5QgPEdvr3fO9TksmOQXoc/YN/fKpbMXvy5ehf/8WBdiMGVnS', NULL, 'araya.thep@gmail.com', 10, 1698801169, 1706704710, NULL, 3, 1, 1),
(23, 'suphot', 'สุพจน์ ช่างฆ้อง', 'vGAi-pbCSZLcDRzbxOZ5w9sPllCdSFQq', '$2y$13$dvgxE11A.6VlEWx2ZF6ODeijXkZI01I2cTcsF30DFG0n5MYoPKioa', NULL, 'changkhong.8777@gmail.com', 10, 1698801231, 1706704717, NULL, 4, 7, 10),
(24, 'suriya', 'สุริยา สมเพชร', 'BACKO9VW3y79pLaoZvOiQtX3OWZzuDQI', '$2y$13$BtJJseMYMycRgZMLsg1Rd.h7cJzilYsTpnyiUdlgxWDK8SwPfXt8S', NULL, 'suriyasompatch@gmail.com', 10, 1698801309, 1706704727, NULL, 3, 1, 10),
(25, 'yotsapon', 'ยศพนธ์ โพธิ', 'wmyXWYgzYvewSqTMmgf9CFDD_ryIM5nl', '$2y$13$SbsFYkqKBTQ3990SGOBnsOOl4Ad7LmnnIZMvz7Now6e/onXWuY70K', NULL, 'yotsapon@localhost.com', 10, 1698801387, 1706704737, NULL, 12, 1, 10),
(26, 'sutahatai', 'ศุทธหทัย ชุูกำลัง', 'LFeQidH3yohyJ3Qc1MOKuZJm27IAZFH0', '$2y$13$kNAosJDYUybr2UHmB02W.edEc8AoY8XJqWs7/FcpbF./0wtnPwZVO', NULL, 'rd.northernfoodcomplex@gmail.com', 10, 1698801460, 1706704744, NULL, 4, 7, 9),
(27, 'phannipha', 'พรรณ์นิภา พิพัฒน์ธัชพร', 'I4QgffOFLAp2wWgH0d5rBIWF-CCeG_4k', '$2y$13$1WGGnfxnKfgORW2jhudi4e9Nbh0ZhZOgrpXjaWnjba82XZQFwHyhK', NULL, 'pipat.pannipa@gmail.com', 9, 1698801550, 1706704755, NULL, 3, 1, 4),
(28, 'jiraporn', 'จิราภรณ์ กาบแก้ว', 'w0GFJQICSa2Ad9453hYPNUMf6Svm1WdX', '$2y$13$hiVIDOSOelsK3/XPYDH0KOFvgUFHLK9uDkZ814owQSIRvnBw.idFi', NULL, 'planning@northernfoodcomplex.com', 10, 1698801621, 1706704774, NULL, 4, 7, 2),
(29, 'taweekiat', 'ทวีเกียรติ คำเทพ', 'tjJu-rUAKYmyXN6v5wZxaESahe2EYKwx', '$2y$13$Jv9fDurwLELQkAnnEL2Ls.64nAqleP/Ys0/zuFfcDbVVSgrQWo0fe', NULL, 'd.taweekiat@gmail.com', 9, 1698801681, 1706704782, NULL, 3, 1, 8),
(30, 'kunrathon', 'กุลธร ดอนมูล', 'qD0mmuOHZ6ZNXs81dppLg3VBB1fQTrcn', '$2y$13$ox0loKGJwrz6bVgn8/MHne1/E8G5AMoTkiqSaVoNpyxGA5cUitIbG', NULL, 'pd03.nfc@gmail.com', 10, 1698801766, 1706704793, NULL, 12, 1, 8),
(31, 'manop', 'มานพ ศรีจุมปา', 'skTB0VTY-7RcVfokMQRjtZjsic0xFo5e', '$2y$13$vCwFZ69vuJKmxzb0wLq73eJjuHFCMJwpOPBUBqf6ERVJqYlIsJTKW', NULL, 'manop.s@local.com', 10, 1699672763, 1706704807, NULL, 11, 1, 10),
(32, 'natthaphon', 'ณัฐพล ขันเขียว', 'agve9wCBQNQsnst59xpLAFBW6Cq7IRLd', '$2y$13$PpNjwUwiwA5ir249i7QGEe6u6BL9TviklOe7LO8e/66M5Km.w0EAO', NULL, 'natthaphon.k@local.com', 10, 1699672822, 1706704817, NULL, 4, 7, 10),
(33, 'komsan', 'คมสันต์ สมบูณ์ชัย', 'qm1hqRc6dLA5L6_UtbmUl1TLAd_D7x9S', '$2y$13$1H7H7WlSc6pm.GV90f9gWuyOf.jZGYpQvTwNQCyAcTkKje71VKrfS', NULL, 'komsan.s@local.com', 10, 1699672864, 1706704825, NULL, 11, 2, 10),
(34, 'sarawut', 'สราวุฒิ โฆษิตเกียรติคุณ', '5_HL5jD2jOAGgRMlzrCGje_mnMVAwrM2', '$2y$13$G3VfQ0sSZItb7c7D0wp9Qu7/C8up3ac.M/QAvQwL7D8G0l90aY0PK', NULL, 'sarawut.k@local.com', 10, 1699673427, 1706704846, NULL, 4, 1, 10),
(35, 'sutap', 'สุเทพ ปวงรังษี', '4ZC6I_pSHZUeKxy0bTWJVJ5OoBU3tyaG', '$2y$13$Qg.BsbzBO79f4LAgQA2q5.Lq2PCB3BXoG2Omy9HRIkGGWczrTqtN2', NULL, 'sutap.p@local.com', 10, 1699673470, 1706704851, NULL, 11, 1, 10),
(36, 'jadsakorn', 'เจษกร คำวรรณ์', 'UpcQnJlQ5ym-tl4ln6RR9lncaVqNEDeE', '$2y$13$elUuASkqoaFpcj4XH8OCE.evOp0652TKPRpayG5e2V2ObS0Wh38eq', NULL, 'jadsakorn.k@local.com', 10, 1699673508, 1706704859, NULL, 11, 1, 10),
(37, 'narongsak', 'ณรงค์ศักดิ์ แซ่จ๋าว', 'KEFY3yiKK0Vu6cL8ZbBVnhvA_e-GmDOH', '$2y$13$2qsIhzxqZNVwdzllVCDeaefAQNRseU3hsproLCerh0WpogDJ0zD2a', NULL, 'narongsak.s@local.com', 10, 1699673668, 1706704866, NULL, 11, 1, 10),
(38, 'panuwat', 'ภานุวัฒน์ ยางรัมย์', 'KlXe_M-3gpwuMycTgSa3b2cHG4sszYbu', '$2y$13$jJOfZ6JxXLACSauDohJCWOaMMbeqT0vcx.P9u2OyViCMkNCAd6MVm', NULL, 'panuwat.y@local.com', 10, 1699673713, 1706704870, NULL, 11, 1, 10),
(39, 'ratsamee', 'รัศมี ศศิยศพงศ์', 'ZwwiwqfFPKF3Qyw0RCufsRwieogeqkKA', '$2y$13$yL81Y4Cw45VCKTU5EZqZr.jWIoZGT2RrCOxshvfPljAvK9Jk6mDvO', NULL, 'ratsamee.s@local.com', 10, 1699684280, 1706705673, NULL, 1, 1, 2),
(40, 'kanprapha', 'กาญจน์ประภา ไพยราช', 'WDv33rQp0vRaL5mKrkznfJ268027UF5a', '$2y$13$/OeA8PeP.Vj6U3oZ5PKxpOk5fbtGD0xu.U4tioVEVnMPUovRK4Z0e', NULL, 'kanprapha.p@local.com', 10, 1699684322, 1706704900, NULL, 12, 1, 2),
(41, 'chanika', 'ชนิกา เรือนมูล', 'sA-NLySBUOSDB8XSWsh1AqoCQrKjroAX', '$2y$13$CMEcJ43Gi8LQKtF8y/MVEeWVohN4PdVEKJ8DfW6LEjc3kngWFloZy', NULL, 'chanika.r@local.com', 10, 1699684367, 1706704941, NULL, 6, 1, 3),
(42, 'tanyarat', 'ธัญญารัตน์ นิ่มวงษ์', 'BAPZkF-0tqu3qK6uVtDff5FZwWHby_lY', '$2y$13$sdHoyCV5cbYP3XU4ZXaX2u0Cvq7spJmxMG35PQCMcoltC0fYJji5y', NULL, 'tanyarat.n@local.com', 10, 1699684417, 1706704952, NULL, 12, 1, 4),
(43, 'kannika', 'กรรณิกา คำภีระ', 'ggE1RcJqk0OyaVS9mj-zB8J37fqtvbq7', '$2y$13$f0HOv./6JmeM.J7dKEWfuOSzqrqk7DlURbJM.MFxoMwvDarAFfKe6', NULL, 'kannika.k@local.com', 10, 1699684493, 1706704960, NULL, 12, 1, 1),
(44, 'sasicha', 'ศศิชา นัตสิทธิ์', 'haaNM8Y3gwJCsL2RvvpP7RioUNVkLCoy', '$2y$13$hAzgJSVrKlqP.TRpOn8q2OuSjkJoz/uSjGqDBPqceY62vOmfOIi..', NULL, 'sasicha.n@local.com', 10, 1699684519, 1706705794, NULL, 12, 1, 1),
(45, 'pranee', 'ปราณี แดงโคตร', 'fxatETyZYQcw4G9WLuk2DeD6tigRLSpx', '$2y$13$FO383fbroT26IGpfszXMeOHS34ynJIZCCBRmMbq8snhFHVwzgyii2', NULL, 'pranee.d@local.com', 10, 1699684567, 1706704988, NULL, 12, 1, 5),
(46, 'kullanisnaree', 'กุลนิษฐ์นรี เจริญจิตรวี', 'xbVfqgX0yJppq1rvKaczeuystm7HWTRr', '$2y$13$QttBiyiA3CPqVPqThJSWgOQU9GFrCAULddMh6hiRtWTNzcUdChlZS', NULL, 'kullanisnaree.c@local.com', 10, 1699684607, 1706705001, NULL, 1, 1, 8),
(47, 'nisarat', 'นิศารัตน์ คำขัด', '6qWMOvel4G-Fd9yAcmJFuP60dIxGDvYo', '$2y$13$bfM4SCN1ldNnHouY9WtR2eRQz4cnX1vX3P0VXrYcezwOx6fPFogsi', NULL, 'nisarat.k@localhost.com', 10, 1699684659, 1706705013, NULL, 4, 1, 8),
(48, 'boonsong', 'บุญส่ง เสียงใหญ่', 'wOK4AATzCwJIwVr0fAC3KpJwsvS6Xjno', '$2y$13$L76aWdu8ddo4x7xXmmmEQOay743a2qNZfqmOe4eml.3TspUNKEEwS', NULL, 'boonsong.s@local.com', 10, 1699684807, 1706705574, NULL, 1, 1, 8),
(49, 'somchat', 'สมชาติ พิจุมปู', 'uPey51SyvEKmcVMhoGVpYk7u4jkOL3dt', '$2y$13$O2o89NXut12mRzgQVbPYnOmttqxE78L6eP4ci422BscHgtXocSUYa', NULL, 'somchat.p@local.com', 10, 1699684842, 1706705031, NULL, 4, 1, 8),
(50, 'mana', 'มานะ คำเป็ง', 'QUNckltEY9HOcWtsAjD-FV5SIS1F9EQP', '$2y$13$3VSDYcZCsnRrzoPEJuTtXuRFOSfNdJLLebESf2/JejBMKy5Q5MD/y', NULL, 'mana.l@local.com', 10, 1699684865, 1706705039, NULL, 4, 1, 8),
(51, 'songkarn', 'สงกรานต์ พรมจักร์', 'nVXtegNye3Vc7vG4fs9plrF2C4Me6cMe', '$2y$13$l2QiQ70Ibkm6865I/pn2f.vtT8fQcT9zuUv.6H.Pk.INLFa0ayB0q', NULL, 'songkarn.p@local.com', 10, 1699684934, 1706705048, NULL, 1, 1, 8),
(52, 'sanong', 'สนอง เสียงใหญ่', 'dibJ2WhwtBhspSNDG8YrdNlq2PV0gn14', '$2y$13$fPhHkslEMoi9RvuvOQUk7OTWOUoqQJxi2CkLpsql0eZfZKxm1ucVq', NULL, 'sanong.s@local,com', 10, 1699684958, 1706705057, NULL, 4, 1, 8),
(53, 'kampon', 'กัมพล สิงห์แก้ว', '8AQqEtzYHPxTol0oCpW3cs2aM80rWTZa', '$2y$13$vq4PPEUZovhoFoKhxYSCWuIGTSlDvHNFBvN4AQ7xUWuwqKr00eUoC', NULL, 'kampon.s@local.com', 10, 1699684984, 1706705071, NULL, 1, 1, 8),
(54, 'boonyung', 'บุญยัง ม้าแก้ว', 'OdkiGuMQ2nulHBhvROue3jLuXSH7SpU6', '$2y$13$cNvIo43kIRYlwWkvJmhgUexDtkwgxTYYMPgNtPrF5R6Ne68YBdMLq', NULL, 'boonyung.m@local.com', 10, 1699685010, 1706705080, NULL, 1, 1, 8),
(55, 'natthapon', 'ณัฐพล ศิริชุมภู', 'vhwHqw2oDqrjq856haquL9Y-skl8AIOx', '$2y$13$YNqhMpa0Zz3VqzN9pt7UYOVCAXa.jW74YrEMOJwIjbNjK6uiaXQdW', NULL, 'natthapon.s@gmail.com', 10, 1699685055, 1706705088, NULL, 1, 1, 8),
(56, 'yuthapichai', 'ยุทธพิชัย ศิริจักร', 'J0BsQX2qs7dH40tEJZeFO22Hads2k6Xi', '$2y$13$YI3aV3k0ZN6dSbCtauyB/unpxn7dIbQMbMIpQLOY5o2S1UxIK6B5m', NULL, 'yuthapichai.s@local.com', 10, 1699685104, 1706705094, NULL, 1, 1, 8),
(57, 'praphawith', 'ประภวิษณุ์ ต๊ะตา', 'EfqNnCEzWwGBPxvlt-zzUoaD1NR4LOSV', '$2y$13$un.za5avahG7uaJAhsHykentDrEVt.D9b4lL.NTcuR619gWDF/t2W', NULL, 'praphawith.t@local.com', 10, 1699685148, 1706705104, NULL, 1, 1, 8),
(58, 'yotsakorn', 'ยศกร ศิริชุมภู', 'y90we65IJjIjTVLSVGC8tJqLwiINpwz4', '$2y$13$wSt1TWJoRVJMSANte94wfe1ChnFV7XHcUv.JJYwJ1gl9YVc2yhwdW', NULL, 'yotsakorn.s@local.com', 10, 1699685190, 1706705109, NULL, 1, 1, 8),
(59, 'jarun', 'จรัญ ดอนเลย', 'kjq19KvF5ziBaRz5qrqjx5dugcZFM50s', '$2y$13$N.0IagO8xjKThH2pN5UWPOB/kZvMMjis2zrBIeNGS7yrcw.egvZV.', NULL, 'jarun.d@local.com', 10, 1699685220, 1706705116, NULL, 1, 1, 8),
(60, 'ongart', 'องอาจ ชุมภูโร', 's9emD5sGgatRTvmjx2lAIesnIoaP9Tly', '$2y$13$xZ.4uRfIA4g10TR8Iuf9H.P3WrvGZAteswlhRh31LSLXI/Kpy8yIe', NULL, 'ongart.c@local.com', 10, 1699685260, 1706705121, NULL, 1, 1, 8),
(61, 'jiraroch', 'จิรโรจน์ ทองเทพ', '0ZOIowngY_I8QO_bvI_A0EoCFdVbUFdN', '$2y$13$brw.ksMKMEnHwWNZh/sna./76FHO8svzLYMlqhQDhEba.1l63FGbW', NULL, 'jiraroch.t@local.com', 10, 1699685289, 1706705168, NULL, 1, 1, 8),
(62, 'sawitee', 'สาวิตรี วันโน', 'KS3_21E3ptIJdbtxolF-XEre2bwgtHKN', '$2y$13$SFKRwJybq12JFjEkt1BqBOWnMZJ3KqV6v8i7lNQq/zbnx.OC2tGhe', NULL, 'sawitee.w@local.com', 10, 1699685316, 1706705175, NULL, 1, 1, 8),
(63, 'kittipong', 'กิตติพงษ์ วงค์ไชยา', 'CDVMYioQrVVFqCragdOVk5wOaW87_zpp', '$2y$13$oS6rOFLq1bUqOAx8c5xWT.ndtPNoFfSddTzhPP646.ONoPE9EcvyG', NULL, 'kittipong.w@local.com', 10, 1699685357, 1706705179, NULL, 1, 1, 8),
(64, 'sirichai', 'ศิริชัย จันทร์ถา', 'yTzdJjTHHRVsSCCLcENHXYg10H2A9xwG', '$2y$13$cjjMyGOCm1kMnZu1EitByegatBv5GtL7uHRTiPi88451RPcVGoG7K', NULL, 'sirichai.j@local.com', 10, 1699685389, 1706705185, NULL, 1, 1, 8),
(65, 'kamon', 'กมล ไชยชมภู', 'JHUCq2z9HhVADGLuA_i7dAiJDhsa1wR2', '$2y$13$SKOaeWe9fPaQCM1Tjgr9HOKfDwptVlIGJKVKk3Q8cq4ioOy9tryKe', NULL, 'kamon.c@local.com', 10, 1699685412, 1706705189, NULL, 1, 1, 8),
(66, 'donlawan', 'ดลวรรษ อัมพวานนท์', 'zHSjvSE6aExt-MrCVYpYk5jyxjNjayYc', '$2y$13$EUpf8KVLaRCPUveXN19ns.nvfiyJHuGjnFpJvAhHdBUgT3q4iyVxa', NULL, 'donlawan.u@local.com', 10, 1699685446, 1706705194, NULL, 1, 1, 8),
(67, 'phadungkiat', 'ผดุงเกียรติ์ คำนึงเชิดชูชัย', 'toj21i1GkAPuGCM5nuyq_mTXEdfrBqV7', '$2y$13$PW6RkVM1Zki0KMLw/9HP/O1OPwBhrbOvLGwUqkp7EDV2lGgBbjmtC', NULL, 'phadungkiat.k@local.com', 10, 1699685477, 1706705201, NULL, 1, 1, 8),
(68, 'poramak', 'ปรเมฆ แซ่พากู่', '93zBcw6pjBHq22BwYc8dIIp8XSUebKq8', '$2y$13$cJAPYebK/8wqZub5qlb41e7llO5jgPdz.AkkBKm67z1qulq3Ik4X.', NULL, 'poramak.s@local.com', 10, 1699685522, 1706705206, NULL, 1, 1, 8),
(69, 'wuthipong', 'วุฒิพงศ์ เผือกขวัญนาค', 'HOwpkCP0spLPMQMprCXC4jKP6y_l4iaf', '$2y$13$dYG9Lc8QjAdVltJ2oJZQ3u5i307Dkc4HwtS8fJCl5tENblg7Xu.Mm', NULL, 'wuthipong.p@local.com', 10, 1699685559, 1706705215, NULL, 1, 1, 8),
(70, 'wasana', 'วาสนา วรรณโล', 'RXZ1AQ7Ap15oCBjGUDocd0qebNA-8vHP', '$2y$13$zP0EZbQQgNqbQ/yUkJ.z9et6ZXdaG/vvwj.yo3Qv63kAYQGXgxJYa', NULL, 'wasana.w@local.com', 10, 1699685583, 1706705218, NULL, 1, 1, 8),
(71, 'theera', 'ธีระ รชตะภัทรพงศา', 'RHJJhDLtiGJvTEfzrfL9ysApUOBAiWzG', '$2y$13$Zun/MKceA2I79/Os8jAt1urJ8Xq.mMEVf8EWq7QMUbxUi1keyD.ca', NULL, 'theera.r@local.com', 10, 1699685621, 1706705223, NULL, 1, 1, 8),
(72, 'santi', 'สันติ วงค์แสง', 'TRyJy7AqIjL5mXMAw-x2smyyqDp7GoJ-', '$2y$13$BWOQByqWgczjf8nIjGy2I.lCPAOPK/.FTRwgj7nS0KRiV3m0LknKq', NULL, 'santi.w@local.com', 10, 1699685644, 1706705227, NULL, 1, 1, 8),
(73, 'jadsadakorn', 'เจษฎากรณ์ วรรณโล', 'uoDFZV_MMJmjdz8eRv8R7TVMuNfkHtnt', '$2y$13$9/lMYQpYeP1c7GajJNNJMuyTRIhtut7sc3th1oTvI8W7vQ9ZF6YoS', NULL, 'jadsadakorn.w@local.com', 10, 1699685685, 1706705231, NULL, 1, 1, 8),
(74, 'bordin', 'บดินทร์ เชมือ', 'qP3gksAxn_bPXbBpyjUuka4WD_fa5YNi', '$2y$13$pKHCCeY./ENt/IDzGMaBhO.p764xSG2q/vwyOXAWH3NSQAQr07QV2', NULL, 'bordin.s@local.com', 10, 1699685711, 1706705236, NULL, 1, 1, 8),
(75, 'noppakun', 'นพคุณ กาบแก้ว', 'qcdUNFTxqGp0AG67Zdg7lIg_jDS5Teqq', '$2y$13$sACEjv94sx9FHZScmm5Yr.iYRzhpyKUVOzPnfZ.vdnyUw16igqseu', NULL, 'noppakun.k@local.com', 10, 1699685754, 1706705239, NULL, 1, 1, 8),
(76, 'nakarin', 'นครินท์ กึกกอง', 'DElk_jB4tJaW0_HkCY0HvobhDL-12O9_', '$2y$13$z7FSHlygIhjwRdIXseZ1H.uEyozXHEn1LpsLgt0v2jLsCfLPnjGsK', NULL, 'nakarin.k@local.com', 10, 1699685786, 1706705244, NULL, 1, 1, 8),
(77, 'kittisak', 'กิตติศักดิ์ จักใจ', 'lWRQ3vlEwLUrDaI65ycC0zL7P4Au455Z', '$2y$13$dkdsYMnEaAH719nyPRhSnu2s7PLfPLSXaQkJQN52cAULrx3G9/G1i', NULL, 'kittisak.j@local.com', 10, 1699685825, 1706705248, NULL, 1, 1, 8),
(78, 'veerayuth', 'วีรยุทธ จุมปูโล', 'A9vrsSIADPEAysCtiS9w_c9kYcOLvcSh', '$2y$13$l5xusTRhTthuK5dJD9t4V.jHxUXCOLWz6rXjXLZJYhHusPxukS0h.', NULL, 'veerayuth.j@local.com', 10, 1699685858, 1706705251, NULL, 1, 1, 8),
(79, 'somkid', 'สมคิด คำยานะ', '1kM4Ch6D5qrI1XbvSY0Y4GQqT8YLG07N', '$2y$13$gfBtlapjTHkVMdwgOwI7LOlStgaYc75sr0DvHvneD.l9xRCeCRMH.', NULL, 'somkid.k@local.com', 10, 1699686011, 1706705255, NULL, 1, 1, 8),
(80, 'pensri', 'เพ็ญศรี ช่างฆ้อง', 'ptkx46QYcn2bwwfen63qGKPGQAKcxYyl', '$2y$13$WTdA7QWaNWextKEdS6TvHOzlhqcOgIuHDN7PCsTz4AMdDMvJhfEA2', NULL, 'pensri.c@local.com', 10, 1699686063, 1706705260, NULL, 1, 1, 8),
(81, 'wanpen', 'วันเพ็ญ บรรดิ', 'nkgFRZiOfCcB3jyqyDFbsCk1YSvC3xs6', '$2y$13$7KLRrgkEGCKMHCSLYe2vK.tFWhcGonLSvN2P/dZKSB59KTTOrnbfK', NULL, 'wanpen.b@local.com', 10, 1699686102, 1706705311, NULL, 1, 1, 8),
(82, 'wipada', 'วิภาดา ไชยชมภู', 'jFF_jEUzhVDt6FALP3vYcbkXKW3hOana', '$2y$13$T/BXTqVf1rPQaS960SVW2.HRj5CFo1w3XAn9hA1YHavMrC8Wk.olS', NULL, 'wipada.c@local.com', 10, 1699686130, 1706705315, NULL, 1, 1, 8),
(83, 'kanya', 'กัญญา เลิศชมภู', '_wJa7uhYYv5HUhjmF093L8QWTjk4J6WW', '$2y$13$oVkpuXWP/S5AK4Kb6GeFDOU6LQDeHYdIPzmaNr/OWlDM4jWbiAgE2', NULL, 'kanya.l@local.com', 10, 1699686155, 1706705319, NULL, 1, 1, 8),
(84, 'wimwipa', 'วิมพ์วิภา รักรุ่ง', 'A9oVWCPsXV2k_I2Teax3vJwJukNrhWhn', '$2y$13$..DFYKujzWCKUwhPGdf3w.iQ0adj/o3c4Wj3OIJpKEqXRrycPsYxW', NULL, 'wimwipa.r@local.com', 10, 1699686260, 1706705322, NULL, 1, 1, 8),
(85, 'jeerapong', 'จีระพงศ์ สุเดชมารค', 'CpQnZXgr14sFpReg0h1WFzxn_iR160-G', '$2y$13$5eFDM.iq4oHSVUkraF7uXuorFb9HBVic3J9CMSLTMd9aj9hnvCGOu', NULL, 'jeerapong.s@local.com', 10, 1699686292, 1706705326, NULL, 1, 1, 8),
(86, 'chalurmchai', 'เฉลิมชัย สีเขียว', 'Z5xBDmTuAQ6NSNR5Rc90Mr2JEBfNLIB8', '$2y$13$/V/6tlptlPBx5yqQpyIOw.DqiINnWx.v0Xkj4AzTO0aJCMaZpefj.', NULL, 'chalurmchai.s@local.com', 10, 1699686323, 1706705329, NULL, 1, 1, 8),
(87, 'atthapon', 'อรรถพล เครือวงค์', '5a6cwqT361_OtnjtaXCA926gY6S3PnT-', '$2y$13$JkGjtU1Z0jiwrKbLLCIqAuoug1fzWyUpq7Rs5PL5iJc63Dee.Sinq', NULL, 'atthapon.k@local.com', 10, 1699686352, 1706705332, NULL, 1, 1, 8),
(88, 'wannapa', 'วรรณภา เหมืองหม้อ', 'wSZTo5ls2FGCH65lbBTfs_SMBo0sUxtz', '$2y$13$B0TE7FrSIbsIbDW/3kXh0.p3Aov713CwHXNp9dg33fdlk3xBnpqX6', NULL, 'wannapa.m@local.com', 10, 1699686377, 1706705336, NULL, 1, 1, 8),
(89, 'jiranan', 'จีระนันท์ จรรยา', 'HZEEzX3LYWtH8HCWTvJeHOdDMo5aPb7B', '$2y$13$G1IgvDM7BRiPLu7p.Xd0ku4T9aa/TimQuCYAPb0exygjTo/XjLstK', NULL, 'jiranan.j@local.com', 10, 1699686398, 1706705340, NULL, 1, 1, 8),
(90, 'penpayom', 'เพ็ญพยอม เครือวงศ์', '3uzpB3yEv8rKMi7ecIS5t1UBWF4F0soW', '$2y$13$zt.1Ofkjq6Qw.uTsaoMcge2RPUjRAzZvS.7mZHsmqc0Q04OjQB9RC', NULL, 'penpayom.k@local.com', 10, 1699686425, 1706705345, NULL, 1, 1, 8),
(91, 'narongsakpd', 'ณรงค์ศักดิ์ แซ่วื้อ', 'yC5anyf5l7nwHsY4lxnIeaPnN_Bvvd4d', '$2y$13$LPNkgA.HTshd/aTe8lS2guF7HA2vJh1G9NZr3zRZvENYlBxJWKcJO', NULL, 'narongsakpd.s@local.com', 10, 1699686470, 1706705348, NULL, 1, 1, 8),
(92, 'sumalee', 'สุมาลี วิจิตรพวงชมพู', 'j1_KpWX9gqdB3ldEgtVIIkQkjIznMC8V', '$2y$13$840bif1HLJKKch1IC..mbuH50r6DHiJGydX.wEukVJJ/SIRMe4T3u', NULL, 'sumalee.w@local.com', 10, 1699686524, 1706705352, NULL, 1, 1, 8),
(93, 'suwimol', 'สุวิมล ยาวิละ', '2LyaKKzkX4xaUm1xZ0rqmuibyWZlRnHn', '$2y$13$eKu1nqzO1nkL8cIF/AtPYeMe9rq/aNXgt7rHzBieQ5ZuLO7V.TAHq', NULL, 'suwimol.y@local.com', 10, 1699686562, 1706705357, NULL, 1, 1, 8),
(94, 'nongkarn', 'นงคราญ ไชยแก้ว', 'KhOevm-RxzkkGPAocZyRVuJdbY-70MKT', '$2y$13$PxWoDDOMM9P5/ucztStVeOS3cowmFtDSxuK.wbcIyDE22dfQvCNyu', NULL, 'nongkarn.c@local.com', 10, 1699686641, 1706705361, NULL, 1, 1, 8),
(95, 'kannikar', 'กรรณิการ์ เตชะเนตร', 'bqw8B9ndHTZxr1MAsLD5wdGI-0yhJErv', '$2y$13$Zkdw2L.Y/lvebyP673Sg1uwPrtltSRdpE63quJ6o13GwP3bBXBsfa', NULL, 'kannikar.t@local.com', 10, 1699686677, 1706705365, NULL, 1, 1, 8),
(96, 'natee', 'นที เตปินตา', 'dcymGMXXb80Tc03ceEdmt_ZGNJWlfnXS', '$2y$13$YHA.tuBV/YPgCk5oBLswE.UVbnQn33coR.CHVJtCSmECRmdVVtWza', NULL, 'natee.t@local.com', 10, 1699686696, 1706705369, NULL, 1, 1, 8),
(97, 'suwanan', 'สุวนันท์ จันทสิงห์', 'XPBYDyy02GTlB4m0k8LDNMfBTGPIFv-i', '$2y$13$E53XnYVTF8Cobpmn0qKUfOKeJoqDFBTSqLODsQwa176v1kLqJRWdS', NULL, 'suwanan.j@local.com', 10, 1699686726, 1706705373, NULL, 1, 1, 8),
(98, 'chokchai', 'โชคชัย จันทวงษ์', 'DlZeOkai8z130tasyHrC3Bs-5a1_nGmd', '$2y$13$Sszde9rGeOZtD5gCWPVnXe3ZIZNVeXMrpP3aoeR7OLww/EALPm4y2', NULL, 'chokchai.j@local.com', 10, 1699686752, 1706705378, NULL, 1, 1, 8),
(99, 'kunpan', 'ขุนแผน เสียงใหญ่', 'jJGHCmgOHR95eAwawoMWlQJOz4bO3KLE', '$2y$13$pLS2tzIiEE4rglEwiIn5WePN3C5aq5h2VeZit9TW0kyH7GjwggsXi', NULL, 'kunpan.s@local.com', 10, 1699686776, 1706705382, NULL, 1, 1, 8),
(100, 'napatporn', 'นภัสภรณ์ เลิศชมภู', 'deO2wA63dHuD6scgZmzr7msR8WDYZUxP', '$2y$13$UqHp.mN9XTMdzV5cx.rZN.o43egD/Bt7ff9IueEKjrCQB6dkV2iEy', NULL, 'napatporn.l@local.com', 10, 1699686803, 1706705387, NULL, 1, 1, 8),
(101, 'siwalee', 'สิวลี สุขบำรุง', 'R8hcVq2taOXl7OSL-B9iTaeChP5LTY0a', '$2y$13$vduvjvfX0Q5Q2Sppidux0.8H9EFdoKKeabD0k5zFfvqH4tk0CxRzu', NULL, 'siwalee.s@local.com', 10, 1699686823, 1706705426, NULL, 1, 1, 8),
(102, 'siripatsorn', 'ศิริภัสสร ขัติยะ', 'JyUw3KmvzoBPdgMMLFw1V69HDgPQTheA', '$2y$13$gpuZ562aKqGM.tyNs98FnOQv6pwQY2JP8Po8rocdyUq6yJIEmkMB.', NULL, 'siripatsorn.k@local.com', 10, 1699686849, 1706705431, NULL, 1, 1, 8),
(103, 'nampech', 'น้ำเพชร ลำใยผล', 'xsiB1HBq8bgGcykGL5DRm9MDf5udiNcv', '$2y$13$KiceLJ/TiCPz7thu3mZrBeHjblBX1oVlQpf/GOZeWKHNmhDxpGbkK', NULL, 'nampech.l@local.com', 10, 1699686879, 1706705434, NULL, 1, 1, 8),
(104, 'pasan', 'ประสาน ชัยตาล', 'ks3oAEZ61yBd9ofdreMLsgm7H3s-Ue5S', '$2y$13$cjppQMdrbloKy9I2QcQACOkcE34KA5.xNH5k8NV4XTbNi36jvpSL6', NULL, 'pasan.c@local.com', 10, 1699686903, 1706705438, NULL, 1, 1, 8),
(105, 'buaban', 'บัวบาน มณีจิต', 'iLoGKGtyGwhjflUNxu5Yzn9bQzAtxM2r', '$2y$13$NqFH0q9LmQrlVEwmoA4xB.Dxvudt1IITNb/jUQNNg.beuGR6ZXNYK', NULL, 'buaban.m@local.com', 10, 1699686933, 1706705443, NULL, 1, 1, 8),
(106, 'kitkajon', 'กิจขจร โค้งคูณหาร', 'T2KkDB5BYNsqMlf16Fs5VSP1S6oZVaVJ', '$2y$13$Mtw9M917a6Bcbj8AjumNxe6MsFoQAvdUstMNNrCeKyYEcNM79DDdC', NULL, 'kitkajon.k@local.com', 10, 1699686968, 1706705448, NULL, 1, 1, 8),
(109, 'penpayome', 'เพ็ญโพยม พรมเสพสัก', 'TxcFyFdiCoRMY21t76RvO_kowDefONvi', '$2y$13$W0GFY5I/JSuD8oOoFFWzIOJpmhvKaHAYoCWYRaRYuWzuJr24ay1um', NULL, 'penpayome.p@local.com', 10, 1699687069, 1706705453, NULL, 1, 1, 8),
(110, 'sukniran', 'สุขนิรันดร์ ผันผ่อน', 'Qg2SLiqjv5RazhRo1_CcI8WDdRpQ40Km', '$2y$13$xnbU1dKHpLMt4FzZxBsFGua2A.H0PU5WpbFl42rIDvAm3Du0l2sau', NULL, 'sukniran.p@local.com', 10, 1699687151, 1706705457, NULL, 1, 1, 8),
(111, 'pun', 'พัน ไชยวงค์', 'ZfaslU-Ma3eEKWS_Q5gQLX6CAAHORaM8', '$2y$13$1VtBMEIT.5txNULGzZkIve/MfRXGku0l6G6wV5g69GK9j/CLmQtsi', NULL, 'pun.c@local.com', 10, 1699687183, 1706705462, NULL, 1, 1, 8),
(112, 'patcharin', 'พัชรืน บรรดิ', 'nl69zW3du9EER0QEKdMd74UctPGKEgR8', '$2y$13$A7kASztfhEhC.yCWqTgmQeyr7tTnSVO901B1DBqyVzqYB8D1TO6Nm', NULL, 'patcharin.b@local.com', 10, 1699687237, 1706705466, NULL, 1, 1, 8),
(113, 'ratchanee', 'รัชณี ชุมภูโร', 'sKSXmQlcO8ChY1z2TytbmzFXDCrOXB_Q', '$2y$13$eoiMmfqe3MI.82NgjiBn1uzZ8F1wChHtSNuHnEGv6dnclSU.Zomhq', NULL, 'ratchanee.c@local.com', 10, 1699687263, 1706705470, NULL, 1, 1, 8),
(114, 'benjawan', 'เบญจวรรณ สุขใส', 'gmYRQ6MLSFVv46y2S9XxzrrxZ7AflF47', '$2y$13$3Voa06gcsfHLqRVE/oh/RuFzYffMeQ2u3fA/.csdOBzD1IUyPm6ZS', NULL, 'benjawan.s@local.com', 10, 1699687298, 1706705473, NULL, 1, 1, 8),
(115, 'sakda', 'ศักดา วงศ์สุข', 'wc83Q1oGp86pCnKZMuPbEpEJRMqAxWpZ', '$2y$13$OoyaY7BOWbkAwEIazB1V6O1QzgYOZt5rsfNWIwjcHeixiYYJOWQKi', NULL, 'sakda.w@local.com', 10, 1699687321, 1706705476, NULL, 1, 1, 8),
(116, 'mathurot', 'มธุรส อินเทพ', 'CdTvIVdx8PT-VRxGmLo98k5GMx1kNVGp', '$2y$13$cc/Fm/T3UBHBV9x/8LnyjOM6pkJIpoix2C.ie9teSb902PDB0QeMe', NULL, 'mathurot.i@local.com', 10, 1699687354, 1706705479, NULL, 1, 1, 8),
(117, 'soythip', 'สร้อยทิพย์ กาลศรี', 'ZM-XCtMM0GvQn_Aesgn9LLy26XNv3R5z', '$2y$13$TBBNc0ekmdn/D.Me1oYjh.OnrW35Wfojc7Ljmy8aY98z2kKmUQM16', NULL, 'soythip.k@local.com', 10, 1699687381, 1706705482, NULL, 1, 1, 8),
(118, 'namfon', 'น้ำฝน วงค์เทพ', 't7wIRKM1mmFxEKvohFc9YvKuA5wFi_Xp', '$2y$13$Kwiuhk6.8AmcRNITe9cM7uxVjC/QiO1p70I1RxhTWz4wcHTc1RRvS', NULL, 'namfon.w@local.com', 10, 1699687401, 1706705485, NULL, 1, 1, 8),
(119, 'samrouy', 'สำรวย กันธิยะ', 'BDZdfPbOI2klNUy7vbk14UOKuzY8_eeX', '$2y$13$X241C.OGHEftZWSX0blsdOTqktm4WreTlLaQFOKVwRaJjdu.2UNou', NULL, 'samrouy.k@local.com', 10, 1699687457, 1706705489, NULL, 1, 1, 8),
(120, 'natthapan', 'ณัฐพันธ์ ขุมนาค', 'nHfZMx0P8UNY0KK2SauLlUsqNpz4wkPq', '$2y$13$w/CridVo2BD4MU4weplCe.L52h5d7VboM61XXqXGNNeOISK/cJk4.', NULL, 'natthapan.k@local.com', 10, 1699687482, 1706705492, NULL, 1, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `code`, `name`, `color`, `active`) VALUES
(1, 'user', 'ผู้ใช้งาน', '#001B79', 1),
(2, 'administrator', 'ผู้ดูแลระบบ', '#379237', 1),
(3, 'manager', 'ผู้จัดการ', '#279EFF', 1),
(4, 'head', 'หัวหน้า', '#1A5D1A', 1),
(5, 'qmr', 'ตัวแทนฝ่ายบริหารด้านคุณภาพ', '#7C73C0', 1),
(6, 'dcc', 'ผู้ควบคุมเอกสาร', '#FF6D60', 1),
(7, 'smr', 'Safety Management Representative', '#3F497F', 1),
(8, 'lmr', 'Labour Management Relations', '#AA8B56', 1),
(9, 'auditor', 'ผู้ตรวจสอบ', '#DF2E38', 1),
(10, 'sale', 'ขาย', '#3C6255', 1),
(11, 'technician', 'ช่างเทคนิค', '#12486B', 1),
(12, 'administrative', 'ธุรการ', '#E55604', 1),
(13, 'GM', 'ผู้จัดการทั่วไป', '#451952', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_rules`
--

CREATE TABLE `user_rules` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_rules`
--

INSERT INTO `user_rules` (`id`, `code`, `name`, `color`, `active`) VALUES
(1, 'index', 'หน้าหลัก', '#1A5D1A', 1),
(2, 'view', 'ดู', '#0079FF', 1),
(3, 'create', 'สร้าง', '#F94A29', 1),
(4, 'update', 'แก้ไข', '#B70404', 1),
(5, 'delete', 'ลบ', '#070A52', 1),
(6, 'profile', 'โปรไฟล์', '#539165', 1),
(7, 'download', 'ดาวน์โหลด', '#4C4B16', 1),
(8, 'All', '[\'index\', \'view\', \'create\', \'update\', \'delete\', \'profile\',\'download\']', '#379237', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auto_number`
--
ALTER TABLE `auto_number`
  ADD PRIMARY KEY (`group`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_rules`
--
ALTER TABLE `user_rules`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_rules`
--
ALTER TABLE `user_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
