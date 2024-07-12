<?php
include('lib/session.php');
include('lib/functions.php');
//print_r($_GET);
//check if this is an ajax request
	if (!isset($_SERVER['HTTP_X_REQUESTED_WITH'])){
		die();
	}else{
			if(isset($_GET['code'])){
				//<label class="label" for="nat"> Country</label>          
				echo '
					 <div class="form-group">
					 <label class="label" for="state">State</label>
					 <select name="state" id="state"  class="form-control" onChange="callLGA(this.value)">';
				echo '<option value="" selected="selected">Select State</option>';
				echo states();
				echo '</select></div>';
			}
			if(isset($_GET['lga'])){
				echo '<div class="form-group">
						<label class="label" for="lga"> Local Government Area</label>
						<select name="lga" class="form-control" id="lga">';
				echo '<option value="">Select Local Government</option>';
				echo lgass($_GET['lga']);
				echo '</select></div>';
			}
			if(isset($_GET['cmd']) && $_GET['cmd']=='delete'){
				$id = prepsql($_GET['id']);
				$check = select_row_with_twofields('news_tbl', 'ref_id', $id, 'is_deleted', 'false');
				if(countrows($check)>0){
					$delete = $con->query("UPDATE news_tbl SET is_deleted = 'true' WHERE ref_id = '".$id."'");
					if($delete){
						echo 'Entry was successfully Deleted';
					}else{
						echo 'Error deleting entry';
					}
				}else{
					echo 'Item not found...';
				}
			}
			
		//ACTION -> VALIDATE
			if(isset($_GET['cmd']) && $_GET['cmd'] == 'validate'){
				//print_r($_REQUEST);
				$id = prepsql(de_crypt($_GET['id'])); 
				//check if payment had been validated
				$check = select_row_with_twofields('application_dummy', 'ref_id', $id, 'payment_status', 'not validated');
				if(countrows($check) > 0){
					//continue validation
					$validated = $con->query("UPDATE application_dummy SET payment_status = 'validated' WHERE ref_id = '".$id."'");
					if($validated){
						//send sms alert
						$det = $check->fetch_array();
						$text = 'Dear '.$det['surname'].', ur application processing fee was succefully validated. Kindly scan your form to admissions@schoolsearch.org.ng call:07030400348';
						smsalert($text, $det['phone']);
						echo 'SMS was sent';
					}else{
						echo 'There was an error-->'.$con->error;
					}
				}else{
					echo 'Candidate had  already been validated';
				}
			}
		//ACTION -> VALIDATE
			if(isset($_GET['cmd']) && $_GET['cmd'] == 'remind'){
				//print_r($_REQUEST);
				$id = prepsql(de_crypt($_GET['id'])); 
				//check if payment had been validated
				$check = select_row_with_twofields('application_dummy', 'ref_id', $id, 'payment_status', 'not validated');
				if(countrows($check) > 0){
					//continue Sending reminder
					$det = $check->fetch_array();
					$text = 'Dear '.$det['surname'].',This is 2remind U of UR form processing fee. Kindly make a payment of 8,000 at any branch of SterlinBank Acct. No: 0067930185. Acct Name: Achievers Throne';
					smsalert($text, $det['phone']);
					echo 'SMS was sent';
				}else{
					echo 'Candidate had  already been validated, No need for reminder...';
				}
			}
		//ACTION Reminder Email
			if(isset($_GET['cmd']) && $_GET['cmd'] == 'remind_email'){
				//print_r($_REQUEST);
				$id = prepsql(de_crypt($_GET['id'])); 
				//check if payment had been validated
				$check = select_row_with_twofields('application_dummy', 'ref_id', $id, 'payment_status', 'not validated');
				if(countrows($check) > 0){
					//continue Sending reminder
					$det = $check->fetch_array();
					$text = 'Dear '.$det['surname'].',This is 2remind U of UR form processing fee. Kindly make a payment of 8,000 at any bra nch of SterlinBank Acct. No: 0067930185. Acct Name: Achiever Throne';
					$html = 'Dear <strong>'.$det['surname'].'</strong>,
					<p>This is to remind you of your form processing fee. Kindly make a payment of <strong>8,000</strong> at any branch of Sterlin Bank. <br/>
					<strong>Acct. No:</strong> 0067930185. <br/>
					<strong>Acct Name:</strong> IJMB REGISTRATION SCHOOL LINKS. </p>';
					$subject = 'schoolsearch REMINDER';
					mailers($det['email'], $det['surname'], $subject, $html, $text);
					//smsalert($text, $det['phone']);
					echo 'SMS was sent';
				}else{
					echo 'Candidate had  already been validated, No need for reminder...';
				}
			}
		//ACTION -> VALIDATE
			if(isset($_GET['cmd']) && $_GET['cmd'] == 'del'){
				//print_r($_REQUEST);
				$id = prepsql(de_crypt($_GET['id'])); 
				//check if already deleted
				$check = select_row_with_twofields('application_dummy', 'ref_id', $id, 'status', 'active');
				if(countrows($check) > 0){
					//echo countrows($check);
					//continue deleting
					$det = $check->fetch_array();
					$delete = $con->query("UPDATE application_dummy SET status = 'inactive' WHERE ref_id = '".$id."'");
					if($delete){
						echo 'I don delete that yeye guy--'.$det['surname'].' '.$det['othernames'];
					}else{
						echo 'There was an error deleting--' . $con->error;
					}
				}else{
					echo 'I don do am... abi wetin self? ';
				}
			}
	}
?>