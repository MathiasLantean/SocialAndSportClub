-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 09, 2019 at 03:43 PM
-- Server version: 5.5.43
-- PHP Version: 5.4.4-14+deb7u5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `club`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` mediumtext,
  `photo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `name`, `description`, `photo`) VALUES
(1, 'Futbol', 'Football is a family of team sports that involve, to varying degrees, kicking a ball to score a goal. Unqualified, the word football is understood to refer to whichever form of football is the most popular in the regional context in which the word appears. Sports commonly called football in certain places include association football (known as soccer in some countries); gridiron football (specifically American football or Canadian football); Australian rules football; rugby football (either rugby league or rugby union); and Gaelic football.', './templates/img/football.jpeg'),
(2, 'Casin', 'Cue sports (sometimes written cuesports), also known as billiard sports, are a wide variety of games of skill generally played with a cue stick, which is used to strike billiard balls and thereby cause them to move around a cloth-covered billiards table bounded by elastic bumpers known as cushions.', './templates/img/casin.jpg'),
(3, 'Bochas', 'Bochas is a ball sport belonging to the boules family, closely related to British bowls and French pétanque, with a common ancestry from ancient games played in the Roman Empire. Developed into its present form in Italy[6] (where it is called bocce, the plural of the Italian word boccia which means ''bowl'' in the sport sense),[7] it is played around Europe and also in overseas areas that have received Italian migrants, including Australia, North America, and South America.', './templates/img/bochas.jpg'),
(4, 'Truco', 'Truco is a variant of Truc and a popular trick-taking card game originally from Valencia and Balearic Islands (Spain) and played specially in the Southern Cone in Brazil, Argentina, Uruguay, Italy (in Piemonte, in Lomellina, and a particular variant in the towns Porto San Giorgio, Sirolo, Numana, Porto Recanati, Potenza Picena (Marche) and Paulilatino (Sardegna) ), Paraguay, southern Chile and Venezuela. It is played using a Spanish deck, by two, four or six players, divided into two teams.', './templates/img/truco.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE IF NOT EXISTS `enroll` (
  `user` int(11) NOT NULL DEFAULT '0',
  `activity` int(11) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user`,`activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`user`, `activity`, `date`) VALUES
