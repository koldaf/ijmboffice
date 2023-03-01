<?php
	//Get User Details
	$user = $_SESSION['user'];
	//check user roles...
	$roledet = $con->query("SELECT * FROM user_role_tbl AS user INNER JOIN role_tbl AS role ON user.role_id = role.role_id WHERE user.email = '".$user."' AND user.status = 'active' AND role.status = 'active'");
	if(countrows($roledet) > 0){
		echo '<div class="panel-heading  text-center" style="background:#0D7031">
                        <h4><i class="fa fa-fw fa-anchor"></i> My Menu </h4>
                    </div>';
					$count = 0;
					$link = $_SERVER['PHP_SELF'];
						while($roledets = $roledet->fetch_assoc()){
							$role = role($roledets['role_id']);
							echo '
								<div class="panel-heading">
								  <h4 class="panel-title">
									<a data-toggle="collapse" href="#collapse'.$count.'">'.$role['role'].'</a>
								  </h4>
								</div>
								<div id="collapse'.$count++.'" class="panel-collapse collapse">
								<div class="list-group">';
								$sub = $con->query("SELECT * FROM role_menu WHERE role_id = '".$roledets['role_id']."'
													AND status = 'active'") or die($con->error);
								if(countrows($sub) < 1){
									echo 'No Menu';
								}else{
									while($menu = $sub->fetch_array()){
										echo '<a href="?cmd='.$menu['cmd'].'" title="'.$menu['tip'].'" 
											class="list-group-item"> '.$menu['menu_caption'].'</a>';
									}
								}
								
								echo '		
								</div></div>
							';
							//echo '<a href="'.$_SERVER['PHP_SELF'].'?d='.$_GET['d'].'&r='.en_crypt($roledets['role_id']).'" class="list-group-item">'.$role['role'].'</a>';
						}
	}else{
		echo $con->error;
	}
?>