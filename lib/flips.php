<?php
/*functions that are specific to flip application only. FSU001 Subject Lists*/
function sub_list($cat){
	$query = select_row_with_onefield(FLIPSUBS,'category',$cat);
	echo '<select name="sub" id="sub" style="width:150px">
			<option value="">Select Subject</option>';
	if(countrows($query) > 0){
		while($list = mysql_fetch_array($query)){
			echo '<option value="'.$list['sub_id'].'"> '.$list['subject'].'</option>';
		}
	}else{
		echo  '	<option value="">Select Subject</option>
					<option value="000">Basic Tech</option>';
	}
	echo '</select>';
}
function topics($lev){
	 $query = select_row_with_onefield(FLIPMATS,'category', $lev);
	 if(countrows($query) > 0){
		 echo '<select name="topic" id="topic_list">';
		 while($list = mysql_fetch_array($query)){
			echo '<option value="'.$list['topic_id'].'"> '.$list['topic'].'</option>';
		}
		echo '</select>';
		}else{
			return  '	No Topic Uploaded Yet';
		}
	}
?>