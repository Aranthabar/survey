-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 21, 2015 at 03:05 PM
-- Server version: 5.5.42-37.1-log
-- PHP Version: 5.4.23

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `idolsoft_db1`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `answer_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `question_id` mediumint(9) NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  `answer_body` mediumtext NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`answer_id`, `question_id`, `user_id`, `answer_body`) VALUES
(1, 1, 1, 'purple'),
(2, 2, 1, 'salamander');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `question_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `question_name` varchar(100) NOT NULL,
  `question_label` varchar(100) NOT NULL,
  `question_type` enum('radio','checkbox','text') NOT NULL,
  `survey_id` mediumint(9) NOT NULL,
  `question_body` mediumtext NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `survey_id` (`survey_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `question_name`, `question_label`, `question_type`, `survey_id`, `question_body`) VALUES
(1, 'qcolor', 'Red,Blue,Green', 'radio', 1, 'What is your favorite color?'),
(2, 'qcolor_red', '', 'text', 1, 'Red? Don''t you think blue is a nicer color than red?'),
(3, 'qcolor_blue', '', 'text', 1, 'Why is blue your favorite color?'),
(4, 'qcolor_green', '', 'text', 1, 'Green?  Maybe you can explain why you chose green:');

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
CREATE TABLE IF NOT EXISTS `survey` (
  `survey_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `survey_name` varchar(300) NOT NULL,
  PRIMARY KEY (`survey_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`survey_id`, `survey_name`) VALUES
(1, 'Example Survey 2015');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(300) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`) VALUES
(1, 'Alex');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
