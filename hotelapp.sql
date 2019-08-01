-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2019 at 06:26 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `country` varchar(255) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`id`, `version`, `phone`, `address`, `city`, `lastname`, `country`, `firstname`, `email`) VALUES
(1, 0, '+65562222', 'rr. Irfan Tomin', 'Tirane', 'Anamali', 'Albania', 'Arinela', 'test@test.com');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `stars` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`id`, `version`, `address`, `stars`, `name`, `city`) VALUES
(1, 0, 'rr. test', 2, 'hotel test', 'tirane');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `check_in` datetime NOT NULL,
  `room_no_id` bigint(20) NOT NULL,
  `resevartion_date` datetime NOT NULL,
  `adults` tinyblob NOT NULL,
  `check_out` datetime NOT NULL,
  `guests_id` bigint(20) NOT NULL,
  `children` tinyblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `version`, `check_in`, `room_no_id`, `resevartion_date`, `adults`, `check_out`, `guests_id`, `children`) VALUES
(1, 0, '2019-08-01 00:00:00', 1, '2019-08-01 00:00:00', 0x32, '2019-08-10 00:00:00', 1, 0x31),
(2, 0, '2019-08-01 00:00:00', 1, '2019-08-01 06:07:34', 0x31, '2019-08-05 00:00:00', 1, 0x31);

-- --------------------------------------------------------

--
-- Table structure for table `roomfeatures`
--

CREATE TABLE `roomfeatures` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `roomfeatures` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roomfeatures`
--

INSERT INTO `roomfeatures` (`id`, `version`, `roomfeatures`) VALUES
(1, 0, 'Bed'),
(2, 0, 'Bed'),
(3, 0, 'Wi-Fi');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `room_no` varchar(255) NOT NULL,
  `roomtype_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `version`, `room_no`, `roomtype_id`, `hotel_id`) VALUES
(1, 0, '100', 1, 1),
(2, 0, '200', 2, 1),
(3, 0, '201', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `roomtype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`id`, `version`, `roomtype`) VALUES
(1, 0, 'Single'),
(2, 0, 'Double');

-- --------------------------------------------------------

--
-- Table structure for table `room_feature_details`
--

CREATE TABLE `room_feature_details` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `roomfeaturesdetail` varchar(255) NOT NULL,
  `roomfeatures_id` bigint(20) NOT NULL,
  `room_no_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_feature_details`
--

INSERT INTO `room_feature_details` (`id`, `version`, `roomfeaturesdetail`, `roomfeatures_id`, `room_no_id`) VALUES
(1, 0, 'detaje 1', 3, 1),
(2, 0, 'detaje 2', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room_feature_details_roomfeatures`
--

CREATE TABLE `room_feature_details_roomfeatures` (
  `room_feature_details_roomfeatures_id` bigint(20) NOT NULL,
  `room_features_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room_feature_details_rooms`
--

CREATE TABLE `room_feature_details_rooms` (
  `room_feature_details_room_no_id` bigint(20) NOT NULL,
  `rooms_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room_roomtype`
--

CREATE TABLE `room_roomtype` (
  `room_roomtype_id` bigint(20) NOT NULL,
  `room_type_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK415m5yyoc8dge5x66sa2b1ot3` (`room_no_id`),
  ADD KEY `FKn6vla5mvhtre5jbx95tiimuqh` (`guests_id`);

--
-- Indexes for table `roomfeatures`
--
ALTER TABLE `roomfeatures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKi4deig29grgi6mj4vj2plhqxu` (`roomtype_id`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_feature_details`
--
ALTER TABLE `room_feature_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4cvrmsp82nhe6i419d7wfg7i8` (`roomfeatures_id`),
  ADD KEY `FK2j807c3o8pw77b51tfkqc98u9` (`room_no_id`);

--
-- Indexes for table `room_feature_details_roomfeatures`
--
ALTER TABLE `room_feature_details_roomfeatures`
  ADD KEY `FK88icxgqcri84aplmjxklud895` (`room_features_id`),
  ADD KEY `FKo5ueqc1whp1q165qhofnynvfu` (`room_feature_details_roomfeatures_id`);

--
-- Indexes for table `room_feature_details_rooms`
--
ALTER TABLE `room_feature_details_rooms`
  ADD KEY `FKftfo2x41ia1oka0iu56p37nhe` (`rooms_id`),
  ADD KEY `FKstdlt0ilm4n49lutsaukqbci1` (`room_feature_details_room_no_id`);

--
-- Indexes for table `room_roomtype`
--
ALTER TABLE `room_roomtype`
  ADD KEY `FKt4s56myrp189kyqv208wd3kbp` (`room_type_id`),
  ADD KEY `FK9i51ge0jeijxigow1aoqhqdwq` (`room_roomtype_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roomfeatures`
--
ALTER TABLE `roomfeatures`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `room_feature_details`
--
ALTER TABLE `room_feature_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK415m5yyoc8dge5x66sa2b1ot3` FOREIGN KEY (`room_no_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `FKn6vla5mvhtre5jbx95tiimuqh` FOREIGN KEY (`guests_id`) REFERENCES `guest` (`id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `FKi4deig29grgi6mj4vj2plhqxu` FOREIGN KEY (`roomtype_id`) REFERENCES `roomtype` (`id`);

--
-- Constraints for table `room_feature_details`
--
ALTER TABLE `room_feature_details`
  ADD CONSTRAINT `FK2j807c3o8pw77b51tfkqc98u9` FOREIGN KEY (`room_no_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `FK4cvrmsp82nhe6i419d7wfg7i8` FOREIGN KEY (`roomfeatures_id`) REFERENCES `roomfeatures` (`id`);

--
-- Constraints for table `room_feature_details_roomfeatures`
--
ALTER TABLE `room_feature_details_roomfeatures`
  ADD CONSTRAINT `FK88icxgqcri84aplmjxklud895` FOREIGN KEY (`room_features_id`) REFERENCES `roomfeatures` (`id`),
  ADD CONSTRAINT `FKo5ueqc1whp1q165qhofnynvfu` FOREIGN KEY (`room_feature_details_roomfeatures_id`) REFERENCES `room_feature_details` (`id`);

--
-- Constraints for table `room_feature_details_rooms`
--
ALTER TABLE `room_feature_details_rooms`
  ADD CONSTRAINT `FKftfo2x41ia1oka0iu56p37nhe` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `FKstdlt0ilm4n49lutsaukqbci1` FOREIGN KEY (`room_feature_details_room_no_id`) REFERENCES `room_feature_details` (`id`);

--
-- Constraints for table `room_roomtype`
--
ALTER TABLE `room_roomtype`
  ADD CONSTRAINT `FK9i51ge0jeijxigow1aoqhqdwq` FOREIGN KEY (`room_roomtype_id`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `FKt4s56myrp189kyqv208wd3kbp` FOREIGN KEY (`room_type_id`) REFERENCES `roomtype` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
