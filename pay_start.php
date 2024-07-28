<?php
include('lib/functions.php');
$curl = curl_init();
if(isset($_REQUEST['s']) && isset($_REQUEST['j'])){
	$j = base64_decode($_REQUEST['j']);
	$j = json_decode($j);
	/*var_dump($j); 
	print_r(base64_decode($_REQUEST['j'])); exit;*/
	//$salt = hash('md5','bode thomas').md5(base64_encode($sname.$phone.$email.$t_id.$amt.$regno.$desc.$code.$sess));
	//$m = md5(base64_encode($j->surname.$j->phone.$j->email.$j->trans_id.$j->amount.$j->regno.$j->payment_desc.$j->fee_code.$j->session));
	$m = md5(base64_encode($j->surname.$j->email.$j->regno.$j->fee_code.$j->session));
	$m_s = hash('md5', 'bode thomas').$m;
		if($_REQUEST['s'] != $m_s){
			redirect('logout.php');
			exit;
		}else{
			//$_SESSION['param'] = base64_decode($_REQUEST['s'].'*******'.$_REQUEST['j']);
			$_SESSION['param'] = $j;
		}
}else{
	var_dump($_REQUEST);
	redirect('logout.php');
	exit;
}
$email = $j->email;
$amount = $j->amount;  //the amount in kobo. This value is actually NGN 300
curl_setopt_array($curl, array(
  CURLOPT_URL => "https://api.paystack.co/transaction/initialize",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => json_encode([
    'amount'=>$amount,
    'email'=>$email,
	 'last_name' => $j->surname,
	  'phone'=>$j->phone,
	  'trans_id'=>$j->trans_id
  ]), 
  CURLOPT_HTTPHEADER => [
    "authorization: Bearer $payKey", //replace this with your own test key 
    "content-type: application/json",
    "cache-control: no-cache"
  ],
));

$response = curl_exec($curl);
$err = curl_error($curl);

if($err){
  // there was an error contacting the Paystack API
  die('Curl returned error: ' . $err);
}

$tranx = json_decode($response, true);
if(!$tranx->status){
  // there was an error from the API
  //print_r('API returned error: ' . $tranx['message']);
}

// comment out this line if you want to redirect the user to the payment page
print_r($tranx);
exit;
$con->query("UPDATE payment_attempttb SET ret_ref = '".$tranx['data']['reference']."' WHERE trans_id = '".$j->trans_id."'") or die("Fatal Error, Try Again");


// redirect to page so User can pay
// uncomment this line to allow the user redirect to the payment page
header('Location: ' . $tranx['data']['authorization_url']);
?>