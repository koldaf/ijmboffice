<?php
	include('lib/session.php');
	require_once('lib/functions.php');
	require('header.php');
	confirm_access();
	$user = $_SESSION['user'];
	$apps = $con->query("SELECT * FROM application_dummy WHERE regno = '".$user."' LIMIT 1");
	$app = $apps->fetch_array();
	/*$app = json_decode(dlookup_json('*', 'application_dummy',"regno= '$user'"));
	$app = $app[0];*/
?>
	 	<div class="row" style="margin-top: 10px;">
			<ol class="breadcrumb">
    			<li><a href="user.php">Home</a></li>
                <li><a href="?cmd=pwdMgt">Change Password</a></li>
    			<li><a href="logout.php">Log Out</a></li>
    			<li class="active"><?php echo $_SESSION['user']?></li>
			</ol><h1 class="page-header">IJMBOFFICE
                    <small>My Payment History</small>
                </h1>
		</div>
		<div class="row">
			<div class="col-sm-3">
				 <?php include('menu.php') ?>			
			</div>
			<div class="col-sm-9">
				<?php
					$sess = dlookup('value', 'settings', "setting='session'");
					$det = json_decode(dlookup_json('*', 'application_dummy', "regno ='$user'"));
				//fetch payment history
					$exam = $det[0]->exam_type; 
					$fees = json_decode(dlookup_json('*', 'payment_transactiontb', "regno = '$user'"));
					$tr = ''; $count = 0;
					foreach ($fees as $fee){
						$tr .= '<tr>
									<td>'.++$count.'</td>
									<td>'.substr($fee->trans_id,16).'</td>
									<td>'.$fee->payment_desc.'</td>
									<td> &#8358;'.number_format($fee->amount,2).'</td>
									<td>'.$fee->payment_date.'/'.$fee->payment_time.'</td>
									<td> <a href="receipt.php?vs='.base64_encode($fee->trans_id).'&r_='.base64_encode($fee->regno).'" target="_blank" class="btn btn-success"> Print Receipt</a> </td>
								</tr>';
					}
					if($count == 0){
						$tr .= '<tr>
									<td colspan="6"><div class="alert alert-danger"><strong>Sorry!</strong> You have no transaction record</div></td>
								</tr>';
					}
					?>
					<div class="col-sm-10 col-sm-offset-">
						<table class="table table-stripped table-" id="hist">
						  <thead>
							<tr>
							  <th scope="col">#</th>
							  <th scope="col">Reference ID</th>
							  <th scope="col">Payment Description</th>
							  <th scope="col">Amount</th>
							  <th scope="col">Date/Time</th>
							  <th scope="col">&nbsp;</th>
							</tr>
							</thead>
							<tbody>
								<?php echo $tr;?>
						  </tbody>
						</table>
					</div>
						
					
			</div>
		<hr>
	  </div>
</div>
<script>
	$('document').ready(function(){
		
		$("#hist").DataTable();
		
	})
</script>
	  <?php
	require('footer.php')
?>