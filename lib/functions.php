<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require('connect.php');
$dir = ($_SERVER['SERVER_NAME'] == 'localhost')?'..':__DIR__;
//print_r($_SERVER);
require  $dir.'/vendor/autoload.php'; //vendor\autoload.php
global $con;
function redirect($location)
{
	header("Location: {$location}");
	exit;
}
function prepsql($value)
{
	$value = htmlentities($value);
	$value = addslashes($value);
	return $value;
}
function check_password($pwd) 
{
	$strength = array('<strong class="error">Blank</strong>','<stong class="error">Very Weak </strong>','<strong class="warn">Weak</strong>','<strong class="warn"> Medium </strong>','<strong class="done">Strong</strong>','<strong class="done">Very Strong</strong>');
	$score = 1;

	if (strlen($pwd) < 1)
	{
		return $strength[0]; 
	}
	if (strlen($pwd) < 4)
	{
		return $strength[1]; 
	}

	if (strlen($pwd) >= 8)
	{
		$score++; 
	}
	if (strlen($pwd) >= 10)
	{
		$score++; 
	}

	if (preg_match("/[a-z]/", $pwd) && preg_match("/[A-Z]/", $pwd)) 
	{
		$score++; 
	}
	if (preg_match("/[0-9]/", $pwd)) 
	{
		$score++; 
	}
	if (preg_match("/.[!,@,#,$,%,^,&,*,?,_,~,-,£,(,)]/", $pwd)) 
	{
		$score++; 
	}

	return($strength[$score]); 
}
//check timeout...
function check_timeout(){
	  if( isset($_SESSION['last_acted_on']) && (time() - $_SESSION['last_acted_on'] > 60*15) ){
		  session_unset();     // unset $_SESSION variable for the run-time
		  session_destroy();   // destroy session data in storage
		 // header('Location: path/to/login/page');
	  }else{
		  session_regenerate_id(true);
		  $_SESSION['last_acted_on'] = time();
	  }
}
function timeout($start){
	if(isset($start) && (time() - $start > 60*10)){
		unset($start);
	}
}

function email_is_valid($mail) 
{
   return preg_match('/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i',$mail);
}
//url validation and Youtube validation
function _is_youtube($url)
{
  return (preg_match('/youtu\.be/i', $url) || preg_match('/youtube\.com\/watch/i', $url) || preg_match('/youtube\.com\/embed/i', $url));
}
function _youtube_video_id($url)
{
  if(_is_youtube($url))
  {
    $pattern = '/^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/';
    preg_match($pattern, $url, $matches);
    if (count($matches) && strlen($matches[7]) == 11)
    {
      return $matches[7];
    }
  }
 
  return '';
}
function null($input)
{
	if(empty($input) || $input == " " || $input == '<br>'|| $input == '<br />' || $input == '%3Cbr%3E' ){ return true;}
}
function search($tbl, $keyword, $col){
	global $con;
	//SELECT * FROM Persons WHERE City LIKE '%nes%'
	$query = "SELECT * FROM $tbl WHERE $col LIKE '%$keyword%'";
	$result = $con-> query($query); 
		//or die("Error Searching Files: ".mysql_error());
	return $result;
}

