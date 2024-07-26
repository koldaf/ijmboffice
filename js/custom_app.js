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


function showNotification(mssg, type, icon ="fa fa-alert", from="top", align="right", timer=4000){

	$.notify({
		icon: icon,
		message: mssg
  
	},{
		allow_dismiss: true,
		showProgressbar: false,
		type: type,
		timer: timer,
		placement: {
			from: from,
			align: align
		}
	});
  }
//{1,2,3,4}
function ajaxcall(cmd,dat=''){

	const link = 'script.php?cmd='+cmd;
			var param = {url:link, dataLink:JSON.stringify(dat)};
			$.post(param.url, {data:param.dataLink}, function(suc){
			console.log(suc);
			var resp = $.parseJSON(suc);
			if(resp.success){
				if(resp.redirect){
                    //return false
					window.location.href = resp.location;
				}else if(resp.reload){
					//md.showNotification('success', resp.mssg);
					showNotification(resp.message, 'success')
					setTimeout(function(){
						window.location.reload();
					}, 5000);
					//alert(resp.mssg);	
				}else if(resp.tab){
                   // md.showNotification('success', resp.mssg);
				   showNotification(resp.message, 'success')
                    $('.nav-tabs a [href="#'+resp.next_tab+'"]').tab('show');
                }else if(resp.div_status){
                   // md.showNotification('success', resp.mssg);
				   showNotification(resp.message, 'success')
					$('#'+resp.div_id).html(resp.div_message);
                }else if(resp.cmd){
					if(resp.action == 'mailing'){
						//$("#sub").modal('hide');
						setCookie('sub', 'yes', 7)
					}
				}
				else{
					showNotification(resp.message, 'success')
					//md.showNotification('success', resp.mssg);
				}
			}else{
				showNotification(resp.message, 'danger')
				//md.showNotification('danger', resp.mssg);
			}
			//console.log(resp);
		});
	return false;
		
}

$('.ajaxform').submit(function(){
	if($(this).attr('enctype') == 'multipart/form-data'){
		$.ajax({
		url:$(this).attr('action'),
		method:"POST",
		data:new FormData(this),
		contentType:false,
		processData:false,
		success:function(data){
			console.log(data);
			var resp = $.parseJSON(data);
			if(resp.success){
				showNotification(resp.message, 'success')
				if(resp.redirect){
				window.location.href = resp.location;
				}else if(resp.reload){
					
					setTimeout(function(){
						window.location.reload();
					}, 5000);
				}
				else if(resp.div_status){				   		
				$('#'+resp.div_id).html(resp.div_message);
				}
				//else{
//						showNotification(resp.message, 'success')
//					}
			}else{
				showNotification(resp.message, 'danger')
			}
			
			console.log(data);
		}
	});
	}else if($(this).attr('data-nojson') === 'true'){
		var param = {url:$(this).attr('action'), data:$(this).serializeArray()};
		$.post(param.url, param.data, function(suc){
			console.log(suc);
			let resp = $.parseJSON(suc);
			if(resp.success){
				if(resp.redirect){
					//return false
					window.location.href = resp.location;
				}else if(resp.reload){
					//md.showNotification('success', resp.mssg);
					showNotification(resp.message, 'success')
					setTimeout(function(){
						window.location.reload();
					}, 5000);
					//alert(resp.mssg);
					
				}else if(resp.tab){
				   // md.showNotification('success', resp.mssg);
				   showNotification(resp.message, 'success');
					$('.nav-tabs a [href="#'+resp.next_tab+'"]').tab('show');
				}else if(resp.div_status){
				   // md.showNotification('success', resp.mssg);
				   showNotification(resp.message, 'success')
					$('#'+resp.div_id).html(resp.div_message);
				}else if(resp.cmd){
					if(resp.action == 'mailing'){
						//$("#sub").modal('hide');
						setCookie('sub', 'yes', 7)
					}
				}else if(resp.win_close){
					//console.log('closing...');
					setTimeout(function(){
						window.close();
						localStorage.setItem('reload','true');
					}, 500);
				}else if(resp.alert){
					alert(resp.message);
				}
				else{
					showNotification(resp.message, 'success')
					//md.showNotification('success', resp.mssg);
				}
			}else{
				showNotification(resp.message, 'danger')
				//md.showNotification('danger', resp.mssg);
			}
		});
		console.log('I no get json');
	}else{
		//var param = {url:$(this).attr('action'), data:$(this).serialize()};
		var param = {url:$(this).attr('action'), data:$(this).serializeArray()};
		var dataObj = {};
		$(param.data).each(function(i, field){
			dataObj[field.name] = field.value; 
				});
			var form_data=JSON.stringify(dataObj);
		$.post(param.url, {data:form_data}, function(suc){
		console.log(suc);
		var resp = $.parseJSON(suc);
		if(resp.success){
			if(resp.redirect){
				//return false
				window.location.href = resp.location;
			}else if(resp.reload){
				//md.showNotification('success', resp.mssg);
				showNotification(resp.message, 'success')
				setTimeout(function(){
					window.location.reload();
				}, 1000);
				//alert(resp.mssg);
				
			}else if(resp.tab){
			   // md.showNotification('success', resp.mssg);
			   showNotification(resp.message, 'success');
				$('.nav-tabs a [href="#'+resp.next_tab+'"]').tab('show');
			}else if(resp.div_status){
			   // md.showNotification('success', resp.mssg);
			   showNotification(resp.message, 'success')
				$('#'+resp.div_id).html(resp.div_message);
			}else if(resp.cmd){
				if(resp.action == 'mailing'){
					//$("#sub").modal('hide');
					setCookie('sub', 'yes', 7)
				}
			}else if(resp.alert){
				alert(resp.message);
			}
			else{
				showNotification(resp.message, 'success')
				//md.showNotification('success', resp.mssg);
			}
		}else{
			showNotification(resp.message, 'danger')
			//md.showNotification('danger', resp.mssg);
		}
		//console.log(resp);
	})
	}
	//document.getElementsByClassName("ajaxform").reset();

	return false;
});
console.log('..bot waiting for action');
