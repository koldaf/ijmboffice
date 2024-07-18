<?php
include('lib/functions.php');
include('config.php');
$curl = curl_init();
$reference = isset($_GET['reference']) ? $_GET['reference'] : '';
if(!$reference){
  die('No reference supplied');
}

curl_setopt_array($curl, array(
  CURLOPT_URL => "https://api.paystack.co/transaction/verify/" . rawurlencode($reference),
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_HTTPHEADER => [
    "accept: application/json",
    "authorization: Bearer $payKey",
    "cache-control: no-cache"
  ],
));

$response = curl_exec($curl);
$err = curl_error($curl);

if($err){
	// there was an error contacting the Paystack API
  die('Curl returned error: ' . $err);
}

$tranx = json_decode($response);
//print_r($tranx);
if(!$tranx->status){
	//print_r($tranx);
  // there was an error from the API
  die('API returned error: ' . $tranx->message);
}

if('success' == $tranx->data->status){
  // transaction was successful...
  // please check other things like whether you already gave value for this ref
  // if the email matches the customer who owns the product etc
  // Give value
	//check my session values *******
	$ref = $tranx->data->reference;
	$j_val = dlookup('json_val', 'payment_attempttb', "ret_ref = '$ref'");
	$j = json_decode(base64_decode($j_val));
	//var_dump($tranx->data);exit;
	//check payment amount
	//var_dump($tranx->data->customer->email); echo $j->email; exit;
	//var_dump($tranx->data->customer->customer_code); exit;
	//print_r($_SESSION);
	//$count
	if($j->email == $tranx->data->customer->email){
		//update payment attempt
		$update = $con->query("UPDATE payment_attempttb SET status = '".$tranx->data->status."', response_code = '".$tranx->status."', response_desc='".$tranx->message."', pay_ref='".$tranx->data->reference."' WHERE trans_id = '".$j->trans_id."'") or die('error updating '.$con->error);
		if($update){
			//write into payment_transaction
			$amt = ($tranx->data->amount / 100);
			$trans = $con->query("INSERT IGNORE  INTO payment_transactiontb (trans_id, payment_desc, pay_item_id, regno, amount, response_code, pay_ref, session, json_val, payment_date, payment_time) VALUES ('".$j->trans_id."','".$j->payment_desc."', '".$j->fee_code."','".$j->regno."','".$amt."','".$tranx->data->customer->customer_code."','".$tranx->data->reference."','".$j->session."','', CURDATE(), CURTIME())")  or die($con->error);
			if($trans){
				//payment successfull
				$d = base64_encode(hash("md5","bode thomas").'**********'.base64_encode($j->regno));
				//unset($_SESSION['param']);
				//check for what is being paid for
				if($j->fee_code == 'WIN_FEE_001'){
					//acceptance
					$update2 = $con->query("UPDATE application_dummy SET payment_status = 'validated' WHERE regno = '".$j->regno."'") or die('error updating '.$con->error);
					//Send Text and Email
					$text =  'Dear '.$j->surname.', your application was successful. Your application number is: '.$j->regno;
					  $html = '<p>
					  	Dear '.$j->surname.', <br/>
					  	Your application was successful. Your Application Number is: '.$j->regno.'. 
						<br/>
												
						<p>Kindly login to print your receipts using your Application Number and your surname as password</p>
						
						Thank You <br>
						<strong>'.SITENAME.'</strong>
						</p>';
					 //mailers($j->email, $j->surname, SITENAME, $html, $text);
					  
					  //smsalert($text, $j->phone);
					redirect('succ_payment.php?var_d='.$d);
				}else {
					redirect('succ_payment.php?var_d='.$d);
				}
				
				/*echo '<script>alert("Your payment was successfull. Kindly login using your email  and surname as password to continue"); location = index.php</script>';*/
			}else{
				$con->error;
			}
		}
		
	}
}
?>