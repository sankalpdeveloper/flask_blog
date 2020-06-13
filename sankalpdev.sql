-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2020 at 12:15 PM
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
-- Database: `sankalpdev`
--

-- --------------------------------------------------------

--
-- Table structure for table `contect`
--

CREATE TABLE `contect` (
  `srn` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(15) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contect`
--

INSERT INTO `contect` (`srn`, `name`, `email`, `phone_num`, `msg`, `date`) VALUES
(32, 'Sankalp Choudhary', 'sankalpchoudhary455@gmail.com', '9549736263', 'xcde', '2020-06-06 14:56:46'),
(33, 'Sankalp Choudhary', 'sankalpchoudhary8@gmail.com', '9549736263', 'hello', '2020-06-06 14:59:56'),
(34, 'Sankalp Choudhary', 'sankalpchoudhary8@gmail.com', '9549736263', 'hello', '2020-06-06 15:01:18'),
(35, 'Sankalp Choudhary', 'sankalpchoudhary8@gmail.com', '9549736263', 'hello', '2020-06-06 15:02:31'),
(36, 'Sankalp Choudhary', 'sankalpchoudhary8@gmail.com', '9549736263', 'hello', '2020-06-06 15:02:57'),
(37, 'Sankalp Choudhary', 'sankalpchoudhary8@gmail.com', '9549736263', 'hello', '2020-06-06 15:04:00'),
(38, '?????? ?????', 'sankalpchoudhary8@gmail.com', '+919549736263', 'Hello THERE\r\n', '2020-06-12 10:52:52'),
(39, '?????? ?????', 'sankalpchoudhary8@gmail.com', '+919549736263', 'Hello THERE\r\n', '2020-06-12 10:53:11'),
(40, '?????? ?????', 'sankalpchoudhary8@gmail.com', '+919549736263', 'Hello THERE\r\n', '2020-06-12 10:54:28'),
(41, 'Sankalp Choudhary', 'sankalpchoudhary8@gmail.com', '+919549736263', 'Hello THERE\r\n', '2020-06-12 10:54:45'),
(42, '?????? ?????', 'sankalpchoudhary8@gmail.com', '+919549736263', 'Hey Sankalp', '2020-06-12 16:26:25'),
(43, '?????? ?????', 'sankalpchoudhary8@gmail.com', '+919549736263', 'Hey Sankalp', '2020-06-12 16:27:04'),
(44, 'Falguni', 'fal@gmail.com', '95497346477', 'hey sankalp', '2020-06-12 16:28:41'),
(45, 'Falguni', 'fal@gmail.com', '95497346477', 'hey sankalp', '2020-06-12 16:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `srn` int(11) NOT NULL,
  `title` text NOT NULL,
  `tag_line` text NOT NULL,
  `slug` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `img_file` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`srn`, `title`, `tag_line`, `slug`, `content`, `date`, `img_file`) VALUES
(1, 'This is First Post Title', 'this is first post', 'first', 'this is my first post and i copy cat by codewithharry', '2020-06-06 15:15:41', 'post-bg.jpg'),
(2, 'This is Secound Post Title', 'this is Secound post', 'secound', 'this is my Secoundt post and i copy cat by codewithharry', '2020-06-06 15:15:41', 'post-bg.jpg'),
(3, 'This is third Post Title', 'this is third post', 'third', 'this is my third post and i copy cat by codewithharry', '2020-06-06 15:15:41', 'post-bg.jpg'),
(4, 'This is Fourth Post Title', 'this is fourth post', 'fourth', 'this is my fourth post and i copy cat by codewithharry', '2020-06-06 15:15:41', 'post-bg.jpg'),
(5, 'This is Fifth Post Title', 'this is fifth post', 'fifth', 'this is my fifth post and i copy cat by codewithharry', '2020-06-06 15:15:41', 'post-bg.jpg'),
(6, 'This is Sixth Post Title', 'this is sixth post', 'sixth', 'this is my sixth post and i copy cat by codewithharry', '2020-06-06 15:15:41', 'post-bg.jpg'),
(7, 'This is seventh Post Title', 'seventh post', 'seventh', 'this is my seventh post and i copy cat by codewithha..', '2020-06-13 13:00:08', 'post.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contect`
--
ALTER TABLE `contect`
  ADD PRIMARY KEY (`srn`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`srn`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contect`
--
ALTER TABLE `contect`
  MODIFY `srn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `srn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
