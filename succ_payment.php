<?php
include('lib/functions.php');
if(isset($_GET['var_d'])){
	//$d = base64_encode(hash("md5","bode thomas").'**********'.base64_encode($j->regno));
	$d = base64_decode($_GET['var_d']);
	list($a,$b) = explode('**********',$d);
	if($a != hash("md5","bode thomas")){
		redirect('logout.php');
		exit;
	}
}
require('header.php');

?>
<link href="css/bootstrap.min.css" rel="stylesheet"/>
<link href="css/custom.css" rel="stylesheet"/>
<style>
    .panel-heading{
        background: #eee !important;
    }
    .panel-title{
        color: #000 !important;
        font-weight:bold;
    }
    .container{
        max-width: 800px;
        margin: 0 auto;
        padding: -10px 10px 0px 10ox
    }
    .panel-body{
        line-height:2em;

    }
	.letter-block{
		padding: 10px;
		margin-bottom: 5px;
	}
</style>
</div>
<div class="container-fluid">
	<div class="col-xs-6 col-xs-offset-3">
		<div class="jumbotron text-center">
			<img src="img/succ.png" class="img-circle img-rounded">
		<h1>Payment was Successful</h1>
		<p>Your payment has been verified and found to be successful. Thank You</p>
		<p><a class="btn btn-primary btn-lg" href="index.php" role="button"><i class="fa fa-home fa-2x"></i>Home</a>
		</p>
	</div>

	</div>
</div>