//start object oriented 
function select_all($tbl)
{
	global $con;
	$query = "SELECT * FROM $tbl ORDER BY ref_id DESC";
	$result = $con-> query($query);
	//or die("Error Selecting All: ".mysql_error());
	return $result;
}
function autogen($tbl,$prefix)
{
	global $connect;
	$query = select_all($tbl);
	$total = countrows($query);
	$surfix = sprintf("%03d",$total+1);
	$autogen = $prefix.$surfix;
	return $autogen;
}
function autogen_onefield($tbl,$field,$value,$prefix)
{
	global $connect;
	$query = select_row_with_onefield($tbl,$field,$value);
	$total = countrows($query);
	$surfix = sprintf("%03d",$total+1);
	$autogen = $prefix.$surfix;
	return $autogen;
}
function select_row_with_onefield($tbl,$field,$value)
{
	global $con;
	$query = "SELECT * FROM $tbl WHERE $field = '".$value."' ORDER BY ref_id DESC"; 
			//or die;
	$result = $con->query($query) or die('error selecting column'. $con->error);
	return $result;
}
function select_row_with_twofields($tbl, $field1, $value1, $field2, $value2)
{
	global $con;
	$query = "SELECT * FROM $tbl WHERE $field1 ='".$value1."' AND $field2 = '".$value2."'";
			 //or die('error selecting 2 fields'.mysql_error());
	$result = $con-> query($query) or die('error selecting 2 column'. $con->error);;
	return $result;
}
function countrows($query)
{
	return $query->num_rows;
}
function pwd_retrieve($email){
	$query = select_row_with_onefield(DETAILS,'email',$email);
	if(countrows($query) > 0)
	{
		$det = mysql_fetch_array($query);
		$to = $email;
		$subject = 'NIJET Password Retrieval';
		$from = "no-reply@nijet.com";
		$message = '<html>
					<head>
  					<title>'.$subject.'</title>
					</head>
					<body>
					  Your login password is <br><b>'.base64_decode($det['pass']).'</b>
					  <p>You can Login From <a href="#">Here</a>
					<p>Thanks <br>
					Nijet Journals</p>
					<small>Please if You have not requested for this mail, Please inform <a href="#">NIJET</a> </small>
					</body>
					</html>';
					// To send HTML mail, the Content-type header must be set
	  $headers  = 'MIME-Version: 1.0' . "\r\n";
	  $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
	  // Additional headers
	  $headers .= 'To: '.$det[''].' <'.$email.'>' . "\r\n";
	  $headers .= 'From: NIJET Password Retrieval'. '<'.$from.'>' . "\r\n";
	  /*$headers .= 'Cc: birthdayarchive@example.com' . "\r\n";
	  $headers .= 'Bcc: birthdaycheck@example.com' . "\r\n";*/
	  //send a mail consisting the password
	  if(sendmail($to,$subject,$message,$headers))
	  {
		  return 601; //mail sent successfully
	  }
	  else{
		  return 602; //mail was not sent
	  }
	}
	else
	{
		return 201; //mail not found
	}
}

function sendmail($to, $subject, $message, $headers){
	// Mail it	
	mail($to, $subject, $message, $headers);
}
function mailers($to, $name, $subject, $html, $text){
	/**
	 * This example shows sending a message using a local sendmail binary.
	 */
	//Import the PHPMailer class into the global namespace
	//use PHPMailer\PHPMailer\PHPMailer;
	//require ("vendor/autoload.php");
	//Create a new PHPMailer instance
	$mail = new PHPMailer;
	//Tell PHPMailer to use SMTP
	$mail->isSMTP();
	//Enable SMTP debugging
	// 0 = off (for production use)
	// 1 = client messages
	// 2 = client and server messages
	$mail->SMTPOptions = array(
			'ssl' => array(
				'verify_peer' => false,
				'verify_peer_name' => false,
				'allow_self_signed' => true
			)
		);
	//Set the encryption system to use - ssl (deprecated) or tls
	$mail->SMTPSecure = 'ssl';
	$mail->SMTPDebug = 2;
	//Set the hostname of the mail server
	$mail->Host = 'mail.schoolsearch.org.ng';
	//Set the SMTP port number - likely to be 25, 465 or 587
	$mail->Port = 465;
	//Whether to use SMTP authentication
	$mail->SMTPAuth = true;
	//Username to use for SMTP authentication
	$mail->Username = 'info@schoolsearch.org.ng';
	//Password to use for SMTP authentication
	$mail->Password = '12345%$#@!';
	//Set who the message is to be sent from
	$mail->setFrom('info@schoolsearch.org.ng', 'SchoolSearch');
	//Set an alternative reply-to address
	//$mail->addReplyTo('replyto@example.com', 'First Last');
	//Set who the message is to be sent to
	$mail->addAddress($to, $name);
	//Set the subject line
	$mail->Subject = $subject;
	//Read an HTML message body from an external file, convert referenced images to embedded,
	//convert HTML into a basic plain-text alternative body
	$mail->Body = $html;
	//$mail->msgHTML(file_get_contents('contents.html'), __DIR__);
	//Replace the plain text body with one created manually
	$mail->AltBody = $text;
	//Attach an image file
	//$mail->addAttachment('images/phpmailer_mini.png');

	//send the message, check for errors
	if (!$mail->send()) {
		return false;
		//echo "Mailer Error: " . $mail->ErrorInfo;
	} else {
		return true;
		//echo "Message sent!";
	}
	
	
}
function set_val($item){
	global $con;
	$query = $con->query("SELECT * FROM settings WHERE setting = '".$item."'") or die(mysql_error());
	$settd = $query->fetch_array();
	return $settd['value'];
}
function countries(){
	global $con;
	$query = "SELECT * FROM countries";
	//) or die(mysql_error());
	$result = $con->query($query);
	while($country = $result->fetch_assoc())
	{
		echo '<option value="'.$country['ref_id'].'"> '.$country['country'].'</option>';
	}
}
function country($id){
	global $conn;
	$query = $con->query("SELECT * FROM countries WHERE ref_id = '".$id."' ") or die(mysql_error());
	$country = $query->fetch_assoc();
	$country = $query['country'];
	return $country;
}
function states(){
	global $con;
	$query = " SELECT * FROM states ";
	//) or die(mysql_error());
	$result = $con->query($query) or die('there was a serious error');
	while($state = $result->fetch_assoc())
	{
		echo '<option value="'.$state['state_id'].'"> '.$state['state_name'].'</option>';
	}
}

