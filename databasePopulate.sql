-- ------------------------------------------------------------------
-- Insert default values into the database for testing and debugging
-- ------------------------------------------------------------------

INSERT INTO `programs` (`id`, `name`) VALUES
	(1, 'Program 1'),
	(2, 'Program 2'),
	(3, 'Program 3');

INSERT INTO `survey` (`id`, `name`, `year`) VALUES
	(1, 'Test Survey', 2015),
	(2, 'Test Survey 2', 2016);

INSERT INTO `questions` (`id`, `type`, `label`) VALUES
	(1, 'radio', 'Does this widget have an OT in year 2010'),
	(2, 'text', 'What was the name of the OT'),
	(3, 'text', 'What is the airspeed of an unlaiden swallow?'),
	(4, 'radio', 'Did the widget have a problem during the OT?'),
	(5, 'text', 'Describe the problem'),
	(6, 'radio', 'Did the manufacture knoww about the problem?'),
	(7, 'text', 'What did the manufacture do?'),
	(8, 'radio', 'Did the testers know about the problem?'),
	(9, 'text', 'What did the testers do?');

INSERT INTO `questions_options` (`id`, `questionid`, `headwaterid`, `order`, `label`) VALUES
	(1, 1, '1_1', 1, 'Yes'),
	(2, 1, NULL, 2, 'No'),
	(3, 4, '4_1', 1, 'Yes'),
	(4, 4, NULL, 2, 'No'),
	(5, 6, '6_1', 1, 'Yes'),
	(6, 6, NULL, 2, 'No'),
	(7, 8, '8_1', 1, 'Yes'),
	(8, 8, NULL, 2, 'No');

INSERT INTO `roadmap` (`id`, `surveyid`, `questionid`, `answerid`, `next`) VALUES
	(1, 1, 1, 1, 2),
	(2, 1, 1, 2, NULL),
	(3, 1, 2, NULL, 3), 
	(4, 1, 3, NULL, 4),
	(5, 1, 4, 3, 5),
	(6, 1, 4, 4, 6),
	(7, 1, 5, NULL, 6),
	(8, 1, 6, 5, 7),
	(9, 1, 6, 6, 8),
	(10, 1, 7, NULL, 8),
	(11, 1, 8, 7, 9),
	(12, 1, 8, 8, 4),
	(13, 1, 9, NULL, 4);