(115, 1, '2019-03-09 15:37:13'),
(115, 2, '2019-03-09 15:38:44'),
(116, 1, '2019-03-09 15:37:13'),
(116, 2, '2019-03-09 15:38:44'),
(117, 1, '2019-03-09 15:37:13'),
(117, 2, '2019-03-09 15:38:44'),
(118, 1, '2019-03-09 15:37:13'),
(118, 2, '2019-03-09 15:38:44'),
(119, 1, '2019-03-09 15:37:13'),
(119, 2, '2019-03-09 15:38:44'),
(120, 1, '2019-03-09 15:37:13'),
(120, 2, '2019-03-09 15:38:44'),
(121, 1, '2019-03-09 15:37:13'),
(121, 2, '2019-03-09 15:38:44'),
(122, 1, '2019-03-09 15:37:13'),
(122, 2, '2019-03-09 15:38:44'),
(123, 1, '2019-03-09 15:37:13'),
(123, 2, '2019-03-09 15:38:44'),
(124, 1, '2019-03-09 15:37:13'),
(124, 2, '2019-03-09 15:38:44'),
(125, 1, '2019-03-09 15:37:13'),
(125, 2, '2019-03-09 15:38:44'),
(126, 1, '2019-03-09 15:37:13'),
(126, 2, '2019-03-09 15:38:44'),
(127, 1, '2019-03-09 15:37:13'),
(127, 2, '2019-03-09 15:38:44'),
(128, 1, '2019-03-09 15:37:13'),
(128, 2, '2019-03-09 15:38:44'),
(129, 1, '2019-03-09 15:37:13'),
(129, 2, '2019-03-09 15:38:44'),
(130, 1, '2019-03-09 15:37:13'),
(130, 2, '2019-03-09 15:38:44'),
(131, 1, '2019-03-09 15:37:13'),
(131, 2, '2019-03-09 15:38:44'),
(132, 1, '2019-03-09 15:37:13'),
(132, 2, '2019-03-09 15:38:44'),
(133, 1, '2019-03-09 15:37:13'),
(133, 2, '2019-03-09 15:38:44'),
(134, 1, '2019-03-09 15:37:13'),
(134, 2, '2019-03-09 15:38:44'),
(135, 1, '2019-03-09 15:37:13'),
(135, 2, '2019-03-09 15:38:44'),
(136, 1, '2019-03-09 15:38:44'),
(136, 2, '2019-03-09 15:37:13'),
(137, 1, '2019-03-09 15:38:44'),
(137, 2, '2019-03-09 15:37:13'),
(138, 1, '2019-03-09 15:38:44'),
(138, 2, '2019-03-09 15:37:13'),
(139, 1, '2019-03-09 15:38:44'),
(139, 2, '2019-03-09 15:37:13'),
(140, 1, '2019-03-09 15:38:44'),
(140, 2, '2019-03-09 15:37:13'),
(141, 1, '2019-03-09 15:38:44'),
(141, 2, '2019-03-09 15:37:13'),
(142, 1, '2019-03-09 15:38:44'),
(142, 2, '2019-03-09 15:37:13'),
(143, 1, '2019-03-09 15:38:45'),
(143, 2, '2019-03-09 15:37:13'),
(144, 1, '2019-03-09 15:38:45'),
(144, 2, '2019-03-09 15:37:13'),
(145, 1, '2019-03-09 15:38:45'),
(145, 2, '2019-03-09 15:37:13'),
(146, 1, '2019-03-09 15:38:45'),
(146, 2, '2019-03-09 15:37:13'),
(147, 1, '2019-03-09 15:38:45'),
(147, 2, '2019-03-09 15:37:13'),
(148, 1, '2019-03-09 15:38:45'),
(148, 2, '2019-03-09 15:37:13'),
(149, 1, '2019-03-09 15:38:45'),
(149, 2, '2019-03-09 15:37:13'),
(150, 1, '2019-03-09 15:38:45'),
(150, 2, '2019-03-09 15:37:13'),
(151, 1, '2019-03-09 15:38:45'),
(151, 2, '2019-03-09 15:37:13'),
(152, 1, '2019-03-09 15:38:45'),
(152, 2, '2019-03-09 15:37:13'),
(153, 1, '2019-03-09 15:38:45'),
(153, 2, '2019-03-09 15:37:13'),
(154, 1, '2019-03-09 15:38:45'),
(154, 2, '2019-03-09 15:37:13'),
(155, 1, '2019-03-09 15:38:45'),
(155, 2, '2019-03-09 15:37:13'),
(156, 1, '2019-03-09 15:38:45'),
(156, 2, '2019-03-09 15:37:13'),
(157, 3, '2019-03-09 15:37:13'),
(158, 3, '2019-03-09 15:37:13'),
(159, 3, '2019-03-09 15:37:13'),
(160, 3, '2019-03-09 15:37:13'),
(161, 3, '2019-03-09 15:37:13'),
(162, 3, '2019-03-09 15:37:13'),
(163, 3, '2019-03-09 15:37:13'),
(164, 3, '2019-03-09 15:37:13'),
(165, 3, '2019-03-09 15:37:13'),
(166, 3, '2019-03-09 15:37:13'),
(167, 3, '2019-03-09 15:37:13'),
(168, 3, '2019-03-09 15:37:13'),
(169, 3, '2019-03-09 15:37:13'),
(170, 3, '2019-03-09 15:37:13'),
(171, 3, '2019-03-09 15:37:13'),
(172, 3, '2019-03-09 15:37:13'),
(173, 3, '2019-03-09 15:37:13'),
(174, 3, '2019-03-09 15:37:13'),
(175, 3, '2019-03-09 15:37:13'),
(176, 3, '2019-03-09 15:37:13'),
(177, 3, '2019-03-09 15:37:13'),
(178, 3, '2019-03-09 15:37:13'),
(179, 4, '2019-03-09 15:37:13'),
(180, 4, '2019-03-09 15:37:13'),
(181, 4, '2019-03-09 15:37:13'),
(182, 4, '2019-03-09 15:37:13'),
(183, 4, '2019-03-09 15:37:13'),
(184, 4, '2019-03-09 15:37:13'),
(185, 4, '2019-03-09 15:37:13'),
(186, 4, '2019-03-09 15:37:13'),
(187, 4, '2019-03-09 15:37:13'),
(188, 4, '2019-03-09 15:37:13'),
(189, 4, '2019-03-09 15:37:13'),
(190, 4, '2019-03-09 15:37:13'),
(191, 4, '2019-03-09 15:37:13'),
(192, 4, '2019-03-09 15:37:13'),
(193, 4, '2019-03-09 15:37:13'),
(194, 4, '2019-03-09 15:37:13'),
(195, 4, '2019-03-09 15:37:13'),
(196, 4, '2019-03-09 15:37:13'),
(197, 4, '2019-03-09 15:37:13'),
(198, 4, '2019-03-09 15:37:13'),
(199, 4, '2019-03-09 15:37:13');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `DOB` date DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `token` varchar(32) DEFAULT NULL,
  `user_type` varchar(14) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=215 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `DOB`, `phone`, `address`, `email`, `photo`, `password`, `token`, `user_type`) VALUES