define("PASS","mailers01");

function lgass($Sid){
	global $con;
	$query = "SELECT * FROM lga WHERE state_id = '".$Sid."'";
	//) or die(mysql_error());
	$result = $con->query($query);
	while ($lga = $result->fetch_assoc()){
		echo '<option value="'.$lga['lga_id'].'">'.$lga['lga_name'].'</option>';
	}
}
//Retrieve State
function get_country($id){
	global $con;
	$query = "SELECT * FROM countries WHERE ref_id = '".$id."'";
	//$query = select_row_with_onefield('countries','ref_id',$id);
	$name = $con->query($query);
	$c_name = $name->fetch_assoc() or die ("There was an error loading Country ".$con->error);;
	return $c_name['country'];
}
function get_state($id){
	global $con;
	if(is_numeric($id)){
	$query = "SELECT * FROM states WHERE state_id = '".$id."'";
	//$query = select_row_with_onefield('countries','ref_id',$id);
	$name = $con->query($query) or die ("There was an error loading States ".$con->error());;
	$s_name = $name->fetch_assoc();
	return $s_name['state_name'];
	}else{
		return $id;
	}
}
function get_lga($state,$lga){
	global $con;
	if(is_numeric($lga)){
	$query = "SELECT * FROM lga WHERE state_id = '".$state."' AND lga_id = '".$lga."'";
	//$query = select_row_with_onefield('countries','ref_id',$id);
	$name = $con->query($query) or die ("There was an error loading lga ".$con->error());
	$lg_name = $name->fetch_assoc();
	return $lg_name['lga_name'];
	}else{
		return $lga;
	}
}
//lists of Universities
function unis(){
	global $con;
	$query = "SELECT * FROM university ";
	$result = $con->query($query);
	while($unis = $result->fetch_assoc() ){
		echo '<option value="'.$unis['ref_id'].'">'.$unis['university_name'].'</option>';
	}
}
//Return University Names
function unis_name($uni){
	global $con;
	$query = "SELECT * FROM university WHERE ref_id = '".$uni."'";
	$name = $con->query($query);
	$uni_name = $name->fetch_assoc();
	return $uni_name['university_name'];
}


function en_crypt($value)
{
	return base64_encode($value);
}
function de_crypt($value)
{
	return base64_decode($value);
}
function user_ip()
{
	if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
		$ip = $_SERVER['HTTP_CLIENT_IP'];
	} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
		$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
	} else {
		$ip = $_SERVER['REMOTE_ADDR'];
	}
	return $ip;
}
function doc($type){
	if($type == 'pdf'){
		echo '<img src="../images/pdf.png" class="icon" alt="'.$type.'">';
	}
	else{
		echo '<img src="../images/doc.png" class="icon" alt="'.$type.'">';
	}
}

