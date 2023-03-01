<?php
require_once('lib/functions.php');
// find the session
session_start();
//reset users activities
/*if (isset($_SESSION['user_email'])){logout($_SESSION['user']);}
if (isset ($_SESSION['admin'])){logout($_SESSION['admin']);}*/
//unset all the session variables
$_SESSION = array();
//Destroy the session cookie
if(isset($_COOKIE[session_name()]))
{
	setcookie(session_name(),'', time()-420000, '/');
}
session_destroy();
mysqli_close($con);
 redirect('index.php');
?>