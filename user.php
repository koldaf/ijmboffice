<?php
include('lib/session.php');
include('lib/functions.php');
confirm_access();
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
            <h1 class="page-header">schoolsearch
                    <small>Home</small>
            </h1>
		</div>
		<div class="row">
			<div class="col-sm-3">
                <?php include('menu.php') ?>	
			</div>
			<div class="col-sm-9">
            	<?php if(isset($_GET['cmd'])){
					$link =  $_SERVER['PHP_SELF'];
					if($_GET['cmd'] == 'upload-news'){
						if(isset($_GET['mssg'])){
							echo '<div class="alert alert-info alert-dismissible" role="alert">
							    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								  '.de_crypt($_GET['mssg']).'
								  </div>';
						}
						
						echo ' <h1 class="page-header">schoolsearch
									<small>Upload IJMB Updates</small>
								</h1>
						
						<form id="newsUpload"  action="process.php?cmd=uploadnews" method="post">
							<div class="form-group">
								<label for="title">Title</label>
								<input type="hidden" value="'.$_SERVER['REQUEST_URI'].'" name="uri"/>
								<input type="text" class="form-control" id="title" name="title" placeholder="News Title" required>
							</div>
							<div class="form-group">
								<label for="content">News Contents</label>
								<textarea class="form-control" id="content" name="content"></textarea>
							</div>
							<button type="submit" class="btn btn-green">Upload</button>
						</form>
						<img src="img/loading.gif" class="loads"/>';
												
					}else if ($_GET['cmd'] == 'manage-news'){
						echo '<h4>Manage Uploaded News</h4>';
	$select = select_row_with_onefield('news_tbl','is_deleted','false' );
	if(countrows($select) < 1){
		echo '<div class="alert alert-danger" role="alert">
				No more news...
			</div>';
	}else{
		$count = 1;
		while($news = $select->fetch_array()) {
			echo '
				<div class="panel panel-default">
					<button class="alert alert-danger" style="float:right" value="'.$news['ref_id'].'" onClick="deletes(this.value)"> X </button>
					<div class="panel-heading" style="background:#0D7031">
						<h3 class="panel-title">'.$count++.' | '. $news['title'].'</h3>
					</div>
					<div class="panel-body" style="word-wrap: break-word">
						'.html_entity_decode(slice($news['content'])).'
					</div>
					
				</div>
			';
		}
					}
					}
	else if($_GET['cmd'] == 'manage-reg'){
		if(isset($_GET['sort'])){
		if($_GET['sort'] == 'old'){
			$bar = '#339933';
			$sort = ' Old - New';
			$all = $con->query("SELECT * FROM application_dummy WHERE status = 'active' ORDER BY ref_id ASC ");
		}else if ($_GET['sort'] == 'new'){
			$bar = '#006699';
			$sort = ' New - Old';
			$all = $con->query("SELECT * FROM application_dummy WHERE status = 'active' ORDER BY ref_id DESC ");
		}else{
			$bar = '#DB2927';
			$sort = ' Alphabetical';
			$all = $con->query("SELECT * FROM application_dummy WHERE status = 'active' ORDER BY surname ASC ");
		}
	}else{
		$bar = '#DB2927';
			$sort = 'None';
			$all = select_row_with_onefield('application_dummy','status','active');
	}
	if(isset($_GET['d'])){
		if(is_numeric($_GET['d'])){
			$_SESSION['display'] = $_GET['d'];
		}else{
			$_SESSION['display'] = 10;
		}
	}
	echo '<h4>Manage Registrations <h4>';
	echo ' <div style="float:left;">
			<h5>Sort Type: '.$sort.'</h5>
			</div>
		<div style="float:right">
			<form name="form" id="form" style="display:inline">
				<select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu(\'parent\',this,0)">
				  <option>Sort By</option>
				  <option value="'.$link.'?cmd='.$_GET['cmd'].'&sort=old">Oldest</option>
				  <option value="'.$link.'?cmd='.$_GET['cmd'].'&sort=new">Newest</option>
				  <option value="'.$link.'?cmd='.$_GET['cmd'].'&sort=alp">Alphabetical</option>
			  </select>
			</form>
			<form name="form" id="form" style="display:inline">
				<select name="jumpMenu" id="jumpMenuDisplay" onchange="MM_jumpMenu(\'parent\',this,0)">
				  <option>Showing/Page '.$_SESSION['display'].'</option>
				  <option value="'.$link.'?cmd='.$_GET['cmd'].'&d=5">5</option>
				  <option value="'.$link.'?cmd='.$_GET['cmd'].'&d=10">10</option>
				  <option value="'.$link.'?cmd='.$_GET['cmd'].'&d=15">15</option>
				  <option value="'.$link.'?cmd='.$_GET['cmd'].'&d=20">20</option>
				  <option value="'.$link.'?cmd='.$_GET['cmd'].'&d=25">25</option>
				  <option value="'.$link.'?cmd='.$_GET['cmd'].'&d=50">50</option>
				  <option value="'.$link.'?cmd='.$_GET['cmd'].'&d=100">100</option>
			  </select>
			</form>
		  </div>';
	if(countrows($all) > 0){
	//if(isset($_GET))
	$rpp = $_SESSION['display']; // results per page
	$adjacents = 4;
	if(isset($_GET['page'])){
		$page = intval($_GET["page"]);
		if($page<=0) $page = 1;
	}else{ $page = 1;}
	$reload = '?cmd='.$_GET['cmd']; //'?r=1';//
	// count total number of appropriate listings:
	$tcount = countrows($all);
	// count number of pages:
	$tpages = ($tcount) ? ceil($tcount/$rpp) : 1; // total pages, last page number
	$count = 1;
	$i = ($page-1)*$rpp;
	
	echo '<table border="1" class="table table-bordered table-hover table-responsive">
		  <tr style="background:'.$bar.'; color:#FFF">
			  <td>S/N</td>
			  <td> Name</td>
			  <td> Phone</td>
			  <td> Email</td>
			  <td> Center <br/> Location</td>
			  <td> Date </td>
			  <td> Action </td>
		  </tr>';
	while(($count<$rpp) && ($i<$tcount)) {
		$all->data_seek($i);
		$det = $all->fetch_array();
		echo '
			  <tr>
				  <td>'. $count. '</td>
				  <td>' .$det['surname'].'&nbsp;' 
						.$det['othernames'].'&nbsp; </td>
				  <td align="center">'.$det['phone'].'</td>
				  <td align="center">'.$det['email'].'</td>
				  <td align="center">'.$det['centre'].'</td>
				  <td align="center">'.$det['datetime'].'</td>
				  <td>				
				  <button value="'.en_crypt($det['ref_id']).'" class="btn btn-success" onClick="validate(this.value)" >
				  Validate Payment </button>
				  <button value="'.en_crypt($det['ref_id']).'" class="btn btn-info" onClick="reminder(this.value)" >Send Reminder </button>
				  <button value="'.en_crypt($det['ref_id']).'" class="btn btn-warning" onClick="reminder_email(this.value)" >Acceptance Email </button>
				  <button value="'.en_crypt($det['ref_id']).'" class="btn btn-danger" onClick="del(this.value)" >
				  Delete </button></td>
			  </tr>';	
	
		$i++;
		$count++;
	}
	echo '</table>';
// call pagination function from the appropriate file: pagination1.php, pagination2.php or pagination3.php
	include("lib/pagination3.php");
	echo '<div class="pagination">'.paginate_three($reload, $page, $tpages, $adjacents).'</div>';
}
else {
	echo '<p>&nbsp;</p><h1 class="bg-danger text-center"> I\'ve found nothing. </h1>';
}
	}
}else{
					echo '&lt;-- Use the menu on the left to navigate the page...';
				}
                ?>
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