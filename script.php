<?php
require 'lib/functions.php';
require 'lib/session.php';
if (!isset($_SERVER['HTTP_X_REQUESTED_WITH'])){
    die('illegal entry... This will be reported.');
}
$id=$contentvar=$_REQUEST['cmd'];
 $j=isset($_REQUEST['data'])?json_decode($_REQUEST['data']):'';
 $login_id=isset($_SESSION['login_id'])?$_SESSION['login_id']:'';

 $resp = array("success"=>false,"message"=>"");

 if($id='form-payment'){
    $pay = make_payment_attempt($j->email, $j->phone, $j->surname, $j->othernames, $j->regno, $j->fee_code,'',$j->prog_id,$j->sess);
    if(!$pay){
        $resp['message'] = "There was an error initiating payment";
    }else{
        $resp['redirect'] = true;
        $resp['location'] = $pay;
    }
    //print_r($pay);

 }

 echo json_encode($resp);
?>