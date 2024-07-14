<?php
require_once('lib/functions.php');
require('header.php');
?>
<div class="row" style="display: block">
	<ul class="rslides">
		<li><img src="img/1.png" alt=""></li>
		<li><img src="img/2.png" alt=""></li>
		<li><img src="img/3.png" alt=""></li>
	</ul>
</div>
<hr />
<div class="row">
	<div class="col-sm-8">
		<h1>Welcome</h1>
		<p>A'level programs herein are Federal Government Educational Programme that is motivated, controlled and run by Federal University's. These programs are advanced level educational programme that qualifies candidates to secure admission into 200 Level in any Nigeria and Foreign Universities through Direct Entry.</p>
		<p>These programs were established as alternatives to JAMB (now UTME) which was (is) the conventional means of getting the secondary school leavers into the university.</p>
		<p>The board was quick to identify the incessant problem of qualified admission seekers, not being able to secure admission through the convention paradigm. This problem continued till today. Statistically, only about 20% of annual qualified admission seekers are able to secure admission into the university of their choice.</p>
		<p>IJMBE, JUPEB, NURSING and NCE are fully certified by Nigeria University Commission (NUC) as an A'level programme that serves as a mode of entry into the university today, statistically as its provides a unique platform for realizing the dream of university education-even in a more efficient way than JAMB because it aids in securing admission into 200 LEVEL upon completion of the programme.</p>
		<p>Interested Candidate's are expected to select any THREE (3) A/L SUBJECTS (English Compulsory) related to their course of study in the university. Candidates would then be lectured on these subjects for a period of less than a year and then write the final examination. On completion of the programme, Candidates can therefore use their result's to secure admission into 200 level in any Nigeria university via Direct Entry. Interested Candidate can confirm from Jamb brochure to see IJMBE/JUPEB/NURSING/NCE as a direct entry requirement&nbsp;into&nbsp;200level.</p>
	</div>
	<div class="col-sm-4">
		<div class="panel">
			<div class="panel-heading btn-green text-center" style="color: white">
				<h4>IJMB Updates</h4>
			</div>
			<marquee behavior="alternate" direction="up" scrollamount="2">
				<?php $browseNews = $con->query("SELECT * FROM news_tbl WHERE is_deleted='false' ORDER BY ref_id DESC LIMIT 1");
				if (countrows($browseNews) < 1) {
					echo '<h3 class="alert alert-danger">No more News</h3>';
				} else {
					while ($news = $browseNews->fetch_array()) {
						echo '<div style="word-wrap:break-word"><h4>' . html_entity_decode($news['title']) . '</h4>
					  <p>' . slice(html_entity_decode($news['content'])) .
							'</p><a href="news.php?n=' . $news['link_sash'] . '" class="btn btn-green">Read More</a></div>';
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
		<div class="col-sm-8"><img src="img/black-female-student-affirmative-action.jpg" class="img-responsive" /></div>
		<div class="col-sm-4">
			<h1 style="font-size: 3em;"> You can be among over 200,000 candidates, who secure admission into the University of their choice annually</h1>
			<p>&nbsp;</p>
			<p><a class="btn btn-green btn-lg" data-toggle="modal" href="#applynow" role="button">Apply Now</a>
			</p>
		</div>
	</div>
</div>
<hr>
</div>
<script>
	$(document).ready(function(e) {
		$('#applynow').modal('show');
		console.log(e);
	});
</script>
<?php include('footer.php') ?>