(114, 'Mathias', 'Lantean', '1994-03-07', 98774807, 'Rivera 3085', 'mathias@lantean', 'templates/img/uploaded/mathias.jpg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'admin'),
(115, 'Test1', 'Test1', '1994-03-07', 12341, 'address user test 1', 'test1@test1', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(116, 'Test2', 'Test2', '1994-03-07', 12342, 'address user test 2', 'test2@test2', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(117, 'Test3', 'Test3', '1994-03-07', 12343, 'address user test 3', 'test3@test3', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(118, 'Test4', 'Test4', '1994-03-07', 12344, 'address user test 4', 'test4@test4', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(119, 'Test5', 'Test5', '1994-03-07', 12345, 'address user test 5', 'test5@test5', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(120, 'Test6', 'Test6', '1994-03-07', 12346, 'address user test 6', 'test6@test6', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(121, 'Test7', 'Test7', '1994-03-07', 12347, 'address user test 7', 'test7@test7', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(122, 'Test8', 'Test8', '1994-03-07', 12348, 'address user test 8', 'test8@test8', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(123, 'Test9', 'Test9', '1994-03-07', 12349, 'address user test 9', 'test9@test9', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(124, 'Test10', 'Test10', '1994-03-07', 123410, 'address user test 10', 'test10@test10', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(125, 'Test11', 'Test11', '1994-03-07', 123411, 'address user test 11', 'test11@test11', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(126, 'Test12', 'Test12', '1994-03-07', 123412, 'address user test 12', 'test12@test12', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(127, 'Test13', 'Test13', '1994-03-07', 123413, 'address user test 13', 'test13@test13', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(128, 'Test14', 'Test14', '1994-03-07', 123414, 'address user test 14', 'test14@test14', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(129, 'Test15', 'Test15', '1994-03-07', 123415, 'address user test 15', 'test15@test15', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(130, 'Test16', 'Test16', '1994-03-07', 123416, 'address user test 16', 'test16@test16', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(131, 'Test17', 'Test17', '1994-03-07', 123417, 'address user test 17', 'test17@test17', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(132, 'Test18', 'Test18', '1994-03-07', 123418, 'address user test 18', 'test18@test18', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(133, 'Test19', 'Test19', '1994-03-07', 123419, 'address user test 19', 'test19@test19', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(134, 'Test20', 'Test20', '1994-03-07', 123420, 'address user test 20', 'test20@test20', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(135, 'Test21', 'Test21', '1994-03-07', 123421, 'address user test 21', 'test21@test21', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(136, 'Test22', 'Test22', '1994-03-07', 123422, 'address user test 22', 'test22@test22', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(137, 'Test23', 'Test23', '1994-03-07', 123423, 'address user test 23', 'test23@test23', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(138, 'Test24', 'Test24', '1994-03-07', 123424, 'address user test 24', 'test24@test24', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(139, 'Test25', 'Test25', '1994-03-07', 123425, 'address user test 25', 'test25@test25', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(140, 'Test26', 'Test26', '1994-03-07', 123426, 'address user test 26', 'test26@test26', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(141, 'Test27', 'Test27', '1994-03-07', 123427, 'address user test 27', 'test27@test27', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(142, 'Test28', 'Test28', '1994-03-07', 123428, 'address user test 28', 'test28@test28', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(143, 'Test29', 'Test29', '1994-03-07', 123429, 'address user test 29', 'test29@test29', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(144, 'Test30', 'Test30', '1994-03-07', 123430, 'address user test 30', 'test30@test30', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(145, 'Test31', 'Test31', '1994-03-07', 123431, 'address user test 31', 'test31@test31', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(146, 'Test32', 'Test32', '1994-03-07', 123432, 'address user test 32', 'test32@test32', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(147, 'Test33', 'Test33', '1994-03-07', 123433, 'address user test 33', 'test33@test33', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(148, 'Test34', 'Test34', '1994-03-07', 123434, 'address user test 34', 'test34@test34', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(149, 'Test35', 'Test35', '1994-03-07', 123435, 'address user test 35', 'test35@test35', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(150, 'Test36', 'Test36', '1994-03-07', 123436, 'address user test 36', 'test36@test36', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(151, 'Test37', 'Test37', '1994-03-07', 123437, 'address user test 37', 'test37@test37', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(152, 'Test38', 'Test38', '1994-03-07', 123438, 'address user test 38', 'test38@test38', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(153, 'Test39', 'Test39', '1994-03-07', 123439, 'address user test 39', 'test39@test39', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(154, 'Test40', 'Test40', '1994-03-07', 123440, 'address user test 40', 'test40@test40', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(155, 'Test41', 'Test41', '1994-03-07', 123441, 'address user test 41', 'test41@test41', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(156, 'Test42', 'Test42', '1994-03-07', 123442, 'address user test 42', 'test42@test42', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(157, 'Test43', 'Test43', '1994-03-07', 123443, 'address user test 43', 'test43@test43', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(158, 'Test44', 'Test44', '1994-03-07', 123444, 'address user test 44', 'test44@test44', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(159, 'Test45', 'Test45', '1994-03-07', 123445, 'address user test 45', 'test45@test45', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(160, 'Test46', 'Test46', '1994-03-07', 123446, 'address user test 46', 'test46@test46', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(161, 'Test47', 'Test47', '1994-03-07', 123447, 'address user test 47', 'test47@test47', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(162, 'Test48', 'Test48', '1994-03-07', 123448, 'address user test 48', 'test48@test48', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(163, 'Test49', 'Test49', '1994-03-07', 123449, 'address user test 49', 'test49@test49', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(164, 'Test50', 'Test50', '1994-03-07', 123450, 'address user test 50', 'test50@test50', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(165, 'Test51', 'Test51', '1994-03-07', 123451, 'address user test 51', 'test51@test51', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(166, 'Test52', 'Test52', '1994-03-07', 123452, 'address user test 52', 'test52@test52', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(167, 'Test53', 'Test53', '1994-03-07', 123453, 'address user test 53', 'test53@test53', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(168, 'Test54', 'Test54', '1994-03-07', 123454, 'address user test 54', 'test54@test54', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(169, 'Test55', 'Test55', '1994-03-07', 123455, 'address user test 55', 'test55@test55', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(170, 'Test56', 'Test56', '1994-03-07', 123456, 'address user test 56', 'test56@test56', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(171, 'Test57', 'Test57', '1994-03-07', 123457, 'address user test 57', 'test57@test57', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(172, 'Test58', 'Test58', '1994-03-07', 123458, 'address user test 58', 'test58@test58', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(173, 'Test59', 'Test59', '1994-03-07', 123459, 'address user test 59', 'test59@test59', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(174, 'Test60', 'Test60', '1994-03-07', 123460, 'address user test 60', 'test60@test60', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(175, 'Test61', 'Test61', '1994-03-07', 123461, 'address user test 61', 'test61@test61', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(176, 'Test62', 'Test62', '1994-03-07', 123462, 'address user test 62', 'test62@test62', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(177, 'Test63', 'Test63', '1994-03-07', 123463, 'address user test 63', 'test63@test63', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(178, 'Test64', 'Test64', '1994-03-07', 123464, 'address user test 64', 'test64@test64', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(179, 'Test65', 'Test65', '1994-03-08', 123465, 'address user test 65', 'test65@test65', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(180, 'Test66', 'Test66', '1994-03-07', 123466, 'address user test 66', 'test66@test66', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(181, 'Test67', 'Test67', '1994-03-07', 123467, 'address user test 67', 'test67@test67', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(182, 'Test68', 'Test68', '1994-03-07', 123468, 'address user test 68', 'test68@test68', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(183, 'Test69', 'Test69', '1994-03-07', 123469, 'address user test 69', 'test69@test69', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(184, 'Test70', 'Test70', '1994-03-07', 123470, 'address user test 70', 'test70@test70', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(185, 'Test71', 'Test71', '1994-03-07', 123471, 'address user test 71', 'test71@test71', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(186, 'Test72', 'Test72', '1994-03-07', 123472, 'address user test 72', 'test72@test72', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(187, 'Test73', 'Test73', '1994-03-07', 123473, 'address user test 73', 'test73@test73', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(188, 'Test74', 'Test74', '1994-03-07', 123474, 'address user test 74', 'test74@test74', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(189, 'Test75', 'Test75', '1994-03-07', 123475, 'address user test 75', 'test75@test75', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(190, 'Test76', 'Test76', '1994-03-07', 123476, 'address user test 76', 'test76@test76', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(191, 'Test77', 'Test77', '1994-03-07', 123477, 'address user test 77', 'test77@test77', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(192, 'Test78', 'Test78', '1994-03-07', 123478, 'address user test 78', 'test78@test78', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(193, 'Test79', 'Test79', '1994-03-07', 123479, 'address user test 79', 'test79@test79', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(194, 'Test80', 'Test80', '1994-03-07', 123480, 'address user test 80', 'test80@test80', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(195, 'Test81', 'Test81', '1994-03-07', 123481, 'address user test 81', 'test81@test81', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(196, 'Test82', 'Test82', '1994-03-07', 123482, 'address user test 82', 'test82@test82', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(197, 'Test83', 'Test83', '1994-03-07', 123483, 'address user test 83', 'test83@test83', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(198, 'Test84', 'Test84', '1994-03-07', 123484, 'address user test 84', 'test84@test84', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(199, 'Test85', 'Test85', '1994-03-07', 123485, 'address user test 85', 'test85@test85', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(200, 'Test86', 'Test86', '1994-03-07', 123486, 'address user test 86', 'test86@test86', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(201, 'Test87', 'Test87', '1994-03-07', 123487, 'address user test 87', 'test87@test87', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(202, 'Test88', 'Test88', '1994-03-07', 123488, 'address user test 88', 'test88@test88', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(203, 'Test89', 'Test89', '1994-03-07', 123489, 'address user test 89', 'test89@test89', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(204, 'Test90', 'Test90', '1994-03-07', 123490, 'address user test 90', 'test90@test90', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(205, 'Test91', 'Test91', '1994-03-07', 123491, 'address user test 91', 'test91@test91', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(206, 'Test92', 'Test92', '1994-03-07', 123492, 'address user test 92', 'test92@test92', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(207, 'Test93', 'Test93', '1994-03-07', 123493, 'address user test 93', 'test93@test93', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(208, 'Test94', 'Test94', '1994-03-07', 123494, 'address user test 94', 'test94@test94', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(209, 'Test95', 'Test95', '1994-03-07', 123495, 'address user test 95', 'test95@test95', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(210, 'Test96', 'Test96', '1994-03-07', 123496, 'address user test 96', 'test96@test96', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(211, 'Test97', 'Test97', '1994-03-07', 123497, 'address user test 97', 'test97@test97', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(212, 'Test98', 'Test98', '1994-03-07', 123498, 'address user test 98', 'test98@test98', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(213, 'Test99', 'Test99', '1994-03-07', 123499, 'address user test 99', 'test99@test99', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member'),
(214, 'Test100', 'Test100', '1994-03-07', 1234100, 'address user test 100', 'test100@test100', 'templates/img/default.jpeg', '05A671C66AEFEA124CC08B76EA6D30BB', NULL, 'member');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;