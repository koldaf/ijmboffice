<?php
include('lib/session.php');
include('lib/functions.php');
confirm_access();
if(isset($_POST['pay'])){
	$email = prepsql($_POST['email']); 
    $phone = prepsql($_POST['phone']); 
    $sname = prepsql($_POST['sname']); 
    $oname = prepsql($_POST['oname']); 
    $regno = prepsql($_POST['regno']); 
    $code = prepsql($_POST['code'] );
    $sess = prepsql($_POST['sess'] );
	if(empty($code)){
		echo 'Incomplete payment attempt, please click the back button and try again';
		exit;
	}
	$url = make_payment_attempt($email, $phone, $sname, $oname, $regno, $code, $sess);
	if($url){
		redirect($url);
	}
}else{
	redirect('logout.php');
}
 	
?>