<?php
include('lib/session.php');
include('lib/functions.php');

	  if(isset($_GET['cmd']) && $_GET['cmd'] == 'login'){
		  $rets = array('succ'=> false, 'mssg'=>'');
		  //Array ( [usrname] => koldaf20@gmail.com [psw] => bingoo [remember] => r [login] => ) 
		  $username = prepsql($_POST['usrname']);
		  $pass = prepsql($_POST['psw']);
		  //$pass = md5(en_crypt($pass));
		  if(null($username) || null($pass)){
			  $rets['mssg'] = '<div class="alert alert-danger">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
									<strong>Error!</strong> Please Complete all the fields.
								</div>'; //complete all fields
		  }else if(!email_is_valid($username)){
			  $rets['mssg'] = '<div class="alert alert-danger">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
									<strong>Error!</strong> Invalid Email.
								</div>'; //Invalid Email
		  }else{
			  $pass = en_crypt($pass);
			  //check login
			  $check = $con->query("SELECT email, password, status FROM users WHERE email = '".$username."' 
									AND password = '".$pass."' AND status = 'active'");
			  //$check = select_row_with_twofields('users','email',$username,'password',$pass);
			  if(countrows($check) > 0){
				  $rets['succ'] = true;
				  $_SESSION['user'] = $username;
			
			  }else{
				  $rets['mssg'] ='<div class="alert alert-danger">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
									<strong>Error!</strong> Email and Password not matched
								</div>'; //username password not matched 
			  }
		  }
		  echo json_encode($rets);
	  }
	if(isset($_GET['cmd']) && $_GET['cmd'] == 'apply'){
		  $rets = array('succ'=> false, 'mssg'=>'');
		  //[sname] => Koledafe [oname] => Abiodun[phone] => 07063094805[email] => koldaf20@gmail.com
		  $sname = prepsql($_POST['sname']);
		  $oname = prepsql($_POST['oname']);
		  $phone = prepsql($_POST['phone']);
		  $email = prepsql($_POST['email']);
		  $centre = prepsql($_POST['center']);
		  $sess  = set_val('session');
		  //$pass = md5(en_crypt($pass));
		  if(null($sname) || null($oname) || null($phone)){
			  $rets['mssg'] = '<div class="alert alert-danger">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
									<strong>Error!</strong> Please Complete all the fields.
								</div>'; //complete all fields
		  }else if(!email_is_valid($email)){
			  $rets['mssg'] = '<div class="alert alert-danger">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
									<strong>Error!</strong> Invalid Email.
								</div>'; //Invalid Email
		  }else if(!is_numeric($phone)){
			  $rets['mssg'] = '<div class="alert alert-danger">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
									<strong>Error!</strong> Invalid Phone number.
								</div>'; //invalid phone number
		  }else{
			  //check application with phone number and surname
			  $check = select_row_with_twofields('application_dummy','surname',$sname,'phone',$phone);
			  if(countrows($check) > 0){
				  $rets['succ'] = true;
				  $rets['mssg'] = '001'; //already submitted... 
				  $det = $check->fetch_array();
				  $rets['d'] =time();
			
			  }else{
				  $regno = autogen_onefield('application_dummy', 'session', $session,'IJMB/'.$session.'/');
				  $insert = $con->query("INSERT INTO application_dummy (surname, othernames, phone, centre, email, datetime,session,regno) VALUES ('".$sname."','".$oname."', '".$phone."','".$centre."', '".$email."', NOW(), '".$sess."','".$regno."')");
				  if($insert){
					  $text =  'Dear '.$sname.', ur application was successful,Kindly make a payment of 8,000 at any branch of SterlinBank Acct. No: 0067930185. AcctName: Achivers Thrones';
					  $html = '<p>
					  	Dear '.$sname.', <br/>
					  	Your application was successful, Kindly make a payment of 8,000 for your form registration processing at any branch of Sterlin Bank PLC. <br/>
						<strong>Acct. No:</strong> 0067930185.<br/> 
						<strong>AcctName:</strong> Achivers Thrones<br/>
						<hr/>
						<h3>Follow these stages for your form processing</h3>
						<ol>
							<li><a href="https://schoolsearch.org.ng/download.php">Download the form here</a> </li>
							<li>Complete the form appropriately </li>
							<li>Send a Scan copy to <a href="mailto:admissions@schoolsearch.org.ng"> admissions@schoolsearch.org.ng</a> </li>
							<li>An acknowledgement email would be sent to you.</li>
						</ol>
						
						Thank You <br>
						<strong>schoolsearch.ORG.NG</strong>
						</p>';
					  mailers($email, $sname.' '.$oname, 'IJMB OFFICE- FORM', $html, $text);
					  $rets['succ'] = true;
					  $rets['mssg'] = '002';
					  smsalert($text, $phone);
				  }else{
					  $rets['mssg'] ='<div class="alert alert-danger">
									<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
									<strong>Error!</strong> Application not accepted, please try again...
								</div>'; //username password not matched 
				  }
				  
			  }
		  }
		  echo json_encode($rets);
	  }
	  if(isset($_GET['cmd']) && $_GET['cmd'] == 'journal-login'){
		 $email = prepsql($_POST['usrname']);
		 $pass = prepsql($_POST['psw']);
		 $rets = array("mssg"=>"", "success"=>false);
		 if(null($email) || null($pass)){
			 $rets['mssg'] = "Complete all fields"; //complete all fields::
		 }else{
			 $check = select_row_with_twofields('journal_user','email',$email,'password',en_crypt($pass));
			 if(countrows($check) > 0){
				 $rets['success'] = true;
				 $_SESSION['user'] = $email;
				 $rets['goto'] = "user.php";
			 }else{
				 $rets['mssg'] = "Invalid Login Parameters"; //invalid username and password
				 $rets['error'] = $con->error;
			 }
		 }
		  echo json_encode($rets);//print_r($_REQUEST);
	  }
	  
	  if(isset($_GET['cmd']) && isset($_GET['type']) && $_GET['cmd'] == 'c-login' && $_GET['type'] == 'conference'){
		  $rets = array('succ'=> false, 'mssg'=>'');
		  $pass = prepsql($_POST['pass']);
		  $email = prepsql($_POST['email']);
		  if(!null($pass) && !null($email)){
			  $pass = en_crypt($pass);
			  $check = select_row_with_twofields('member_tbl','email',$email,'password',$pass);
			  if(countrows($check) > 0){
				  //valid username and Password
				  $dets = $check->fetch_array();
				  //copy id into conference table
				  //Generate conference ID
				  //$conf_id = autogen('conference_tbl',
				  $insert = $con->query("INSERT INTO conference_tbl (id, status) VALUES ('".$dets['member_id']."','member')");
				  if($insert){
					  //proceed to nextlevel
					  $rets['succ'] = true;
					  $rets['mssg'] = en_crypt($dets['member_id']);
					  $oname = $dets['middlename'].' '.$dets['othername'];
					  $name = $dets['title'].' '.strtoupper($dets['surname']).', '.shorten($oname);
					  $rets['name'] = en_crypt($name);
				  }else{
					  $rets['mssg'] = '<div class="alert alert-danger">
											<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
											<strong>Error!</strong> Please Try Again Later...
										</div>' ;
				  }
			  }else{
				   $rets['mssg'] = '<div class="alert alert-danger">
											<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
											<strong>Error!</strong> Incorrect Email and/or Password...
										</div>' ;
			  }
		  }else{
			   $rets['mssg'] = '<div class="alert alert-danger">
											<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
											<strong>Error!</strong> Complete all fields and try again...
										</div>' ;
		  }
		  //cmd=login&type=conference
		  echo json_encode($rets);
	  }
	  //login.php?cmd=c-reg&type=conference
	  if(isset($_GET['cmd']) && isset($_GET['type']) && $_GET['cmd'] == 'c-reg' && $_GET['type'] == 'conference'){
		  $rets = array('succ'=> false, 'mssg'=>'');
		  $title = prepsql($_POST['title']);
		  $sname = prepsql($_POST['sname']);
		  $mname = prepsql($_POST['mname']);
		  $oname = prepsql($_POST['oname']);
		  $sex = prepsql($_POST['sex']);
		  $email = prepsql($_POST['email']);
		  $phone = prepsql($_POST['phone']);
		  $country = prepsql($_POST['country']);
		  if(null($title) || null($sname) || null($oname) || null($sex) || null($email) || null($phone) || null($country)){
			  $rets['mssg'] = '<div class="alert alert-danger">
								  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
								  <strong>Error!</strong> Complete all fields and try again...
							  </div>' ;
		  }else{
			  //check availability
			  $check = select_row_with_onefield('conference_adhoc_tbl','email',$email);
			  if(countrows($check) > 0){
				$dets = $check->fetch_array();
				$track = select_row_with_onefield('conference_category_track_registration','id',$dets['id']);
				$name = $title.' '.strtoupper($sname).', '.shorten($oname);
				if(countrows($track) > 0){
					//check for stage 3 --payment
					$payment = select_row_with_onefield('payment_processing','user_id',$dets['id']);
					$pid = $payment->fetch_array();
					if(validate_payment($pid['transaction_id'])){
						$rets['mssg'] = '<div class="alert alert-success">
											<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
											<strong>Error!</strong> You have already registered for the conference
									</div>' ;
					}else{
						//go to stage 3 -- payment
						//redirect('conference.php?d='.$_GET['d'].'&p='.$_GET['p'].'&stage=stage3&pc='.$pc.'&tid='.$t_id);
						$rets['succ'] = true;
						$rets['mssg'] = en_crypt($dets['id']);
						$rets['name'] = en_crypt($name);
					  	$rets['next'] = 'stage3';
						$rets['pc'] =  en_crypt($pid['pay_code']);
						$rets['tid'] = en_crypt($pid['transaction_id']);
					}
				}else{
					//continue stage 2
					$rets['succ'] = true;
					$rets['name'] = en_crypt($name);
					$rets['next'] = 'stage2';
					$rets['mssg'] = en_crypt($dets['id']);
				}
			  }else{
				  //generate id
				  $id = autogen('conference_adhoc_tbl','CONF-'.date('Y').'-');
				  //start insertion
				  $insert = "INSERT INTO conference_adhoc_tbl (id, title, surname, middlename, othername, email, phone, country, sex, datetime) ";
				  $insert .=" VALUES('".$id."','".$title."','".$sname."','".$mname."','".$oname."','".$email."','".$phone."','".$country."','".$sex."', NOW()) ";
				  if($con->query($insert)){
					  //proceed to nextlevel
					  $rets['succ'] = true;
					  $rets['mssg'] = en_crypt($id);
					  $oname = $mname.' '.$oname;
					  $name = $title.' '.strtoupper($sname).', '.shorten($oname);
					  $rets['name'] = en_crypt($name);
					  $rets['next'] = 'stage2';
				  }else{
					  $rets['mssg'] = $con->error;
				  }
			  }
		  }
		  echo json_encode($rets);
	  }
?>