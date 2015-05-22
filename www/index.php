<?php
include_once("scripts/php/setup.php");
?>

<!DOCTYPE html>
<html>

<!------------------------------------------------------------------------------------------------>
<head>
<meta name="viewport" content="width=device-width, user-scalable=yes,initial-scale=1" charset="UTF-8">
  <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="style.css">
  <title>Problem Discovery Survey</title>
<!------------------------------------------------------------------------------------------------>
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
  <script src="scripts/js/ajax.js"></script>
</head>
<!------------------------------------------------------------------------------------------------>
<body onload="welcome()">

<div data-role="page" id="page1">
  <div data-role="header">
  <h1 style = "white-space:normal;">PROBLEM DISCOVERY IN OPERATIONAL TESTING: DRAFT SURVEY</h1>
  </div>

  <div data-role="main" class="ui-content" id = "main">
  </div><!--end main-->

  <div data-role="footer" data-position="fixed">
    <a href="javascript:previous()" class="ui-btn ui-shadow ui-corner-all ui-icon-arrow-l ui-btn-icon-notext" style = "margin:10px;"></a>
    <a href="javascript:home()" class="ui-btn ui-shadow ui-corner-all ui-icon-home ui-btn-icon-notext" style = "margin:10px;"></a> 
    <a href="javascript:next()" class="ui-btn ui-shadow ui-corner-all ui-icon-arrow-r ui-btn-icon-notext" style = "margin:10px;"></a>
  </div>
</div> 

</body>
</html>