<?php
	require_once('lib/functions.php');
	require('header.php');
?>
		<div class="row" style="display: block">
			<ul class="rslides">
			  <li><img src="img/img1.jpg" alt=""></li>
			  <li><img src="img/img2.jpg" alt=""></li>
			  <li><img src="img/img3.jpg" alt=""></li>
			</ul>
		</div>
		<hr/>
		<div class="row">
			<div class="col-sm-8">
				<h1>Welcome</h1>
				<p><strong><abbr title="Interim Joint Matriculation Board Examination">IJMBE</abbr></strong>  is a Federal Government Educational Programme that is motivated, controlled and run by <strong>Amadu Bello University, Zaria</strong>. IJMBE is an advanced level educational programme that qualifies a candidate to secure admission into 200 Level in any Nigeria and Foreign Universities through Direct Entry</p>
				<p>
					IJMB was established in 1976 as an alternative to JAMB (now UTME) which was (is) the conventional means of getting the secondary school leavers into the university. The board was quick to identify the incessant problem of qualified admission seekers, not being able to secure admission through the convention paradigm. This problem still continued till today. Statistically, only about 20% of annual qualified admission seekers are able to secure admission into the university of their choice.<a href="about.php" title="read more about IJMB">Read More</a></p>
			</div>
			<div class="col-sm-4">
				<div class="panel">
					<div class="panel-heading btn-green text-center" style="color: white">
						<h4>IJMB Updates</h4>
					</div>
					<marquee behavior="alternate" direction="up" scrollamount="2">
						<?php $browseNews = $con->query("SELECT * FROM news_tbl WHERE is_deleted='false' ORDER BY ref_id DESC LIMIT 1");
		  		  if(countrows($browseNews) < 1){
					  echo '<h3 class="alert alert-danger">No more News</h3>';
				  }else{
					  while($news = $browseNews->fetch_array()){
					  echo '<div style="word-wrap:break-word"><h4>'.html_entity_decode($news['title']).'</h4>
					  <p>'.slice(html_entity_decode($news['content'])).
						  '</p><a href="news.php?n='.$news['link_sash'].'" class="btn btn-green">Read More</a></div>';
				  }
				  }
		?>
                        
					</marquee>
					
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="jumbotron" style="overflow: hidden">
				<div class="col-sm-4"><img src="img/ij.png" class="img-responsive"/></div>
				<div class="col-sm-8">
					<h1>You can be among over 200,000 candidates, who secure admission into the University of their choice annually</h1>
					<p>&nbsp;</p>
					<p><a class="btn btn-green btn-lg" data-toggle="modal" href="#applynow" role="button">Apply Now</a>
					</p>
				</div>
			</div>
		</div>
		<hr>
	  </div>
<script>
$(document).ready(function(e){
	$('#applynow').modal('show');
	console.log(e);
});
</script>
<?php include('footer.php')?>