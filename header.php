<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Get a straight admission into 200Level in any University of your choice. Call 07030400348"/>
	<meta name="google"/>
	<meta name="googlebot"/>
	<meta name="keywords" content="IJMB, JAMB, 200level, University, admission, University admisssion, ijmbe, ijmb, direct entry into university, gain admission, ijmb direct admission, ijmb result, ijmb registration, jamb change of course, ijmb exam schedule, <?php echo date('Y')?> IJMB Registration, JUPEB, jupeb, Jupeb registration, jupeb online, jupeb result, remedials, university remedials"/>
	<meta name="robots"/>
	<meta name="verify"/>
  	<?php 
	 	if(isset($_GET['n']) || isset($_GET['fbid'])){
			$browseNews = $con->query("SELECT * FROM news_tbl WHERE is_deleted='false' AND link_sash = '".$_GET['n']."' ORDER BY ref_id DESC");
			$news = $browseNews->fetch_array();
			echo '
			<meta property="og:url" content="http://ijmboffice.org.ng'.$_SERVER['REQUEST_URI'].'" />
			<meta property="og:type" ` content="article" />
			<meta property="og:title"    content="'.$news['title'].'" />
			<meta property="og:description"   content="Get the Latest IJMB Gist..." />
			<meta property="og:image"   content="http://ijmboffice.org.ng/ijmb_banner.jpg" />
			<meta property="fb:app_id" content="1249921001782999"/>';
		}
?>
   <title>IJMB Office</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/responsiveslides.css">
    <link rel="stylesheet" href="css/custom.css" type="text/css">
    <link rel="icon" href="img/IJMBlogo.png" media="all">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/responsiveslides.min.js"></script>
    <script src="//js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
	<script src="js/custom_app.js"></script>
	<script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>
  </head>
  <body>
  <script>
	  window.fbAsyncInit = function() {
		FB.init({
		  appId      : '1249921001782999',
		  xfbml      : true,
		  version    : 'v2.9'
		});
		FB.AppEvents.logPageView();
	  };

	  (function(d, s, id){
		 var js, fjs = d.getElementsByTagName(s)[0];
		 if (d.getElementById(id)) {return;}
		 js = d.createElement(s); js.id = id;
		 js.src = "//connect.facebook.net/en_US/sdk.js";
		 fjs.parentNode.insertBefore(js, fjs);
	   }(document, 'script', 'facebook-jssdk'));
</script>
  <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.9&appId=1249921001782999";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
   <div class="container">
    <header>
    	<div class="top_notch">
    		<div class="ltr" style="margin-top: 15px"><span >24/7 Support Lines: </span> 08089186066</div>
    		<div class="btn-group rtl social-media" role="group" aria-label="...">
    			<a href="#" class="btn btn-green"><i class="fa fa-2x fa-facebook"></i></a>
				<a href="#" class="btn btn-green"><i class="fa fa-2x fa-twitter"></i></a>
   				<a href="#" class="btn btn-green"><i class="fa fa-2x fa-google-plus"></i></a>
    		</div>
		</div>
		<nav style="display: block">
			<div class="ltr">
				<img src="img/ijmb office logo.jpg">
			</div>
			<div class="navbar-nav rtl">
				<ul class="nav nav-pills">
				  <li role="presentation"><a href="index.php">Home</a></li>
				  <li role="presentation"><a href="about.php">About</a></li>
				  <li role="presentation"><a href="news.php">News <i class="fa fa-newspaper-o"></i></a></li>
				  <li role="presentation"><a href="centers.php">Our Centers</a></li>
				  <li role="presentation"><a href="#contact">Contact Us</a></li>
				</ul>
			</div
		></nav>
	</header>
	<div class="clearfix"></div>
