<!-- Modal -->

  <div class="modal fade" id="loginModal" role="dialog">

    <div class="modal-dialog">



      <!-- Modal content-->

      <div class="modal-content">

        <div class="modal-header">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 style="color:red;"><span class="glyphicon glyphicon-lock"></span> Login</h4>

        </div>

        <div class="modal-body">

          <form role="form" id="login"  method="post" action="login.php?cmd=login">

            <div class="form-group">

              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Email</label>

              <input type="email" class="form-control" name="usrname" id="usrname" placeholder="Enter email" required>

            </div>

            <div class="form-group">

              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>

              <input type="password" class="form-control" name="psw" id="psw" placeholder="Enter password" required>

            </div>

            <!--<div class="checkbox">

              <label><input type="checkbox" name="remember" value="r" checked>Remember me</label>

            </div>-->

            <button type="submit" name="login" class="btn btn-default btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>

          </form>

          <div class="loads"><img src="img/loading.gif" alt="Loading..."/> Please Wait..</div>

          <div class="mssg" id="mssg">&nbsp;</div>

        </div>

      </div>

    </div>

  </div>





<!--Apply Now Modal-->

	<!-- Modal -->

  <div class="modal fade" id="applynow" role="dialog">

    <div class="modal-dialog">



      <!-- Modal content-->

      <div class="modal-content">

        <div class="modal-header">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 style="color:#0f6e73"><span class="glyphicon glyphicon-send"></span> Apply Now</h4>

        </div>

        <div class="modal-body">

          <form role="form" id="apply"  method="post" action="login.php?cmd=apply">

            <div class="form-group">

              <label for="sname"><span class="glyphicon glyphicon-user"></span> Surname</label>

              <input type="text" class="form-control" name="sname" id="sname" placeholder="Surname" required>

            </div>

             <div class="form-group">

              <label for="oname"><span class="glyphicon glyphicon-user"></span> Othernames</label>

              <input type="text" class="form-control" name="oname" id="oname" placeholder="Othernames" required>

            </div>

             <div class="form-group">

              <label for="phone"><span class="glyphicon glyphicon-phone"></span> Phone</label>

              <input type="tel" class="form-control" name="phone" id="phone" placeholder="Phone Number" required>

            </div>

             <div class="form-group">

              <label for="email"><span class="glyphicon glyphicon-envelope"></span> Email</label>

              <input type="email" class="form-control" name="email" id="email" placeholder="Enter email">

            </div>

			<div class="form-group">
              <label for="center"><span class="glyphicon glyphicon-globe"></span> Preferred Center</label>
              <select name="center" class="form-control" id="center" required>
			  	<option value="">Select preferred center</option>
			  	<option value="Ilorin">Ilorin</option>
			  	<option value="Ibadan">Ibadan</option>	
			  	<option value="Lagos">Lagos</option>
			  </select>
            </div>
			<div class="form-group">
              <label for="center"><span class="glyphicon glyphicon-road"></span> Preferred Programme</label>
              <select name="prog" class="form-control" id="center" required>
			  	<option value="">Select preferred center</option>
			  	<?php $prog_all = json_decode(dlookup_json('prog_name, prog_id', 'programmetb', "prog_status = 'Active'"));
				foreach($prog_all as $prog){
					echo "<option value='$prog->prog_id'>$prog->prog_name</option>";
				}
				?>
			  </select>
            </div>

            <!--<div class="checkbox">

              <label><input type="checkbox" name="remember" value="r" checked>Remember me</label>

            </div>-->

            <button type="submit" name="login" class="btn btn-default btn-green btn-block"><span class="glyphicon glyphicon-on"></span> Apply</button>

          </form>

          <div class="loads"><img src="img/loading.gif" alt="Loading..."/> Please Wait..</div>

          <div class="mssg" id="mssg">&nbsp;</div>

        </div>

      </div>

    </div>

  </div>



		<footer id="contact">

			<div class="row">

				<div class="col-sm-6">

					<h4 class="heading">24/7 Candidate Support</h4>

					<p>Our candidate support personnels are here to assist you on all your IJMB application requirements either by Phone or Email.

					<br/><strong>Support Lines:</strong> 08180557799<br/>

					<strong>Support Emails:</strong> info@schoolsearch.org.ng</p>

				</div>

				<div class="col-sm-3 quick-links">

					<h4 class="heading text-center">Quick Links</h4>

							<a href="ijmb-faq.php">F.A.Q</a>

							<a href="about.php">About IJMB</a>

							<a href="news.php">IJMB News</a>

							<?php if(isset($_SESSION['user'])){echo '<a  href="logout.php">Log Out</a>';}else{

								echo '<a data-toggle="modal" href="#loginModal">Log In</a>';} ?>

				</div>

				<!--div class="col-sm-3  text-right">     

					<h4 class="heading">Contact Us</h4>

					80, Agba Dam Road, Gaa Akanbi, <br>

					Ilorin, Kwara State. <br/>

					Phone: 08089186066 <br>

					Email: info@schoolsearch.org.ng

				</div-->

			</div>

			<div class="row developer-note">

				<div class="col-sm-12 text-center" style="margin-bottom: 5px;">

					powered by: schoolsearch.org.ng -  <?php echo date('Y');?>

				</div>

			</div>	

		</footer>
	<script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>

  <script>

	  $('#login').submit(function(){

		  'use strict';

		  var param = {url:$(this).attr('action'), data:$(this).serialize()};

		  	$.post(param.url, param.data, function(x){

				console.log(x);

				var kk = $.parseJSON(x);

				if(kk.succ){

					window.location.replace('user.php');

				}else{

					$('#mssg').html(kk.mssg);

				}

		  })

		  return false;

	  })

	  $('#apply').submit(function(){
		  'use strict';
		  var param = {url:$(this).attr('action'), data:$(this).serialize()};
		  	$.post(param.url, param.data, function(x){

				console.log(x);

				var kk = $.parseJSON(x);

				 if(kk.succ){

					if(kk.mssg == '001'){

						window.location.replace('payment.php?exist=1&sval='+kk.sval+'&reg='+kk.regno);

					}else{

						window.location.replace('payment.php?exist=0&sval='+kk.sval+'&reg='+kk.regno);
					}
				}else{

					$('#mssg').html(kk.mssg);

				}

				//console.log(x);

		  })

		  return false;

	  })

  $(function() {

    $(".rslides").responsiveSlides({

		auto: true,             // Boolean: Animate automatically, true or false

	  	speed: 500,           // Integer: Speed of the transition, in milliseconds

	  	pauseControls: true,    // Boolean: Pause when hovering controls, true or false

	  	prevText: "Previous",   // String: Text for the "previous" button

	  	nextText: "Next",		// String: Text for the "next" button

		pager: false,

		timeout: 4000,          // Integer: Time between slide transitions, in milliseconds

		//maxwidth: 800

	});

	  

	  /*

	  pager: true,           // Boolean: Show pager, true or false

	  nav: true,             // Boolean: Show navigation, true or false

	  random: false,          // Boolean: Randomize the order of the slides, true or false

	  pause: false,           // Boolean: Pause on hover, true or false

	  maxwidth: "",           // Integer: Max-width of the slideshow, in pixels

	  navContainer: "",       // Selector: Where controls should be appended to, default is after the 'ul'

	  manualControls: "",     // Selector: Declare custom pager navigation

	  namespace: "rslides",   // String: Change the default namespace used

	  before: function(){},   // Function: Before callback

	  after: function(){}     // Function: After callback*/

  });

</script>

  </body>

</html>

