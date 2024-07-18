<?php
	include('lib/session.php');
	require_once('lib/functions.php');
	require('header.php');
	confirm_access();
	$user = $_SESSION['user'];
	$apps = $con->query("SELECT * FROM application_dummy WHERE regno = '".$user."' LIMIT 1");
	$app = $apps->fetch_array();
	
?>
	 	<div class="row" style="margin-top: 10px;">
			<ol class="breadcrumb">
    			<li><a href="user.php">Home</a></li>
                <li><a href="?cmd=pwdMgt">Change Password</a></li>
    			<li><a href="logout.php">Log Out</a></li>
    			<li class="active"><?php echo $_SESSION['user']?></li>
			</ol><h1 class="page-header">IJMBOFFICE
                    <small>Application Form</small>
                </h1>
		</div>
		<div class="row">
			<div class="col-sm-3">
				 <?php include('menu.php') ?>			
			</div>
			<div class="col-sm-9">
				<ul class="nav nav-tabs">
				  <li><a data-toggle="tab" href="#bio">Bio Data</a></li>
				  <li><a data-toggle="tab" href="#exam">Exam Types &amp; Course</a></li>
				  <li><a data-toggle="tab" href="#quali">Qualification</a></li>
				  <li><a data-toggle="tab" href="#parents">Parents and Guardian</a></li>
				  <li><a data-toggle="tab" href="#attes">Attestation</a></li>
				  <li><a data-toggle="tab" href="#print">Print</a></li>
				</ul>
			  <div class="tab-content">
				<div id="bio" class="tab-pane fade in active">
				  <h3>Bio Data</h3>
				  <form role="form" id="bdata"  method="post" action="do_set.php?cmd=b_data">
					  <input type="hidden" class="form-control" name="regno" id="regno" placeholder="Enter email" value="<?php echo $app['regno'] ?>" readonly>
					  
					  <div class="col-md-6">
						<div class="form-group">
						  <label for="sname"><span class="glyphicon glyphicon-user"></span> Surname</label>
						  <input type="text" class="form-control" name="sname" id="sname"  value="<?php echo $app['surname'] ?>" readonly>
						</div>
						 <div class="form-group">
						  <label for="oname"><span class="glyphicon glyphicon-user"></span> Othernames</label>
						  <input type="text" class="form-control" name="oname" id="oname" placeholder="Othernames" value="<?php echo $app['othernames'] ?>" readonly>
						</div>
						 <div class="form-group">
						  <label for="dob"> Date of Birth</label>
						  <input type="date" class="form-control" name="dob" id="dob" placeholder="Date of Birth" required>
						</div>
						 <div class="form-group">
						  <label for="center">Gender</label>
						  <select name="sex" class="form-control" id="sex" required>
							<option value="">Select Gender</option>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
						  </select>
						</div>
						  
					</div>
					<div class="col-md-6">
						<div class="form-group">
						  <label for="phone"><span class="glyphicon glyphicon-phone"></span> Phone</label>
						  <input type="tel" class="form-control" name="phone" id="phone" placeholder="Phone Number" value="<?php echo $app['phone'] ?>" readonly>
						</div>
						 <div class="form-group">
						  <label for="email"><span class="glyphicon glyphicon-envelope"></span> Email</label>
						  <input type="email" class="form-control" name="email" id="email" placeholder="Enter email" value="<?php echo $app['email'] ?>" readonly>
						</div>
						<div class="form-group">
							<label for="country">Nationality</label>
						  <select name="country" class="form-control" id="country" required>
							<option value="">Select Country</option>
							<?php countries(); ?>
						  </select>
						</div>
						<div class="form-group">
							<label for="state">State of Origin</label>
						  	<select name="state" class="form-control" id="state" required>
								<option value="">Select State</option>
								<?php states(); ?>
						  	</select>
						</div>
						
					</div>

					<div id="ms"></div>
					<button type="submit" name="login" id="sub_" class="btn my-theme-btn center-block"> Save &amp; Continue </button>
				  </form>
					
				</div>
				<div id="exam" class="tab-pane fadein">
					<h3>Examination Type and Course</h3>
					<div class="col-md-6 col-md-offset-3">
						<form role="form" id="frm_exams"  method="post" action="do_set.php?cmd=exams">
							<input type="hidden" class="form-control" name="regno" id="regno" placeholder="Enter email" value="<?php echo $app['regno'] ?>" readonly>
							
							<div class="form-group">
							  <label for="center"><span class="glyphicon glyphicon-edit"></span> Exam Type</label>
								<input type="text" class="form-control" name="exam_type" id="exam_type" value="<?php echo $app['exam_type'] ?>" readonly>
								
							  <!--<select name="exam_type" class="form-control" id="exam_type" required>
								<option value="">Select preferred center</option>
								<option value="Jupeb">Jupeb</option>
								<option value="IJMB">IJMB</option>
								<option value="Cambridge">Cambridge Exams</option>
							  </select>-->
							</div>
							<div class="form-group">
							  <label for="center"><span class="glyphicon glyphicon-globe"></span> Preferred Center</label>
								<input type="text" class="form-control" name="center" id="center" value="<?php echo $app['centre']?>" readonly>
							  <!--<select name="center" class="form-control" id="center" required>
								<option value="">Select preferred center</option>
								<option value="Port Harcourt">Port Harcourt</option>
								<option value="Ilorin">Ilorin</option>
								<option value="Ibadan">Ibadan</option>
								<option value="Lagos">Lagos</option>
								<option value="Abuja">Abuja</option>
								<option value="Abuja">Enugu</option>
							  </select>-->
							</div>
							<div class="form-group">
								<label for="course">Course</label>
								<input type="text" class="form-control" name="course" required placeholder="Course of Choice">
							</div>
							<button type="submit" id="sub_1" name="exam_sa" class="btn my-theme-btn center-block"> Save &amp; Continue </button>
						</form>
					</div>
				  </div>
				<div id="quali" class="tab-pane fade">
					<div class="row">
						<div class="col-md-4 offset-md-2">
							<select id="no_of_sitting" class="form-control">
								<option value="" selected>No of Sitting</option>
								<option value="1">1 sitting</option>
								<option value="2">2 sittings</option>
							</select>
							<hr>
						</div>
					</div>
						<div class="col-md-5" id="f_sit">
							<h4>1<sup>st</sup> Sitting </h4>
							<hr/>
						<form role="form" id="frm_exams_fsit"  method="post" action="do_set.php?cmd=exams_1sit">
							<input type="hidden" class="form-control" name="regno" id="regno" placeholder="Enter email" value="<?php echo $app['regno'] ?>" readonly>
							
						<div class="form-group">
						  <label for="exam_type">Examination Type</label>
							<select name="f_exam_type" class="form-control" required> 
								<option value="" selected>Examination Type</option>
								<option value="WASSCE (May/June)">WASSCE (May/June)</option>
								<option value="WASSCE (Nov/Dec)">WASSCE (Nov/Dec)</option>
								<option value="NECO (May/June)">NECO (May/June)</option>
								<option value="NECO (Nov/Dec)">NECO (Nov/Dec)</option>
								<option value="NABTEB">NABTEB</option>
							</select>
						</div>
						<div class="form-group">
						  <label for="f_exam_no">Examination Number </label>
							<input type="text" class="form-control" name="f_exam_no" id="f_exam_no" placeholder="Examination No" required>
						</div>
						<div class="form-group">
						  <label for="f_exam_year">Examination Year</label>
							<select name="f_exam_year" class="form-control" required> 
								<option value="" selected>Examination Year</option>
								<?php
									for($i=date('Y'); $i >= 1990; $i--){
										echo '<option value="'.$i.'">'.$i.'</option>';
									}
								?>
							</select>
						</div>
						 <div class="form-group">
						  <table class="table table-condensed table-responsive">
							 <?php
							  	$tab = '';
							  	for($i = 1; $i <= 9; $i++){
									$tab .= '<tr>
											<td>'.$i.'</td>
											<td>
												<select name="f_sub[]" class="form_control">
													<option value="" selected>Select Subject</option>
													'.olevelsubjects().'
												</select>
											</td>
											<td>
												<select name="f_grade[]" class="form_control">
													<option value="" selected>Select Subject</option>
													'.olevelgrade().'
												</select>
											</td>
										</tr>';
								}
							  	echo $tab;
							  ?>
						  </table>	 
						</div>
						<button type="submit" id="sub_2" name="exam_sfs" class="btn my-theme-btn center-block"> Save 1st Sitting &amp; Continue </button>
							</form>
					</div>
					
					<div class="col-md-5 pull-right" id="s_sit" style="display: none">
						<h4>2<sup>nd</sup> Sitting </h4>
							<hr/>
						<form role="form" id="frm_exams_2sit"  method="post" action="do_set.php?cmd=exams_1sit&no=2">
							<input type="hidden" class="form-control" name="regno" id="regno" placeholder="Enter email" value="<?php echo $app['regno'] ?>" readonly>
							
							<div class="form-group">
							  <label for="exam_type">Examination Type</label>
								<select name="f_exam_type" class="form-control" required> 
									<option value="" selected>Examination Type</option>
									<option value="WASSCE (May/June)">WASSCE (May/June)</option>
									<option value="WASSCE (Nov/Dec)">WASSCE (Nov/Dec)</option>
									<option value="NECO (May/June)">NECO (May/June)</option>
									<option value="NECO (Nov/Dec)">NECO (Nov/Dec)</option>
									<option value="NABTEB">NABTEB</option>
								</select>
							</div>
						<div class="form-group">
						  <label for="f_exam_no">Examination Number </label>
							<input type="text" class="form-control" name="f_exam_no" id="f_exam_no" placeholder="Examination No" required>
						</div>
						<div class="form-group">
						  <label for="f_exam_year">Examination Year</label>
							<select name="f_exam_year" class="form-control" required> 
								<option value="" selected>Examination Year</option>
								<?php
									for($i=date('Y'); $i >= 1990; $i--){
										echo '<option value="'.$i.'">'.$i.'</option>';
									}
								?>
							</select>
						</div>
						 <div class="form-group">
						  <table class="table table-condensed table-responsive">
							 <?php
							  	$tab = '';
							  	for($i = 1; $i <= 9; $i++){
									$tab .= '<tr>
											<td>'.$i.'</td>
											<td>
												<select name="f_sub[]" class="form_control">
													<option value="" selected>Select Subject</option>
													'.olevelsubjects().'
												</select>
											</td>
											<td>
												<select name="f_grade[]" class="form_control">
													<option value="" selected>Select Subject</option>
													'.olevelgrade().'
												</select>
											</td>
										</tr>';
								}
							  	echo $tab;
							  ?>
						  </table>	 
						</div>
							<button type="submit" id="sub_3" name="exam_ss" class="btn my-theme-btn center-block"> Save 2nd Sitting &amp; Continue </button>
						</form>
					</div>
					
				</div>
				<div id="parents" class="tab-pane fade">
				  <h3>Parent/Guardian</h3>
				  <form role="form" id="frm_parent"  method="post" action="do_set.php?cmd=parent">
					  <input type="hidden" class="form-control" name="regno" id="regno" placeholder="Enter email" value="<?php echo $app['regno'] ?>" readonly>
					  
					<div class="col-md-6 col-md-offset-3">
						<div class="form-group">
						  <label for="g_name"><span class="glyphicon glyphicon-user"></span> Fulname</label>
						  <input type="text" class="form-control" name="g_name" id="g_name" placeholder="Fullname" required>
						</div>
						 <div class="form-group">
						  <label for="g_occu">Occupation</label>
						  <input type="text" class="form-control" name="g_occu" id="g_occu" placeholder="Occupation" required>
						</div>
						 <div class="form-group">
						  <label for="phone"><span class="glyphicon glyphicon-phone"></span>Phone</label>
						  <input type="tel" class="form-control" name="g_phone" id="g_phone" placeholder="Phone Number" required>
						</div>
					
						<div class="form-group">
						  <label for="g_address"><span class="glyphicon glyphicon-user"></span> Address</label>
							<input type="text" name="g_address" id="g_address" class="form-control" required placeholder="Address">
						</div>
						<button type="submit" id="sub_4" name="exam_ss" class="btn my-theme-btn center-block"> Save &amp; Continue </button>
					</div>
					  
					</form>
				</div>
				<div id="attes" class="tab-pane fade">
				  <h3>Attestation</h3>
				  I, here by attest that all the information I have provided are true and valid. A'level Link can now begin my registration processing with these.
					
					<button id="f_submit" class="btn btn-block btn-center btn-success">Signature and Submit</button>
				</div>
				<div id="print" class="tab-pane fade">
				  <h3>My Printout</h3>
				  	<div class="col-md-6 col-md-offset-3" id="prints">
						<input type="hidden" class="form-control" name="regno" id="regno" placeholder="Enter email" value="<?php echo $app['regno'] ?>" readonly>
						<p>Here is your form ID: <?php echo $app['regno'] ?></p>
						<p>Use the form ID  as username and your surname as password to login into your portal</p>
						<form action="https://ijmboffice.org.ng/print.php" method="post" target="_blank">
							<button type="submit" class="btn btn-green btn-lg" name="regno" id="regno"  value="<?php echo $app['regno'] ?>">Print Completed  Form </button>
							
							
						</form>
					</div>
				</div>
			  </div>
			</div>
            
		</div>
		<hr>
		<div class="row">
			<!--<div class="well col-sm-12">
				Apply for your Alevel registration now... Simply Click Here to Download the Form
				<a href="#" class="btn btn-green btn-lg">Download Alevel Form </a>
				
				
			</div>-->
		</div>
		<hr>
	  </div>
<script>
	$('document').ready(function(){
		$('#no_of_sitting').on('change', function(){
			if($('#no_of_sitting').val() == 2){
				$('#s_sit').fadeIn('slow');
				console.log("2 sittings");
			}else{
				$('#s_sit').fadeOut('slow');
			}
		});
		
		
	})
</script>
	  <?php
	require('footer.php')
?>