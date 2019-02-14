-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2019 at 06:56 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `login`
--

-- --------------------------------------------------------

--
-- Table structure for table `demo`
--

CREATE TABLE `demo` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `demo`
--

INSERT INTO `demo` (`id`, `category`) VALUES
(1, 'hdpe'),
(2, 'sprinkle'),
(3, 'irrigation'),
(4, 'spray');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uploaded_on` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `file_name`, `uploaded_on`, `status`) VALUES
(1, '_downloadfiles_wallpapers_1920_1200_think_different_apple_3927.jpg', '2018-12-27 06:07:04', '1'),
(2, '00ac5eeb1ecfb504ec080fc9d4d06084.jpg', '2018-12-27 06:07:08', '0'),
(3, '0ac6cf98c70afc53c1cd48de361f54d8.jpg', '2018-12-27 06:07:15', '0'),
(4, '33.jpg', '2018-12-27 06:07:30', '0'),
(5, '331.jpg', '2018-12-27 06:07:54', '0'),
(6, '332.jpg', '2018-12-27 06:08:01', '0'),
(7, '333.jpg', '2018-12-27 06:12:35', '0'),
(8, '334.jpg', '2018-12-27 06:13:16', '1'),
(9, '335.jpg', '2018-12-27 06:15:27', '1'),
(10, '336.jpg', '2018-12-27 06:16:18', '1'),
(11, '337.jpg', '2018-12-27 06:40:24', '1'),
(12, '338.jpg', '2018-12-27 10:52:03', '1'),
(13, '1_1e8i4KFLv8IOBTkKtCD08A.jpeg', '2019-01-25 11:23:31', '1'),
(14, '1_1e8i4KFLv8IOBTkKtCD08A1.jpeg', '2019-01-25 11:23:58', '1');

-- --------------------------------------------------------

--
-- Table structure for table `multiple_upload`
--

CREATE TABLE `multiple_upload` (
  `multiple_upload_ID` int(11) NOT NULL,
  `file_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `multiple_upload`
--

INSERT INTO `multiple_upload` (`multiple_upload_ID`, `file_name`) VALUES
(1, '4f625db5714d87af59a5e1d857d222db.jpg'),
(2, 'c0109336966e4fbaa60ee1f59e9d53ad.jpg'),
(3, '31769a8b8ee3012644893a23fe4de85b.jpg'),
(4, 'd8157b7d573c92173afd9255884dde31.jpg'),
(5, '82837c1216c5cd7d1889f2f7d02e1956.jpg'),
(6, '0976a5556bed17612937305b58bec620.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `single_upload`
--

CREATE TABLE `single_upload` (
  `single_upload_ID` int(11) NOT NULL,
  `file_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `single_upload`
--

INSERT INTO `single_upload` (`single_upload_ID`, `file_name`) VALUES
(1, '6850e9c84c3e80c9ae0b3f7f2dd5dc1b.jpg'),
(2, '4b10cc04f082d5f68bcc2c308ec42bc9.jpg'),
(3, '5541289de2d243499bddf7f160597e41.jpeg'),
(4, '01e36b5cd85a2cf3e2814454bd6ffc64.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `cat`) VALUES
(1, 'test', 'hdpe'),
(2, 'Test2', 'hdpe'),
(3, 'test', 'sprinkle'),
(4, 'Test2', 'sprinkle');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `userfile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `phone`, `userfile`) VALUES
(138, 'abc@gmail.comqw', 'qqqqqqqqqq', 'eeeeeeeeee', '8888888888888', '_downloadfiles_wallpapers_1920_1200_think_different_apple_3927.jpg'),
(139, '', '', '', '', '041c3082d44c6bd5beffb4e5e3309962.jpg'),
(140, 'abc@gmail.comAw', 'aaaaaaaaaaaaww', 'eeeeeeeeeew', '888888888888855', ''),
(141, 'lme.lucdfdfkyyes@gmail.com', 'aaaaaaaaaaa', 'fdfd', '8888888888888', '336.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `demo`
--
ALTER TABLE `demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multiple_upload`
--
ALTER TABLE `multiple_upload`
  ADD PRIMARY KEY (`multiple_upload_ID`);

--
-- Indexes for table `single_upload`
--
ALTER TABLE `single_upload`
  ADD PRIMARY KEY (`single_upload_ID`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `demo`
--
ALTER TABLE `demo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `multiple_upload`
--
ALTER TABLE `multiple_upload`
  MODIFY `multiple_upload_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `single_upload`
--
ALTER TABLE `single_upload`
  MODIFY `single_upload_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
