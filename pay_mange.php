<?php
include('lib/session.php');
include('lib/functions.php');
confirm_access();
include('header.php');
if(!isset($_SESSION['display'])){
	$_SESSION['display'] = 10;
}
//submission
if(isset($_POST['paycheck'])){
	print_r($_POST);
	//Array ( [type] => Alevel Form [from] => 2020-01-10 [to] => 2020-01-15 [paycheck] => )
	$type = prepsql($_POST['type']);
	$from = prepsql($_POST['from']);
	$to = prepsql($_POST['to']);
	$ret = '';
	if($type == '' || $from == '' || $to == ''){
		$ret = '<div class="alert alert-danger" role="alert">
					<strong>Oh snap!</strong> Fields cannot be empty.
				</div>';
	}else{
		if($type == 'all'){
			//$query = $con->query("SELECT * FROM payment_transactiontb WHERE payment_date BETWEEN '".$to."' AND '".$from."'") or die($con->error);//json_encode(dlookup_json('*', 'payment_transactiontb', "payment_date BETWEEN '$to' AND '$from' ORDER BY payment_date"));
			$query = json_decode(dlookup_json('*', 'payment_transactiontb', "payment_date BETWEEN '$to' AND '$from' ORDER BY payment_date ASC"));
			//$q = dcount('*', 'payment_transactiontb', "payment_date BETWEEN '$to' AND '$from' ORDER BY payment_date");
		}else{
			$query = json_decode(dlookup_json('*', 'payment_transactiontb', "payment_type='$type' AND (payment_date BETWEEN '$to' AND '$from' ORDER BY payment_date)"));	
			//$q = dcount('*', 'payment_transactiontb', "payment_type='$type' AND (payment_date BETWEEN '$to' AND '$from' ORDER BY payment_date)");	
		}
		/*if($q == 0){
			$ret.= '<div class="alert alert-danger" role="alert">
					<strong>Oh snap!</strong> No record was found.
				</div>';
		}*/
		//fetch from database
		$tbl='<table>
			<thead>
				<tr>
					<th>#</th>
					<th>Regno</th>
					<th>Surname</th>
					<th>Othername</th>
					<th>Payment Ref</th>
					<th>Payment Type</th>
					<th>Amount</th>
				</tr>
			</thead>
			<tbody>
		';$count = 0;
		foreach($query as $pay){
			$tbl .= '<tr>
						<td>'.++$count.'</td>
						<td>'.$pay->regno.'</td>
						<td>'.$pay->regno.'</td>
						<td>'.$pay->regno.'</td>
						<td>'.$pay->pay_ref.'</td>
						<td>'.$pay->payment_desc.'</td>
						<td>'.number_format($pay->payment_amount,2).'</td>
					</tr>';
		}
		/*while($pay = $query->fetch_array()){
			$tbl .= '<tr>
						<td>'.++$count.'</td>
						<td>'.$pay['regno'].'</td>
						<td>'.$pay['regno'].'</td>
						<td>'.$pay['regno'].'</td>
						<td>'.$pay['pay_ref'].'</td>
						<td>'.$pay['payment_desc'].'</td>
						<td>'.number_format($pay['payment_amount'],2).'</td>
					</tr>';
		}*/
		$tbl .= '</tbody></table>';
	}

}
?>
<div class="row" style="margin-top: 10px;">
	<ol class="breadcrumb">
		<li><a href="user.php">Home</a></li>
		<li><a href="?cmd=pwdMgt">Change Password</a></li>
		<li><a href="logout.php">Log Out</a></li>
		<li class="active"><?php echo $_SESSION['user']?></li>
	</ol>
	<h1 class="page-header">IJMBOFFICE
			<small>Payment Management</small>
	</h1>
</div>
<div class="row">
	<div class="col-sm-3">
		<?php include('menu.php') ?>	
	</div>
	<div class="col-sm-9">
		<form class="form" method="post" action="<?php echo $_SERVER['PHP_SELF']?>">
			<div class="form-group col-sm-3">
				<label for="type">Payment Type: </label><select class="form-control" name="type">
					<?php
						$opt ='';
						$pay_type = json_decode(dlookup_json('DISTINCT payment_desc', 'payment_transactiontb'));
						foreach($pay_type as $types){
							$opt .= '<option value="'.$types->payment_desc.'">'.$types->payment_desc.'</option>';
						}
					?>
					<option value="">Filter by Payment Type</option>
					<option value="all">All</option>
					<?php echo $opt; ?>
				</select>
			</div>
			<div class="form-group col-sm-3">
				<label for="from">Starting Date: </label>
				<input type="date" name="from" class="form-control" placeholder="Select starting Date">
			</div>
			<div class="form-group col-sm-3">
				<label for="to">Ending Date: </label>
				<input type="date" name="to" class="form-control" placeholder="Select ending Date">
			</div>
			<div class="form-group col-sm-1">
				<br/>
				<button type="submit" name="paycheck" class="btn btn-success">Go</button>
			</div>
		</form>
		<div class="row">
			<?php if(!empty($ret)) echo $ret; ?>
			<?php if(!empty($tbl)) echo $tbl; ?>
		</div>
	</div>
</div>