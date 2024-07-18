<?php
include('lib/session.php');
include('lib/functions.php');
confirm_access();
if($_SESSION['role'] != 'Student'){
	redirect('logout.php');
	exit;
}
$user = $_SESSION['user'];
include('header.php');
if(!isset($_SESSION['display'])){
	$_SESSION['display'] = 10;
}
?>
<script type="text/javascript">
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
 </script>
<div class="row" style="margin-top: 10px;">
			<ol class="breadcrumb">
    			<li><a href="user.php">Home</a></li>
                <li><a href="?cmd=pwdMgt">Change Password</a></li>
    			<li><a href="logout.php">Log Out</a></li>
    			<li class="active"><?php echo $_SESSION['user']?></li>
			</ol>
            <h1 class="page-header">IJMBOFFICE
                    <small>Payment</small>
            </h1>
		</div>
		<div class="row">
			<div class="col-sm-3">
                <?php include('menu.php') ?>	
			</div>
			<div class="col-sm-9">
            	<div class="page-header">
					<h1><small>Hello, </small><?php echo dlookup('surname', 'application_dummy', "email = '$user' ") ?><small> what Payment do you want to make today?</small></h1>
				</div>
				<div class="col-sm-6 col-sm-offset-3">
					<form>
						<input name="email" value="<?php echo $user?>" type="hidden" readonly/>
						<input name="email" value="<?php echo $user?>" type="hidden" readonly/>
					</form>
					<a href="#" class="btn btn-success"><i class="fa fa-2x fa-money"></i> Acceptance Payment</a>
				</div>
			</div>
		</div>
		<hr>
		<hr>
	  </div>
<script>

</script>
<?php
include('footer.php');
?>
<script>
function validate(x){
			if(confirm("Are you sure you want to validate this entry?")){
				var param = {url:'do_set.php?cmd=validate&id='+x};
				$.post(param.url, param.id, function(y){
					alert(y);
					//window.location.reload()
					//console.log(y);
				});
			}
		}
function reminder(x){
			if(confirm("Are you sure you want to send a reminder SMS to this entry?")){
				var param = {url:'do_set.php?cmd=remind&id='+x};
				$.post(param.url, param.id, function(y){
					alert(y);
					//window.location.reload()
					//console.log(y);
				});
			}
		}
function reminder_email(x){
			if(confirm("Are you sure you want to send a reminder Email to this entry?")){
				var param = {url:'do_set.php?cmd=remind_email&id='+x};
				$.post(param.url, param.id, function(y){
					alert(y);
					//window.location.reload()
					//console.log(y);
				});
			}
		}
function del(x){
			if(confirm("Are you sure you want to Delete this entry?" + x)){
				var param = {url:'do_set.php?cmd=del&id='+x};
				$.post(param.url, param.id, function(y){
					alert(y);
					window.location.reload()
					//console.log(y);
				});
			}
		}
</script>