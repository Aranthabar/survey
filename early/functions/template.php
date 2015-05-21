<?php

function survey($dbc) {

  if (empty($_POST['qid'])) {
    $qid = 1;
  }

  if($_POST['qid']==1){
    if($_POST['qcolor']=='Red'){
      $qid = 2;
    }
    elseif($_POST['qcolor']=='Green'){
      $qid = 4;
    }
    else{
      $qid = 3;
    }
  } 

  $result = mysqli_query($dbc, "SELECT * FROM questions WHERE question_id = '{$qid}'");
  $q = mysqli_fetch_assoc($result);

  echo '<h2>Question ' . $q['question_id'] . '</h2>';
  echo '<p>' . $q['question_body'] . '</p>';
  echo '<form action="index.php" method="post">';
  echo '<div class="ui-field-contain">';
  echo '<fieldset data-role="controlgroup">';
    
  $a = explode(",",$q['question_label']);
  $a_length = count($a);
	  for($i = 0; $i < $a_length; $i++) {
    	echo '<input type="'.$q['question_type'].'" name="'.$q['question_name'].'" id="'.$q['question_name'].$i.'" value="'.$a[$i].'" checked >'; 
    	echo '<label for="'.$q['question_name'].$i.'">'.$a[$i].'</label>';
    }
    
  echo '</fieldset>';
  echo '</div>';

  echo '<input type="submit" data-inline="true" value="Submit">';
  echo '<input type="hidden" name="qid" value = "1">';
  // echo "  <input type="hidden" name="submitted" value = "1">";
  echo '</form>';

  //echo '<pre>'.print_r($_POST).'</pre>';


}


?>