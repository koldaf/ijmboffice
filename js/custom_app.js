// JavaScript Document
/*Redirect...*/
function redirect(links){
	location.replace(links);
}

//AJAX SET UPS	

$.ajaxSetup({beforeSend: function(){
		$('.loads').fadeIn('slow');
		$('.mssg').fadeOut('slow');
	}, complete: function(){
		$('.loads').fadeOut('slow');
		$('.mssg').fadeIn('slow');
	},success: function(){
		$('.loads').fadeOut('slow');
		$('.mssg').fadeIn('slow');
	}, error: function(e){
		$('.loads').fadeOut('slow');
		//$('#mssg').fadeIn('slow').html('Something Went Wrong... Please Check Internet Connection').css('color','rgba(255,0,0,1)');
		alert('Something Went Wrong... Please Check Internet Connection');
		console.log(e);
	}
});	

//email validator
function validateEmail($email) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  return emailReg.test( $email );
}

function callstates(id){
	var par = {url:"do_set.php?code="+id, state_code:id}
	if(id !== '157')
	{
		//$('#state').fadeOut('fast'); 
		$('#lga').fadeOut('fast');
		//console.log(id);
		$('#state').html('<div class="form-group">'+
              '<label for="province"><span class="glyphicon"></span> Province</label>'+
              '<input type="province" class="form-control" id="province" name="province">'+
            '</div><div class="form-group">'+
              '<label for="city"><span class="glyphicon"></span> City</label>'+
              '<input type="city" class="form-control" id="city" name="city">'+
            '</div>');
	}else{
		$.get(par.url,par.state_code,function(states){
			$('#state').fadeIn('fast'); 
			$('#state').html(states);
			//console.log(states);
		});
	}
}
function callLGA(id){
	'use strict';
	var par = {url:"do_set.php?lga="+id, lga_code:id};
			$.get(par.url,par.lga_code,function(lgas){
			$('#lga').fadeIn('fast'); 
			$('#lga').html(lgas);
			//console.log(states);
		});
}
//linking and other functions
$('.ajax_link').click(function(){
			//console.dir(e);
			var param = {url:$(this).attr('href')};
			//console.log($(this).search());
			$.get(param.url,function(x,y,z){
				if(y == 'success'){
					$('#container').html(x);
				}else{
					$('#container').html('Error Loading Content... Please Try Again');
				}
				console.log('X => '+x+'Y => '+y+'Z =>'+z.toString)
			})
			console.log('Am going to : '+ param.url);
			return false;
		})
		function newsUpload(){
			console.log('hi');
			return false;
		}
		function deletes(y){
			if(confirm("Are you sure you want to delete this item?")){
				var param = {url:'do_set.php?cmd=delete&id='+y};
				$.post(param.url, y, function(z){
					alert(z);
					window.location.reload();
				});
			}
		}
		function validate(x){
			if(confirm("Are you sure you want to validate this entry?")){
				var param = {url:'do_set.php?cmd=validate&id='+x};
				$.post(param.url, param.id, function(y){
					alert(y);
					window.location.reload()
					//console.log(y);
				});
			}
		}
function submitNews(){
	'use strict';
	var y = $(this);
	var param = {url:y.attr('action'), data:y.serialize(), cmd:'?cmd=uploadnews'};
	//console.dir(param);
	$.post('process.php', param.data, function(a, b, c){
		console.log(a);
		console.log(b);
		console.log(c);
	}, JSON);
	/*$.post('process.php', param.data, function(k){
		console.log(k);
		var kk = $.parseJSON(k);
		if(kk.success){
		}
	});*/
	return false;
}

//NiceEdit
//bkLib.onDomLoaded(nicEditors.allTextAreas);

