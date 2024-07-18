<?php
include('lib/session.php');
include('lib/functions.php');
$regno =$_SESSION['user'];
$trans = prepsql($_GET['vs']);
$trans = base64_decode($trans);
if(dcount('trans_id', 'payment_transactiontb', "trans_id = '$trans'") < 1){
	redirect('logout.php');
	exit;
}
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

<div class="container">
	<div class="row">
		<center>
			<img src="img/ijmb office logo.png"  width="300" height="80" > 
			<h4>80, Agba Dam Road, Gaa Akanbi Ilorin, Kwara State.</h4>
		</center>
	</div>
	<div class="row">
		<div class="col-xs-4">
			<h4><i class="glyphicon glyphicon-envelope"></i> Email: info@ijmboffice.org.ng </h4>
		</div>
		<div class=" col-xs-4">
			<h4><i class="glyphicon glyphicon-phone"></i> Phone: 08089186066  </h4>
		</div>
		<div class=" col-xs-4">
			<h4><i class="glyphicon glyphicon-globe"></i> Website: https://ijmboffice.org.ng </h4>
		</div>
    </div>
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title text-center">IJMBOFFICE Payment Receipt</h3>
			</div>
			<div class="panel-body">
				<?php 
					$app = json_decode(dlookup_json("*","application_dummy","regno='$regno'"));
					$pay = json_decode(dlookup_json('*', 'payment_transactiontb', "trans_id = '$trans'"));
					$word = new NumberFormatter("en", NumberFormatter::SPELLOUT)
				?>
				<div class="panel panel-default">
					<table border=1 class="table">
						<tr>
							<td><strong>Name:</strong></td>
							<td><?php echo trim(strtoupper($app[0]->surname)).', '.ucwords(strtolower($app[0]->othernames))?></td>
						</tr>
						<tr>
							<td><strong>Programme Type:</strong></td>
							<td><?php echo $app[0]->exam_type ?></td>
						</tr>
						<tr>
							<td><strong>Payment Description:</strong></td>
							<td><?php echo $pay[0]->payment_desc ?></td>
						</tr>
						<tr>
							<td><strong>Amount:</strong></td>
							<td>&#8358;<?php echo number_format($pay[0]->amount, 2) ?></td>
							
						</tr>
						<tr>
							<td><strong>Amount in Word:</strong></td>
							<td><?php echo ucwords($word->format($pay[0]->amount)).' Naira Only' ?></td>
						</tr>
						<tr>
							<td><strong>Payment Reference No:</strong></td>
							<td><?php echo $pay[0]->trans_id ?></td>
						</tr>
						<tr>
							<td><strong>Payment Date:</strong></td>
							<td><?php echo $pay[0]->payment_date ?></td>
						</tr>
						<tr>
							<td><strong>Payment Time:</strong></td>
							<td><?php echo $pay[0]->payment_time ?></td>
						</tr>
						
							
							
					</table>
				</div>
					
				</div>
			</div>
	<div class="row text-center">
		<small>this receipt was generated automatically from IJMBOFFICE platform on <?php echo date('l, d-m-Y g:i a') ?>.</small>
	</div>
</div>