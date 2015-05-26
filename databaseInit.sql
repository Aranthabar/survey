-- ----------------------------------------
-- Genearte the Nessessary database
-- ----------------------------------------

-- DROP DATABASE `pdsurveys` IF EXISTS (SELECT name FROM sys.databases WHERE name = 'pdsurveys')
-- CREATE DATABASE `pdsurveys`;
-- USE `pdsurveys`;

-- ----------------------------------------
-- Genearte the Nessessary table structure
-- ----------------------------------------

-- This table holds the different programs that are available
DROP TABLE IF EXISTS `programs`;
CREATE TABLE IF NOT EXISTS `programs` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- This table hold the information on the different surveys
DROP TABLE IF EXISTS `survey`;
CREATE TABLE IF NOT EXISTS `survey` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `year` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- This table holds each of the questions in the survey (not the answers)
DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `label` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- This table hold each of the question options
DROP TABLE IF EXISTS `questions_options`;
CREATE TABLE IF NOT EXISTS `questions_options` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `questionid` mediumint(9) NOT NULL,
  `headwaterid` varchar(10),
  `order` mediumint(2) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- This table holds the order of questions for each survey
DROP TABLE IF EXISTS `roadmap`;
CREATE TABLE IF NOT EXISTS `roadmap` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `surveyid` mediumint(9) NOT NULL,
  `questionid` mediumint(9) NOT NULL,
  `answerid` mediumint(9),
  `next` mediumint(9),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


-- This table holds all of the answers to the survey
DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `surveyid` mediumint(9) NOT NULL,
  `programid` mediumint(9) NOT NULL,
  `questionid` mediumint(9) NOT NULL,
  `headwaterid` varchar(100) NOT NULL,
  `headwaterindex` varchar(100) NOT NULL,
  `date` Datetime NOT NULL,
  `value` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

