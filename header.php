<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Get a straight admission into 200Level in any University of your choice. Call 08180557799"/>
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
			<meta property="og:url" content="http://schoolsearch.org.ng'.$_SERVER['REQUEST_URI'].'" />
			<meta property="og:type" ` content="article" />
			<meta property="og:title"    content="'.$news['title'].'" />
			<meta property="og:description"   content="Get the Latest IJMB Gist..." />
			<meta property="og:image"   content="http://schoolsearch.org.ng/ijmb_banner.jpg" />
			<meta property="fb:app_id" content="1249921001782999"/>';
		}
?>
   <title>SchoolSearch</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<!--link rel="stylesheet" href="bootstrap-5.3.3/css/bootstrap.min.css"-->
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/responsiveslides.css">
    <link rel="stylesheet" href="css/custom.css" type="text/css">
    <link rel="icon" href="img/IJMBlogo.png" media="all">
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/responsiveslides.min.js"></script>
    <script src="//js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
	<script src="js/bootstrap-notify.min.js"></script>
	<script src="js/custom_app.js"></script>
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
    		<div class="ltr" style="margin-top: 15px"><span >24/7 Support Lines: </span> 08180557799</div>
    		<div class="btn-group rtl social-media" role="group" aria-label="...">
    			<a href="#" class="btn btn-green"><i class="fa fa-2x fa-facebook"></i></a>
				<a href="#" class="btn btn-green"><i class="fa fa-2x fa-twitter"></i></a>
   				<a href="#" class="btn btn-green"><i class="fa fa-2x fa-google-plus"></i></a>
    		</div>
		</div>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">SchoolSearch</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="index.php">Home <span class="sr-only">(current)</span></a></li>
		<li><a href="about.php">About</a></li>
		<li><a href="news.php">News <i class="fa fa-newspaper-o"></i></a></li>
		<li><a href="centers.php">Our Centers</a></li>
		<li><a href="#contact">Contact Us</a></li>
		<li>
		<?php if(isset($_SESSION['user'])){echo '<a  href="logout.php">Log Out</a>';}else{
		echo '<a data-toggle="modal" href="#loginModal">Log In</a>';} ?>
		</li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
		
	</header>
	<div class="clearfix"></div>
