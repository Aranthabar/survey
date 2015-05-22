<?php

# In this script we intend to process each of the AJX requests

# The following general steps need to be accomplished
#
# 1. Parse the XML request
# 2. Loop through a switch process the request
# 3. Package the return
#
# The return will be a XML package with the div name for one field and the resulting text for the other

$tmp = json_decode($_POST['dataString']);

$ret = "";

switch($tmp->{"command"}) {
	case 'previous':
		$ret = json_encode(array("text" => "<H2>Hello World (Previous)</H2>"));
		break;
	case 'next':
		$ret = json_encode(array("text" => "<H2>Hello World (Next)</H2>"));
		break;
	case 'home':
		$ret = json_encode(array("text" => "<H2>Hello World (Home)</H2>"));
		break;
	case 'welcome':
		$ret = json_encode(array("text" => "<H2>Hello World (Welcome)</H2>"));
		break;
}

header('Content-Type: application/json');
print($ret)

?>