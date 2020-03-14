-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2020 at 08:01 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tpa`
--

-- --------------------------------------------------------

--
-- Table structure for table `analyzer`
--

CREATE TABLE `analyzer` (
  `a_id` int(11) NOT NULL,
  `log_id` int(5) NOT NULL,
  `s_id` int(5) NOT NULL,
  `d_id` int(5) NOT NULL,
  `loc` varchar(50) NOT NULL,
  `a_name` varchar(20) NOT NULL,
  `a_no` varchar(20) NOT NULL,
  `a_email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analyzer`
--

INSERT INTO `analyzer` (`a_id`, `log_id`, `s_id`, `d_id`, `loc`, `a_name`, `a_no`, `a_email`) VALUES
(1, 63, 38, 8, 'm', 'ardra', '9866543212', 'xx@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `cid` int(11) NOT NULL,
  `c_title` varchar(20) NOT NULL,
  `c_msg` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `creplay` varchar(100) NOT NULL,
  `log_id` int(5) NOT NULL,
  `c_role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`cid`, `c_title`, `c_msg`, `date`, `creplay`, `log_id`, `c_role`) VALUES
(3, 'rtgr', 'rtry', '1', 'xzcffvfg', 12, 'user'),
(4, 'fg', 'xfd', '1', 'szdffdsf', 25, 'substaff'),
(5, 'df', 'sdf', '1', 'gvhngvfcfgfdgf', 22, 'staff'),
(9, 'jhk', 'hj', '2020-02-14', 'gfftyf', 63, 'analyzer'),
(10, 'uiyi', 'gyg', '2020-02-14', 'null', 66, 'guide');

-- --------------------------------------------------------

--
-- Table structure for table `c_register`
--

CREATE TABLE `c_register` (
  `c_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `c_name` varchar(50) NOT NULL,
  `c_add` varchar(200) NOT NULL,
  `c_phno` varchar(20) NOT NULL,
  `c_email` varchar(20) NOT NULL,
  `c_status` varchar(20) NOT NULL,
  `about` varchar(200) NOT NULL,
  `date` varchar(20) NOT NULL,
  `ceoname` varchar(200) NOT NULL,
  `pic` varchar(6000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `c_register`
--

INSERT INTO `c_register` (`c_id`, `log_id`, `c_name`, `c_add`, `c_phno`, `c_email`, `c_status`, `about`, `date`, `ceoname`, `pic`) VALUES
(29, 66, 'admin', 'gjuiy', '9866543212', 'gg@gmail.com', 'Reject', 'yguhjt', '1991-02-11', 'ew', 'null'),
(30, 68, 'ardraq', 'sfrewa', '1234567890', 'xx@gmail.com', 'Reject', 'ew', '1991-02-10', 'ew', 'null'),
(31, 69, 'veena', 'fghh', '8', 'xx@gmail.com', 'Reject', '38', '2020-02-13', 'null', 'null'),
(32, 70, 'vishnu', 'fghg', '9087654321', 'aa@gmail.com', 'Approved', '38', '2020-02-13', '8', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `dist_id` int(5) NOT NULL,
  `state_id` int(5) NOT NULL,
  `district` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`dist_id`, `state_id`, `district`) VALUES
(8, 38, 'kollam');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feed_id` int(11) NOT NULL,
  `log_id` int(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `msg` varchar(200) NOT NULL,
  `date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feed_id`, `log_id`, `title`, `msg`, `date`) VALUES
(1, 59, 'iojk', 'ooikop', '0000-00-00'),
(2, 113, 'gyhtfy', 'frgytf', '2019-07-17'),
(3, 113, 'inappropriate behaviour', 'officer ask my details', '2019-07-31'),
(4, 125, 'good processing', 'this is a good portal for register complaints', '2019-07-31'),
(6, 59, 'c', 'fgd', '2020-02-14');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `l_id` int(11) NOT NULL,
  `s_id` int(5) NOT NULL,
  `dist_id` int(5) NOT NULL,
  `loc` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`l_id`, `s_id`, `dist_id`, `loc`) VALUES
(3, 38, 8, 'jhk');

-- --------------------------------------------------------

--
-- Table structure for table `locationmapper`
--

CREATE TABLE `locationmapper` (
  `lo_id` int(11) NOT NULL,
  `s_id` int(5) NOT NULL,
  `dist_id` int(5) NOT NULL,
  `location` varchar(250) NOT NULL,
  `des` varchar(250) NOT NULL,
  `date` varchar(25) NOT NULL,
  `log_id` int(5) NOT NULL,
  `stat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locationmapper`
--

INSERT INTO `locationmapper` (`lo_id`, `s_id`, `dist_id`, `location`, `des`, `date`, `log_id`, `stat`) VALUES
(6, 38, 8, 'jhk', 'gfhgf', '2020-02-14', 59, 'admin_approved');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `log_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `role` varchar(30) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`log_id`, `user_name`, `password`, `role`, `email`) VALUES
(1, 'admin', '123', 'admin', 'admin@gmail.com'),
(59, 'ardra', '123', 'user', 'aa@gmail.com'),
(63, 'b', '123', 'analyzer', 'aa@gmail.com'),
(66, 'g', '123', 'guide', 'xx@gmail.com'),
(68, 'gq', 'qq', 'guide', 'xx@gmail.com'),
(69, 'veena', 'veena', 'guide', 'xx@gmail.com'),
(70, 'vishnu', 'vishnu', 'guide', 'aa@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `user_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `add` varchar(300) NOT NULL,
  `phno` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `user_status` varchar(30) NOT NULL,
  `log_id` int(11) NOT NULL,
  `l_name` varchar(20) NOT NULL,
  `f_name` varchar(20) NOT NULL,
  `m_name` varchar(20) NOT NULL,
  `caste` varchar(20) NOT NULL,
  `religion` varchar(20) NOT NULL,
  `nation` varchar(20) NOT NULL,
  `tem_addr` varchar(200) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `image` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`user_id`, `name`, `add`, `phno`, `email`, `user_status`, `log_id`, `l_name`, `f_name`, `m_name`, `caste`, `religion`, `nation`, `tem_addr`, `dob`, `image`) VALUES
(37, 'ardra', 'tttt', '1234567890', 'aa@gmail.com', 'Approved', 59, 'anil', 'anil', 'bindhu', 'nair', 'hindhu', 'indian', 'tvm', '1992-02-04', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `state_id` int(5) NOT NULL,
  `state` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`state_id`, `state`) VALUES
(38, 'Kerala');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `analyzer`
--
ALTER TABLE `analyzer`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `c_register`
--
ALTER TABLE `c_register`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`dist_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feed_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`l_id`);

--
-- Indexes for table `locationmapper`
--
ALTER TABLE `locationmapper`
  ADD PRIMARY KEY (`lo_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`state_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `analyzer`
--
ALTER TABLE `analyzer`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `c_register`
--
ALTER TABLE `c_register`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `dist_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `locationmapper`
--
ALTER TABLE `locationmapper`
  MODIFY `lo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `state_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
