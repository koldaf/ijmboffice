<?php
require('constant.php');
$con = new mysqli(MYHOST,MYROOT,PASSWORD,MYDATABASE);
if($con->connect_error)
{
	die("Connection failed: " . $con->connect_error);
}else{
	global $con;
	$payLive =  true; //false
	$payKey = ($payLive === true)? LIVEKEY:TESTKEY;
	global $payKey;
}

?>