<?php
require('lib/session.php');
require('lib/functions.php');
//confirm_admin();
if (isset($_SERVER['HTTP_X_REQUESTED_WITH'])){
		//redirect('index.php?r=404');
		//die();
		print_r($_REQUEST);
}else{
	/*News Upload*/
  if(isset($_GET['cmd']) && $_GET['cmd'] == 'uploadnews'){
	  $user = $_SESSION['admin'];
	  $title = prepsql($_POST['title']);
	  $content = prepsql($_POST['content']);
	  $backlink = $_POST['uri'];
	  if(null($title) || null($content)){
			$rets['mssg'] = '
								Error! Complete all fields
							';
		}else{
			//check if title exists
			$check = select_row_with_twofields('news_tbl','title',$title,'is_deleted','false');
			if(countrows($check)>0){
				$rets['mssg'] = '
								Error! A news with similar title have been uploaded...
							';
			}else{
				$slug = create_slug($title);
				//start insertions
				$insert = "INSERT INTO news_tbl (title, content, link_sash, posted_by, datetime) VALUES('".$title."','".$content."','".$slug."','".$_SESSION['admin']."', NOW())";
				if($con->query($insert)){
					$rets['success'] = true;
					$rets['mssg'] = '
								Success! News was uploaded Successfully.
							';
				}else{
					$rets['mssg'] = '
								Error! There was an error uploading the news, <br/> Please try again later 
							';
				}
			}
		}$mssg =en_crypt($rets['mssg']);
		redirect($backlink.'&mssg='.$mssg);
		
  }else if(isset($_GET['cmd']) && $_GET['cmd'] == 'uploadevent'){
	  	/*Event Upload*/
	   $eTitle = prepsql($_POST['title']);
		$eDescription = prepsql($_POST['content']);
		$date = prepsql($_POST['date']);
		$time = prepsql($_POST['time']);
		$backlink = $_POST['uri'];
		//do validation
		if(null($eTitle) || null($eDescription) || null($date) || null($time)){
			$rets['mssg']= '
								Error! Complete all fields to upload an event
							';
		}else{
			//check if date is in the future
			$fixeddate = strtotime($date.' '.$time);
			if($fixeddate < time()){
				$rets['mssg'] = '
								Error! Event must be in the future time...
							';
			}else{
				//check against double submission
				$check = select_row_with_twofields('event_tbl','title', $eTitle, 'is_deleted', 'false');
				if(countrows($check) > 0){
					$rets['mssg']= '
								Error! Similar Event have been posted... Please edit Title and Contents
							';
				}else{
				//start insertion
				$insert = "INSERT INTO event_tbl(title, content, fixeddate, posted_by, posted_date) VALUES ('".$eTitle."', '".$eDescription."', '".$date.' '.$time."', '".$_SESSION['admin']."', NOW())";
				if($con->query($insert)){
					$rets['success'] = true;
					$rets['mssg'] = '
								Success! Event was successfully Uploaded
							';
				}else{
					$rets['mssg']='
								Error! Something unexpected happened, if this error persist, contact the web admin.
							';
				}
				
			}
			}
		}
  }
  		$mssg =en_crypt($rets['mssg']);
		redirect($backlink.'&mssg='.$mssg);
}