global $err;
function server_says($input){
	if($input == 1){$mssg = '<span class="error">You are now logged out</span>';}
	if($input == 2){$mssg = '<span class="error">Please login to continue</span>';}
	if($input == 999){$mssg = '<span class="error">Please Complete all the fields</span>';}
	if($input == 101){ $mssg = '<span class="error">Please Input a Valid Email Address</span>';}
	if($input == 102){ $mssg = '<span class="error">Please Input your password</span>';}
	if($input == 301){ $mssg = '<span class="done">Welcome Admin</span';}
	if($input == 302){ $mssg = '<span class="done">Welcome Client</span>';}
	if($input == 303){ $mssg = '<span class="error">Email or Password Incorrect</span>';}
	if($input == 305){ $mssg = '<span class="error">Something went wrong</span>';}
	if($input == 601){ $mssg = '<span class="done">A mail containing your password was sent the email address</span>';}
	if($input == 602){ $mssg = '<span class="error">There was an error sending mail... Please try again latter</span>';}
	if($input == 201){ $mssg = '<span class="error">The provided email address was not found. </span>';}
	if($input == 401){ $mssg = '<span class="done">Success Uploading Paper </span>';}
	if($input == 402){ $mssg = '<span class="error">File Upload Failed. </span>';}
	if($input == 403){ $mssg = '<span class="error">File Exceeds Uploadable Size </span>';}
	if($input == 404){ $mssg = '<span class="error">Invalid File Format! </span>';}
	if($input == 405){ $mssg = '<span class="error">Please Select a File.</span>';}
	if($input == 501){ $mssg = '<span class="error">The Teller number you entered is already associated with another paper. </span>';}
	if($input == 502){ $mssg = '<span class="error">The Topic you entered is already taken, Please Try another one </span>';}
	if($input == 503){ $mssg = '<span class="done">Success Saving Your Payment </span>';}
	return $mssg;
}
//ASSIGNMENT FLAGGINGS.... DO RED FLAGS
function checkSubs($user,$assId){
		$check = select_row_with_twofields(FLIPSUBASS,'assign_id',$assId,'user_id',$user);
		if(countrows($check) > 0){
			return true;
		}else{
			return false;
		}
}
function newAss($user){
	$flag = 0;
	$all = select_all(FLIPASS);
		//if(countrows($all) > 0){
			while($allAss = mysql_fetch_array($all)){
				if(!checkSubs($user,$allAss['assign_id'])){
					$flag++;
				}
			}
	if ($flag > 0)	return true;
	else return false;	
}
function matDets($id){
	$query = select_row_with_onefield(FLIPMATS,'topic_id',$id);
	return mysql_fetch_array($query);
}

//LESSON TYPE IMAGE AND TEXT
function do_images($type){
	$rets = array('txt' => '',
				  'img' => '');
	if($type == 'web'){
		$rets['txt'] = 'Web Lesson';
		$rets['img'] = '<img src="images/learn-button.jpg" class="icon_big">';
	}else if($type == 'ytube'){
		$rets['txt'] = 'You Tube Lesson';
		$rets['img'] = '<img src="images/YouTube-icon.png" class="icon_big">';
	}else if($type == 'dUpload'){
		$rets['txt'] = 'File Uploads';
		$rets['img'] = '<img src="images/doc.png" class="icon_big">';
	}else if($type == 'vUpload'){
		$rets['txt'] = 'Video Lesson';
		$rets['img'] = '<img src="images/video.png" class="icon_big">';
	}
	return $rets;
}

//FUNCTION TO GET READABLE TOPIC FROM ID
function read_topic($id){
	$query = select_row_with_onefield(FLIPMATS,'topic_id',$id);
	if(countrows($query)>0){
		$topic = mysql_fetch_array($query);
		return $topic;
	}
	else
	return 'An Error Just Occured';
}

//FUNCTION TO GET READABLE NAMES FROM ID
function read_names($id){
	$query = select_row_with_onefield(USERS,'user_id',$id);
	if(countrows($query)>0){
		$user = mysql_fetch_array($query);
		return $user;
	}
	else
	return 'An Error Just Occured';
}

//calculate 10 years back
function years(){
	$ds = date("Y");
	for($i=1990; $i <= $ds; $i++){
		print
		'<option value="'.$i.'">'.$i.'</option>';
	}
}

//get all subjects
function olevelsubjects(){
	global $con;
	$query = $con->query("SELECT * FROM olevelsubjectslist")
			or die("Error loading subject lists ".$con->error);//select_all('olevelsubjectslist');
	while($subject = $query->fetch_array()){
		print '<option value="'.$subject['subject'].'">'.$subject['subject'].'</option>';
	}
}

