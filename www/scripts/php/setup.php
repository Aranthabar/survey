<?php

# Establish the database connection
include("connection.php");

# Include the nessessary functions
# include("getQuestion.php")


# Test for the existance of a state in the cookies
# If one does not exist, create a default set of
# cookies

if(!array_key_exists("project", $_COOKIE)) {
	setcookie("project", "-1");
	setcookie("question", "-1");
}

?>