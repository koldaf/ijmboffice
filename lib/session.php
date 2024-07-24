<?php
session_start();
function logged_in()
{
	return isset($_SESSION['user']);
}
function confirm_access()
{
	if(!logged_in()) 
	{
		redirect('index.php?i=2');
	}
}
function confirm_admin()
{
	if(!isset($_SESSION['admin']))
	{redirect('index.php?i=2');
	}
}
function check_login()
{
	if(logged_in())
	{
		redirect('home.php');
	}
}
function applicatn(){
	return isset($_SESSION['form_id']);
}
function check_app(){
	if(!applicatn()){
		redirect('index.php');
	}
}
?>