//get all grades
function olevelgrade(){
	global $con;
	$query = $con->query("SELECT * FROM olevelgradeslist");
	while($grades = $query->fetch_assoc()){
		print '<option value="'.$grades['grade'].'">'.$grades['grade'].'</option>';
	}
}
/*Global Variables*/
function mailheaders($to,$from, $user){
	  $headers  = 'MIME-Version: 1.0' . "\r\n";
	  $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
	  // Additional headers
	  $headers .= 'To: '.$user.' <'.$to.'>' . "\r\n";
	  $headers .= 'From: Leadership Seekers Academy'. '<'.$from.'>' . "\r\n";
	  return $headers;
}
//CHECK PAYMENTS
function notPaid($user){
	$query = select_row_with_twofields(BIN,'form_id',$user,'payment_id','np');
	if(countrows($query) > 0){
		return true;
	}else{
		return false;
	}
}
//DUE  FEES
function fee($id){
	$query = select_row_with_onefield(FEES,'ref_id',$id);
	return $query->fetch_assoc();
}
function all_fee(){
	$query = select_all(FEES);
	while($fee = $query->fetch_assoc()){
		echo '<option value="?cmd=pay&type='.$fee['ref_id'].'">'.$fee['fee_name'].'</option>';
	}
}
//reduce array
function reduce($v1,$v2){
	return $v1 .'-'.$v2;
}
//IJMB SUBJECTS
function ijmb_courses($id){
	$query = select_row_with_onefield('lsa_ijmb_courses','institute_code',$id);
	$flag = 1;
	print '<option value="" selected>Select IJMB Subjects</option>';
	while($sub = $query->fetch_assoc()){
		print '	<option  value="'.$sub['subject_id'].'" >'.$sub['subject'].'</option>';
	}
}
//IJMB SUBJECT NAME
function ijmb_subject_name($id){
	$query = select_row_with_onefield('lsa_ijmb_courses','subject_id',$id);
	$name = $query->fetch_assoc();
	echo $name['subject'];
}

//RANDOM PAYMENT TOKEN
function token(){
	$chars = "abcdefghijklmnopq0123456789ABCDRSTUVWXYZ";
	srand((double)microtime()*1000000);
	$i=0;
	$pass = "";
	while ($i<=9)
	{
		$num = rand()%33;
		$tmp = substr ($chars,$num,1);
		$pass = $pass. $tmp;
		$i++;
	}
	return $pass;
}

//RETURN PART START AND END
function slice($content){
	//$content = html_entity_decode($content);
	if(strlen($content)>170){
		$start = substr($content,0, 350).'...';
		$end = substr($content,-10);
		return $start.$end;
	}
	else{
		return $content;
	}
}

//CREATE ACRONYMS
function shorten($word){
	if(preg_match_all('/\b(\w)/',strtoupper($word),$m)) {
		$v = implode('',$m[1]); // $v is now SOQTU
		return $v;
	}
}
//Menu  && ROLES
function menulist($role_id){
	global $con;
	$list =  $con->query("SELECT * FROM role_menu WHERE role_id = '".$role_id."' AND status ='active'" );//select_row_with_twofields('role_menu',
	if(countrows($list) > 0){
		/*while($menu = $list->fetch_array()){
			return $menu;
		}*/
		return $list;
	}
}
function role($role_id){
	global $con;
	$list =  $con->query("SELECT * FROM role_tbl WHERE role_id = '".$role_id."' AND status = 'active'" );
	return $list->fetch_assoc();
}

//Slug creator
function create_slug($string, $charset = 'utf-8'){
	$string = htmlentities($string, ENT_NOQUOTES, $charset, false); // convert accented characters to entities
	// strip unwanted parts of entities to leave unaccented character
    $string = preg_replace('~&([A-za-z])(?:acute|cedil|caron|circ|grave|orn|ring|slash|th|tilde|uml);~', '\1', $string);
    $string = preg_replace('~&([A-za-z]{2})(?:lig);~', '\1', $string);
    $string = preg_replace('~&[^;]+;~', '', $string); // remove other entities
    return preg_replace('~[\s!*\'();:@&=+$,/?%#[\]]+~', '-', $string); // replace spaces and illegal characters with hyphens
}

