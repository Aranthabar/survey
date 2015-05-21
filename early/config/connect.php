<?php

DEFINE ("DB_HOST", "localhost");
DEFINE ("DB_USER", "idolsoft_acb");
DEFINE ("DB_PASSWORD", "Marmot32");
DEFINE ("DB_NAME", "idolsoft_db1");

$dbc = @mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) OR die ("Could not connect to the database because: " . mysqli_connect_error() );

?>