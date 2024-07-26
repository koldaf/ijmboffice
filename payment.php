<?php
require('lib/functions.php');
if(isset($_POST['email'])){
	$pay = make_payment_attempt($_POST['email'], $_POST['phone'], $_POST['surname'], $_POST['othernames'], $_POST['regno'], $_POST['fee_code'],'',$_POST['prog_id'],$_POST['sess']);
	
	print_r($pay);
	
	//header("Location: {$pay}");

	exit;

}
if ($_GET['exist'] == 0) {
	$regno = base64_decode($_GET['reg']);
} else if ($_GET['exist'] == 1) {
	$regno = base64_decode($_GET['reg']);
}
$userdet = json_decode(dlookup_json('*', 'application_dummy ad, payment_setup ps, programmetb p', "ad.regno='$regno' AND ps.prog_id=ad.exam_type AND p.prog_id = ad.exam_type"));

//print_r($userdet[0]);
require('header.php');
?>
<div class="row" style="margin-top: 10px;">
	<ol class="breadcrumb">
		<li><a href="index.php">Home</a></li>
		<li><a href="#">Apply</a></li>
		<li class="active">Download Alevel Form</li>
	</ol>
	<h1 class="page-header">SchoolSearch
		<small>Download Forms</small>
	</h1>
</div>
<div class="row">
	<div class="col-sm-3">
		<div class="list-group">
			<a href="about.php" class="list-group-item active">About Alevel</a>
			<a href="index.php" class="list-group-item">Home</a>
			<a href="news.php" class="list-group-item">Alevel News</a>
			<a href="contact.php" class="list-group-item">Contact Us</a>
		</div>
	</div>
	<div class="col-sm-9">
		<div class="alert alert-success" role="alert">
			Congratulations, your application was received. An Automated SMS and Email has been sent to your phone number. Kindly follow the instructions.
		</div>
		<div class="well">
			<h3>Continue Payment</h3>
			Dear <?php echo $userdet[0]->surname . " " . $userdet[0]->othernames ?>, <br>
			Your application has been received for registration, kindly proceed to make payment for the form. <br>
			Please ensure your details are well captured as shown below:</br>
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<form action="<?php echo $_SERVER['PHP_SELF']?>" method="post">
						<div class="form-group">
							<label for="email">Email:</label>
							<input name="email" class="form-control" value="<?php echo $userdet[0]->email ?>" readonly />
						</div>
						<div class="form-group">
							<label for="surname">Surname:</label>
							<input name="surname" class="form-control" readonly value="<?php echo $userdet[0]->surname ?>" />
						</div>
						<div class="form-group">
							<label for="othername">Othernames:</label>
							<input name="othernames" class="form-control" readonly value="<?php echo $userdet[0]->othernames ?>" />
						</div>

						<input type="hidden" name="regno" class="form-control" readonly value="<?php echo $userdet[0]->regno ?>" />
						<input type="hidden" name="prog" class="form-control" readonly value="<?php echo $userdet[0]->exam_type ?>" />
						<input type="hidden" name="fee_code" class="form-control" readonly value="<?php echo $userdet[0]->fee_code ?>" />
						<input type="hidden" name="prog_id" class="form-control" readonly value="<?php echo $userdet[0]->exam_type ?>" />
						<input type="hidden" name="sess" class="form-control" readonly value="<?php echo $userdet[0]->session ?>" />


						<div class="form-group">
							<label for="prog">Phone:</label>
							<input type="text" name="phone" class="form-control" readonly value="<?php echo $userdet[0]->phone ?>" />
						<div>
						
						<div class="form-group">
							<label for="prog">Programme:</label>
							<input type="text" name="prog" class="form-control" readonly value="<?php echo $userdet[0]->prog_name ?>" />
						<div>
						
						<div style="width:100%; text-align:right; font-size:1.5em; font-weight:bolder; display: block; clear:both"> <span>Amount:</span>  &#8358; <?php echo number_format($userdet[0]->fee_amount,2)?> </div>

						<button type="submit" class="btn btn-green btn-lg" style="display: block;">PayNow</button>
					</form>
				</div>
			</div>			
		</div>
</div>
	</div>
</div>
<hr>
</div>
</div>
</div>
<?php
require('footer.php')
?>