//payment
function payamount($code){
	$pay = select_row_with_onefield('payment_definition','pay_code',$code);
	return $pays = $pay->fetch_array();
}
function validate_payment($tid){
	//code to validate payment
}

//SMS ALERTS
function smsalert($msg,$phoneno){
	$msg= rawurlencode($msg);
	$phoneno="+234".substr($phoneno,-10);
	$sender=rawurlencode('schoolsearch');
	$send=file_get_contents('https://smartsmssolutions.com/api/?message='.$msg.'&to='.$phoneno.'&sender='.$sender.'&type=0&routing=3&token=tzR1QEQrdS6Z38Sq1zAGwL2qFhf8ewMieHjOAW08JeD32e3Ein6MQRppm44ESBRFeq8O78hiJiwcKdqIcEQqFwh0Cp61OkwtFTDA');
 }

 //PAYSTACK
function is_prev_payment_success($sname, $phone, $email, $amt, $sess){
	global $con;
	$chek = $con->query("SELECT * FROM payment_attempttb WHERE surname='".$sname."' AND amount = '".$amt."' AND (trans_id LIKE '%".$phone."%' OR trans_id LIKE '%".$email."%') AND session = '".$sess."'");
	$ret = $chek->fetch_array();
	if($ret['status'] == 'success'){
		return true;
	}else{
		return false;
	}
}

//Make Payment Attempt
/*This instantiate a payment attempt on with customer email,pone, surname, othername, regno, paycode and session*/
function make_payment_attempt($email, $phone, $sname, $oname, $regno, $code, $loc_id, $prog_id, $sess){
	global $con;
  	$t_id =  'ALL_'.str_replace('/','_',$regno).$phone.time();
	$fees = dlookup('fee_amount', 'payment_setup', "fee_code='$code' AND prog_id = '$prog_id' ");
	//$desc = ;
	$desc = dlookup('fee_name', 'payment_fee_setup', "fee_code = '$code' "); //$fees[0]->fee_name;
	$charges = 250;
	$amt = $fees + $charges;
	$amts = ($amt * 100);
  	//prepare transaction initialization
	$salt = hash('md5','bode thomas').md5(base64_encode($sname.$email.$regno.$code.$sess));
	//$m = md5(base64_encode($j->surname.$j->email.$j->regno.$j->fee_code.$j->session));
	$j = base64_encode(json_encode(array('surname'=>$sname, 'phone' => $phone, 'email'=> $email, 'trans_id'=>$t_id, 'amount'=>$amts, 'regno'=>$regno, 'payment_desc'=>$desc, 'fee_code'=>$code, 'session'=>$sess)));
	//check for previous payment attempt  	
	$check = $con->query("SELECT * FROM payment_attempttb WHERE regno = '$regno' AND payment_desc = '$desc' AND session = '$sess'");
	if(countrows($check)<1){
		$pay = $con->query("INSERT INTO payment_attempttb (surname, other_name, regno, trans_id, amount, payment_desc, fee_code, trans_date, payment_date, payment_time, session, json_val) VALUES ('".$sname."', '".$oname."', '".$regno."', '".$t_id."', '".$amts."', '".$desc."','".$code."', CURDATE(), CURDATE(), CURTIME(), '".$sess."','".$j."')") or die($con->error);
	}	
	if(!$con->error){
		return "pay_start.php?s=$salt&j=$j";
	}else{
		return false;
	}
}


//DThings
function dlookup_json($column,$table,$condition='')
{
	global $con;
	$row = array();
	if($condition=="")
		{
			$result=$con->query("select $column from $table") or die($con->error);
			while($r=$result->fetch_array(MYSQLI_ASSOC))// or fetch_array(true)
				{
					$row[]=$r;
				}
		}
	else
	{
		$result=$con->query("select $column from $table where $condition") or die($con->error);
		while($r=$result->fetch_array(MYSQLI_ASSOC))// or fetch_array(true)
				{
					$row[]=$r;
				}
	}
	return json_encode($row);
}// end of dlookup_json
function dlookup($column,$table,$condition='')
{
	global $con;
	if($condition=="")
		{
			$result=$con->query("select $column as output from $table") or die($con->error);
			$r=$result->fetch_array(MYSQLI_ASSOC);// or fetch_array(true)
			$output=$r['output'];
				
		}
	else
	{
		$result=$con->query("select $column as output from $table where $condition") or die($con->error);
		$r=$result->fetch_array(MYSQLI_ASSOC);// or fetch_array(true)
		$output=$r['output'];
	}
	return $output;
}// end of dlookup

