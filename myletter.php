<?php
include('lib/session.php');
include('lib/functions.php');
$regno =$_SESSION['user']
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
	.bg{
		background: url("img/black-female-student-affirmative-action.jpg") cover no-repeat;
		
	}
</style>

<div class="container">
	<div class="row">
		<center>
			<img src="img/ijmb office logo.jpg"  width="300" height="80" > 
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
				<h3 class="panel-title text-center">IJMBOFFICE Admission Letter</h3>
			</div>
			<div class="panel-body">
				<?php $app = json_decode(dlookup_json("*","app_biodata","regno='$regno'"))?>
				<div class="row">
					<div class="letter-block">
						<p class="pull-right"><?php echo date('d - M - Y')?></p>
						<?php echo '<strong>'. $regno .'</strong><br>'.
							$app[0]->surname.' '.$app[0]->othernames .'<br/>'.
							$app[0]->phone.'<br/>'.
							$app[0]->email
						?><br/>
					</div>
					<div class="letter-block bg">
						<?php 
							$title = dlookup('sex', 'app_biodata', "regno = '$regno'");
							if($title == 'Male')
								$sal = "Mr";
							else
								$sal = "Miss";
							
						$prog = dlookup('exam_type', 'app_exam', "regno = '$regno'");
/*
IJMB
Acceptance #20,000 
Tuition fee is#100,000 
Course material #25,000
Hostel fee #35,000*/

/*JUPEB
	Form fee #10,000
Acceptance #20,000
Tuition fee #120,000
Course material #35,000
Hostel fee #35,000*/
						if($prog == 'JUPEB'){
							$fee = array('Tuition' => 120000, 'Course Material'=>35000,'Accommodation'=>35000, 'Total'=>190000);
						}else{
							$fee = array('Tuition' => 100000, 'Course Material'=>25000,'Accommodation'=>35000, 'Total'=>160000);
						}
						?>
						Dear <?php echo $sal .' '.$app[0]->surname ?>,
						<h5><strong>Offer of Provisional Admission for <?php echo strtoupper($prog) ?> A'Level Programme</strong></h5>
						<p>I am pleased to inform you that you have been offered a provisional Admission to Seat of Legends Academy at No 80, Agba Dam Road, Opposite Bishop Smith Memorial Anglican church, Ilorin, Kwara State Nigeria.</p>
						<div class="row">
							<div class="col-sm-4 col-xs-4">Mode of Entry</div>
							<div class="col-sm-8 col-xs-4"> O'Level</div>
						</div>
						<div class="row">
							<div class="col-sm-4 col-xs-4">Duration</div>
							<div class="col-sm-8 col-xs-4">9 Months</div>
						</div>
							<strong>Fee breakdown is as follows:</strong>
							<?php 
								foreach($fee as $fees => $value){
									echo '<div class="row">
									<div class="col-sm-4 col-xs-4">'.$fees.'</div>
									<div class="col-sm-8 col-xs-4"> &#8358; '.number_format($value,2).'</div>
									</div>';
								}
							?>
							<p>Kindly accept my congratulations on your admission. I look forward to receiving you as a student of this promising programme.</p>
						<p>
						Yours Sincerely <br>
							<img src="img/prince.jpg" alt="Sign" width="80px" height="50px"/> <br>
						Abiola Sa&acute;eed King
						</p>
						</div>
						
					</div>
					
				</div>
			</div>
	<div class="row text-center">
		<small>this form was generated automatically from IJMBOFFICE platform.</small>
	</div>
</div>