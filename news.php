<?php
	error_reporting(0);
	require_once('lib/functions.php');
	require('header.php')
?>
	 	<div class="row" style="margin-top: 10px;">
			<ol class="breadcrumb">
    			<li><a href="index.php">Home</a></li>
    			<li><a href="#">News</a></li>
    			<li class="active">IJMB News</li>
			</ol><h1 class="page-header">IJMBOFFICE
                    <small>IJMB News</small>
                </h1>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<div class="list-group">
                    <a href="news.php" class="list-group-item active">IJMB News</a>
                    <a href="index.php" class="list-group-item">Home</a>
                    <a href="about.php" class="list-group-item">About IJMB</a>
                    <a href="contact.php" class="list-group-item">Contact Us</a>
                </div>			
			</div>
			<div class="col-sm-6">
				 <?php
					if(isset($_GET['n']) || isset($_GET['fbid'])){
						
						$browseNews = $con->query("SELECT * FROM news_tbl WHERE is_deleted='false' AND link_sash = '".$_GET['n']."' OR ref_id = '".$_GET['fbid']."' ORDER BY ref_id DESC");
					}else{
				  $browseNews = $con->query("SELECT * FROM news_tbl WHERE is_deleted='false' ORDER BY ref_id DESC");
					}
		  		  if(countrows($browseNews) < 1){
					  echo '<h3 class="alert alert-danger">No more News</h3>';
				  }else{
					  $news = $browseNews->fetch_array();
					 
				  
		?>
                <h2><?php echo $news['title']?></h2>
                <div style="word-wrap:break-word"><p><?php echo html_entity_decode($news['content'])?></p></div>
           		<?php
				  }
           ?>
           <div class="fb-share-button" data-href="https://ijmboffice.org.ng<?php echo '/news.php?fbid='.$news['ref_id']?>" data-layout="button_count" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fijmboffice.org.ng<?php echo rawurlencode('/news.php?fbid='.$news['ref_id'])?>&amp;src=sdkpreparse">Share</a></div>
           <!--<div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-numposts="5"></div>-->
           </div>
            <div class="col-sm-3">
				<div class="list-group" style="word-wrap:break-word">
                    <a href="news.php" class="list-group-item active">Recent Updates</a>
                     <?php
					$all = $con->query("SELECT * FROM news_tbl WHERE  is_deleted='false' ORDER BY ref_id DESC");
					if(countrows($all) < 1){
						echo '<h3 class="alert alert-danger" style="style="word-wrap:break-word"">No news yet</h3>';
					}else{
						while($link = $all->fetch_assoc()){
							echo '<a href="?n='.$link['link_sash'].'" class="list-group-item">'.$link['title'].'</a>';
						}
					}
				?>
                </div>	
                		
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="well col-sm-12">
				Apply for your IJMB registration now... Simply Click Here to Download the Form
				<a href="#" class="btn btn-green btn-lg">Download IJMB Form </a>
			</div>
		</div>
		<hr>
	  </div>
	  <?php
	require('footer.php')
?>