function dcount($column,$table,$condition='')
{
	global $con;
	if($condition=="")
		{
			$result=$con->query("select count($column) as total from $table");
			$r=$result->fetch_array(MYSQLI_ASSOC);// or fetch_array(true)
			$total=$r['total'];
			
		}
	else
	{
		$result=$con->query("select count($column) as total from $table where $condition");
		$r=$result->fetch_array(MYSQLI_ASSOC);// or fetch_array(true)
		$total=$r['total'];
	}
	return $total;
}// end of dcount

function dsum($column,$table,$condition='')
{
	global $con;
	if($condition=="")
		{
			$result=$con->query("select sum($column) as total from $table");
			$r=$result->fetch_array(MYSQLI_ASSOC);// or fetch_array(true)
			$total=$r['total'];
			
		}
	else
	{
		$result=$con->query("select sum($column) as total from $table where $condition");
		$r=$result->fetch_array(MYSQLI_ASSOC);// or fetch_array(true)
		$total=$r['total'];
	}
	return $total;
}// end of dsum

function numberTowords($num){
	$ones = array( 	0 =>"ZERO", 1 => "ONE",	2 => "TWO", 3 => "THREE", 4 => "FOUR", 5 => "FIVE", 6 => "SIX", 7 => "SEVEN", 8 => "EIGHT", 9 => "NINE", 10 => "TEN", 11 => "ELEVEN", 12 => "TWELVE", 13 => "THIRTEEN", 14 => "FOURTEEN", 15 => "FIFTEEN", 16 => "SIXTEEN", 17 => "SEVENTEEN", 18 => "EIGHTEEN", 19 => "NINETEEN", "014" => "FOURTEEN" );
	$tens = array( 0 => "ZERO", 1 => "TEN", 2 => "TWENTY", 3 => "THIRTY", 4 => "FORTY", 5 => "FIFTY", 6 => "SIXTY", 7 => "SEVENTY", 8 => "EIGHTY", 9 => "NINETY" ); 
	$hundreds = array( "HUNDRED", "THOUSAND", "MILLION", "BILLION", "TRILLION", "QUARDRILLION" ); /*limit t quadrillion */
	$num = number_format($num,2,".",","); 
	$num_arr = explode(".",$num); 
	$wholenum = $num_arr[0]; 
	$decnum = $num_arr[1]; 
	$whole_arr = array_reverse(explode(",",$wholenum)); 
	krsort($whole_arr,1); 
	$rettxt = ""; 
	foreach($whole_arr as $key => $i){
		while(substr($i,0,1)=="0")
				$i=substr($i,1,5);
		if($i < 20){ 
			/* echo "getting:".$i; */
			$rettxt .= $ones[$i]; 
		}elseif($i < 100){ 
			if(substr($i,0,1)!="0")  $rettxt .= $tens[substr($i,0,1)]; 
			if(substr($i,1,1)!="0") $rettxt .= " ".$ones[substr($i,1,1)]; 
		}else{ 
			if(substr($i,0,1)!="0") $rettxt .= $ones[substr($i,0,1)]." ".$hundreds[0]; 
			if(substr($i,1,1)!="0")$rettxt .= " ".$tens[substr($i,1,1)]; 
			if(substr($i,2,1)!="0")$rettxt .= " ".$ones[substr($i,2,1)]; 
		} 
		if($key > 0){ 
			$rettxt .= " ".$hundreds[$key]." "; 
		}
	} 
	if($decnum > 0){
		$rettxt .= " and ";
		if($decnum < 20){
			$rettxt .= $ones[$decnum];
		}elseif($decnum < 100){
			$rettxt .= $tens[substr($decnum,0,1)];
			$rettxt .= " ".$ones[substr($decnum,1,1)];
		}
	}
	return $rettxt .' NAIRA ONLY';
}
?>
