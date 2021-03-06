<style>
<?php if($settings['general']['block_style'] == 'block') { ?>
#quickcheckout #step_2 .text-input label,
#quickcheckout #step_2 .select-input label,
#quickcheckout #step_2 .password-input label,
#quickcheckout #step_3 .text-input label,
#quickcheckout #step_3 .password-input label,
#quickcheckout #step_3 .select-input label{
	width:80%;
}
#quickcheckout #step_2  .box-content > div,
#quickcheckout #step_3  .box-content > div{
	margin-top:5px;
}
#quickcheckout #step_2 .text-input input[type=text],
#quickcheckout #step_2 .password-input input[type=password],
#quickcheckout #step_2 .select-input select,
#quickcheckout #step_3 .text-input input[type=text],
#quickcheckout #step_3 .password-input input[type=password],
#quickcheckout #step_3 .select-input select{
	width: 100%;
}

#quickcheckout #step_2 .radio-input ul,
#quickcheckout #step_3 .radio-input ul{
	margin-left:0px;}
<?php } ?>
<?php if(isset($settings['general']['max_width'])) { ?>
#quickcheckout { max-width: <?php echo $settings['general']['max_width']; ?>px; 
margin: 0 auto;
}
<?php } ?>

<?php if(isset($settings['general']['checkout_style'])) {
echo $settings['general']['checkout_style'];
} ?>
.blocks{
	display:none}
#step_1{
	display:block}
</style>

<div id="quickcheckout">
    <div class="wait"><span></span></div>
    <h1><span><?php echo $heading_title; ?></span></h1>
    <div class="block-content">
      <div class="aqc-column aqc-column-0">
        <?php 
        $i = 1;
        foreach($settings['step'] as $key => $step){
        ?>
        <div id="step_<?php echo $i; ?>" data-sort="<?php echo $step['sort_order']; ?>" data-row="<?php echo $step['row']; ?>" data-column="<?php echo $step['column']; ?>" data-width="<?php echo $step['width']; ?>" class="blocks">
          <?php $view = 'get_'.$key.'_view'; 
             echo $$view;
             ?>
        </div>
        <?php $i++; 
        }?>
      </div>
      <div class="row">
          <div class="aqc-column aqc-column-1 col-xs-<?php echo $settings['general']['column_width'][1]; ?>"></div>
          <div class="aqc-column aqc-column-2 col-xs-<?php echo $settings['general']['column_width'][2]; ?>"></div>
          <div class="aqc-column aqc-column-3 col-xs-<?php echo $settings['general']['column_width'][3]; ?>"></div>
          <div class="aqc-column aqc-column-4 col-xs-<?php echo $settings['general']['column_width'][4]; ?>" ></div>
      </div>
    </div>
	<div id="debug_block"></div>
</div>
<script><!--

if (!window.console) window.console = {};
if (!window.console.log) window.console.log = function (){ } ;

$('.aqc-column > div').tsort({attr:'data-row'});
$('.aqc-column > div').each(function(){
	$(this).appendTo('.aqc-column-' + $(this).attr('data-column'));
		$('.wait').hide();		
		
		})

$('.min-order').show(300, function(){
	 $('.wait').hide();
})
$(document).ready(function(){		   
	$('.blocks').fadeIn("slow", function(){
		debug_update()
	});
})

function addEventChangeQuantity(){
	// Изменение кол-ва вручную
	$('div.quantity > input').on('focus', function(){
		var inner_editor_val = $(this).val();

		$(this).on('blur', function(){
			var inner_editor_val2 = $(this).val();
			if(inner_editor_val != inner_editor_val2){
				console.log(inner_editor_val, inner_editor_val2);
				refreshCheckout(1);
				//event.stopImmediatePropagation()
			}
			$(this).off('blur');
		});
	});
}

addEventChangeQuantity();


/* 	Core refresh functions
*
*	1 Full Checkout refresh (level 1)
*	2 Payment address + Shipping address + Shipping method + Payment method + Confirm (level 2)
*	3 Shipping address + Shipping method + Payment method + Confirm (level 3)
*	4 Shipping method + Payment method + Confirm (level 4)
*	5 Payment method + Confirm (level 5)
*	6 Confirm (level 6)
*	0 Session (level 0)
*/

function refreshCheckout(Step, func){
    

	console.log('refreshCheckout level:'+Step)

	if(Step == 0 || Step == 8){
		if (typeof func == "function") func();
	}
	if(Step == 1){ 
		//refreshAllSteps()
		refreshStep(1, function(){
			refreshStep(2, function(){
				refreshStep(3, function(){
					refreshStep(4, function(){
						refreshStep(5, function(){
							refreshStep(6, function(){
								refreshStep(7, function(){
									refreshStep(8, function(){
										if (typeof func == "function") func(); 
									})
									console.log(' - step_8 refreshed')
								})
								console.log(' - step_7 refreshed')
							})
							console.log(' - step_6 refreshed')
						})
						console.log(' - step_5 refreshed')
					})
					console.log(' - step_4 refreshed')
				})
				console.log(' - step_3 refreshed')
			})
			console.log(' - step_2 refreshed')
		})
		console.log(' - All steps refreshed')
	}
	if(Step == 2){  
		refreshStep(2, function(){
			refreshStep(3, function(){
				refreshStep(4, function(){
					refreshStep(5, function(){
						refreshStep(6, function(){
							refreshStep(7, function(){
								refreshStep(8, function(){
									if (typeof func == "function") func(); 
								})
								console.log(' - step_8 refreshed')
							})
							console.log(' - step_7 refreshed')
						})
						console.log(' - step_6 refreshed')
					})
					console.log(' - step_5 refreshed')
				})
				console.log(' - step_4 refreshed')
			})
			console.log(' - step_3 refreshed')
		})
		console.log(' - step_2 refreshed')
	}
	if(Step == 3){ 
		refreshStep(3, function(){
			refreshStep(4, function(){
				refreshStep(5, function(){
					refreshStep(6, function(){
						refreshStep(7, function(){
							refreshStep(8, function(){
								if (typeof func == "function") func(); 
							})
							console.log(' - step_8 refreshed')
						})
						console.log(' - step_7 refreshed')
					})
					console.log(' - step_6 refreshed')
				})
				console.log(' - step_5 refreshed')
			})
			console.log(' - step_4 refreshed')
		})
		console.log(' - step_3 refreshed')
	}
	if(Step == 4){ 
		refreshStep(4, function(){
			refreshStep(5, function(){
				refreshStep(6, function(){
					refreshStep(7, function(){
						refreshStep(8, function(){
							if (typeof func == "function") func(); 
						})
						console.log(' - step_8 refreshed')
					})
					console.log(' - step_7 refreshed')
				})
				console.log(' - step_6 refreshed')
			})
			console.log(' - step_5 refreshed')
		})
		console.log(' - step_4 refreshed')
	}
	if(Step == 5){ 
		refreshStep(5, function(){
				refreshStep(6, function(){
					refreshStep(7, function(){
						refreshStep(8, function(){
							if (typeof func == "function") func(); 
						})
						console.log(' - step_8 refreshed')
					})
					console.log(' - step_7 refreshed')
				})
				console.log(' - step_6 refreshed')
		})
		console.log(' - step_5 refreshed')
	}
	if(Step == 6){ 
		refreshStep(6, function(){
			refreshStep(7, function(){
				refreshStep(8, function(){
					if (typeof func == "function") func(); 
				})
				console.log(' - step_8 refreshed')
			})
			console.log(' - step_7 refreshed')
		})
		console.log(' - step_6 refreshed')
	}
	if(Step == 7){ 
		refreshStep(7, function(){
			refreshStep(8, function(){
				if (typeof func == "function") func(); 
			})
			console.log(' - step_8 refreshed')
		})
		console.log(' - step_7 refreshed')
	}
	if(Step == 8){ 
		refreshStep(8, function(){
			if (typeof func == "function") func(); 
		})
		console.log(' - step_8 refreshed')
	}
}

function refreshStep(step_number, func){

	$.ajax({
		url: 'index.php?route=module/quickcheckout/refresh_step'+step_number,
		type: 'post',
		data: $('#quickcheckout input[type=\'text\'], #quickcheckout input[type=\'password\'], #quickcheckout input[type=\'checkbox\'], #quickcheckout input[type=\'radio\']:checked, #quickcheckout select, #quickcheckout textarea'),
		dataType: 'html',
		beforeSend: function() {
			
		},
		complete: function() {
				
		},
		success: function(html) {
			$('#step_'+step_number).html(html)
			if (typeof func == "function") func(); 
			debug_update()
			
			if(step_number == 6){
				addEventChangeQuantity();
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}
function refreshAllSteps(func){
	$.ajax({
		url: 'index.php?route=module/quickcheckout/refresh',
		type: 'post',
		data: $('#quickcheckout input[type=\'text\'], #quickcheckout input[type=\'password\'], #quickcheckout input[type=\'checkbox\']:checked, #quickcheckout input[type=\'radio\']:checked, #quickcheckout select,  #quickcheckout textarea'),
		dataType: 'html',
		beforeSend: function() {
			
		},
		complete: function() {
				
		},
		success: function(html) {
			$('#quickcheckout').html(html)
			if (typeof func == "function") func();
			debug_update()
		},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}
/*
*	Login
*/
$(document).on('click', '#button_login', function() {
	$.ajax({
		url: 'index.php?route=module/quickcheckout/login_validate',
		type: 'post',
		data: $('#quickcheckout #step_1 #option_login :input'),
		dataType: 'json',
		beforeSend: function() {
			$('#button_login').attr('disabled', true);
			
		},	
		complete: function() {
			$('#button_login').attr('disabled', false);
			
		},				
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['reload']) {
				refreshAllSteps()
			} else if (json['error']) {
				$('#quickcheckout .wrap').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
				
				$('.warning').fadeIn('slow');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

$(document).on('click', '#button_login_popup', function() {
	$.ajax({
		url: 'index.php?route=module/quickcheckout/login_validate',
		type: 'post',
		data: $('#quickcheckout #step_1 #option_login_popup :input'),
		dataType: 'json',
		beforeSend: function() {
			$('#button_login_popup').attr('disabled', true);
			
		},	
		complete: function() {
			$('#button_login_popup').attr('disabled', false);
			
		},				
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['reload']) {
				refreshAllSteps()
			} else if (json['error']) {
				$('#option_login_popup').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
				
				$('.warning').fadeIn('slow');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});
/*
*	Registration button click
*/
$(document).on('click', '#confirm_order', function(event) {
	console.log('confirm_order -> click') 
	refreshCheckout(0, function(){
		validateAllFields(function(){
			confirmOrder(function(){
				triggerPayment()	
			})	
		})
	})
	event.stopImmediatePropagation()
});

function triggerPayment(){
	console.log('triggerPayment') ;
	var href = $("<?php echo (!empty($settings['general']['trigger'])) ? $settings['general']['trigger'] : '#confirm_payment .button, #confirm_payment .btn, #confirm_payment input[type=submit]' ; ?>").attr('href');
	if(href != '' && href != undefined) {
        document.location.href = href;
		console.log('clicked')	
	}else{
		$("<?php echo (!empty($settings['general']['trigger'])) ? $settings['general']['trigger'] : '#confirm_payment .button, #confirm_payment .btn, #confirm_payment input[type=submit]' ; ?>").trigger("click", function(){	
			console.log('clicked')															   
		})
	}
}
/**
 * Refresh on change shipping method
 **/

$(document).on('change', 'select[name=shipping_method]', function(){
    refreshCheckout(2);
});
$(document).on('change', 'select[name=payment_method]', function(){
    refreshCheckout(2);
});

/* 	Validation
*
*	Validate all fields in the checkout
*/
function validateAllFields(func){
	console.log('validateAllFields')
	$.ajax({
		url: 'index.php?route=module/quickcheckout/validate_all_fields',
		type: 'post',
		data:  $('#quickcheckout input[data-require=require], #quickcheckout select[data-require=require],#quickcheckout textarea[data-require=require]'),
		dataType: 'json',
		beforeSend: function() {
			
		},
		complete: function() {
			
		},
		success: function(json) {
			console.log(json)
			$('.error, .warning').remove()
			$('.highlight-error').removeClass('highlight-error')
			var error = false;
			if(json['error']){
				if ($('#payment_address').is(':visible')  && json['error']['payment_address']) {
					$.each(json['error']['payment_address'], function(key, value){
						console.log(key, value);
						$('#payment_address_wrap [name=\'payment_address\['+key+'\]\']').parents('[class*=-input]').addClass('highlight-error').after('<div class="error">' + value + '</div>');
					});
					error = true;
				}
				if ($('#shipping_address').is(':visible') && json['error']['shipping_address'] ) {
					$.each(json['error']['shipping_address'], function(key, value){
						console.log(key, value);
						$('#shipping_address_wrap [name=\'shipping_address\['+key+'\]\']').parents('[class*=-input]').addClass('highlight-error').after('<div class="error">' + value + '</div>');
					});
					error = true;
				}
				
				if ($('#shipping_method_wrap').is(':visible') && json['error']['shipping_method'] ) {
					$.each(json['error']['shipping_method'], function(key, value){
						console.log(key, value);
						$('#shipping_method_wrap ').prepend('<div class="error">' + value + '</div>');
					});
					error = true;
				}
				
				if ($('#payment_method_wrap').is(':visible') && json['error']['payment_method'] ) {
					$.each(json['error']['payment_method'], function(key, value){
						console.log(key, value);
						$('#payment_method_wrap ').prepend('<div class="error">' + value + '</div>');
					});
					error = true;
				}

                if ($('#confirm_wrap').is(':visible') && json['error']['confirm'] ) {
                    error = true;
                    $.each(json['error']['confirm'], function(key, value){
                        if(key == 'error_warning'){
                            $.each(json['error']['confirm']['error_warning'], function(key, value){
                                console.log('in error confirm');
                                $('#cart_wrap .checkout-product').prepend('<div class="error">' + value + '</div>');
                            });
                        }else{
                            console.log(key, value);
                            $('#confirm_wrap [name=\'confirm\['+key+'\]\']').parents('[class*=-input]').addClass('highlight-error').after('<div class="error">' + value + '</div>');
                        }
                    });
                }
			}
			if(error == false){
				if (typeof func == "function") func(); 
			}else{
				$('html,body').animate({
				scrollTop: $(".error").offset().top-60},
				'slow');	
			}
				
			
			
		},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}

/* 	
*	Validate changed field in checkout
*/
function validateField(fieldId, func){
	console.log('validateField')
	if($('#'+fieldId).attr('data-require') == 'require'){
		$.ajax({
			url: 'index.php?route=module/quickcheckout/validate_field',
			type: 'post',
			data:  $('#quickcheckout input') + '&field='+$('#'+fieldId).attr('name')+'&value='+$('#'+fieldId).val(),
			dataType: 'html',
			beforeSend: function() {
				
			},
			complete: function() {
				
			},
			success: function(html) {
				$('#'+fieldId).parents('[class*=-input]').removeClass('highlight-error').next('.error').remove()
				if(html  != "" && html.length > 4){
					$('#'+fieldId).parents('[class*=-input]').addClass('highlight-error').after('<div class="error">'+html+'</div>')
				}
				if (typeof func == "function") func(); 
				
			},
			error: function(xhr, ajaxOptions, thrownError) {
				console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

/* 	
*	Validate Checkboxes and radio buttons
*/
function validateCheckbox(fieldId, func){
	console.log('validateCheckbox:' + 'field='+$('#'+fieldId).attr('name')+'&value='+$('#'+fieldId).val()) 
	if($('#'+fieldId).attr('data-require') == 'require'){
		
		$.ajax({
			url: 'index.php?route=module/quickcheckout/validate_field',
			type: 'post',
			data:  'field='+$('#'+fieldId).attr('name')+'&value='+$('#'+fieldId).val(),
			dataType: 'html',
			beforeSend: function() {

			},
			complete: function() {
				
			},
			success: function(html) {
				$('#'+fieldId).parents('[class*=-input]').next('.error').remove()
				if(html){
					$('#'+fieldId).parents('[class*=-input]').after('<div class="error">'+html+'</div>')
				}
				if (typeof func == "function") func(); 
				
			},
			error: function(xhr, ajaxOptions, thrownError) {
				console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

/* 	
*	Confirm Order
*/
function confirmOrder(func){
	console.log('confirmOrder') 
	$.ajax({
		url: 'index.php?route=module/quickcheckout/confirm_order',
		type: 'post',
		data:   $('#quickcheckout input[type=\'text\'], #quickcheckout input[type=\'password\'], #quickcheckout input[type=\'checkbox\']:checked, #quickcheckout input[type=\'radio\']:checked, #quickcheckout select, #quickcheckout textarea'),
		dataType: 'html',
		beforeSend: function() {
			
		},
		complete: function() {
			
		},
		success: function(html) {
			console.log(html) 
			refreshStep(2, function(){
				refreshStep(3, function(){
					if (typeof func == "function") func();
				});
			});	
		},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}



/*	
*	Actions
*/
$(document).on('focus', '#confirm_order', function() {
    var _this = this;
	$(document).on('change', _this, function() {
		$('input[name=\'payment_address[confirm]\']').next('.error').remove()
	});
});

$(document).on('click', '#quickcheckout input[name="payment_address[shipping]"]', function(event) {			

	//$('#shipping_address_wrap').toggle();
	refreshCheckout(3)
	event.stopImmediatePropagation()
});

/*
*	Change values of text or select(dropdown)
*/
$(document).on('focus', '#quickcheckout input[type=text], #quickcheckout input[type=password], #quickcheckout select, #quickcheckout textarea', function(event) {
    var _this = this;
	$(document).on('change', _this, function(e) {
		var dataRefresh = $(this).attr('data-refresh');

		validateField( $(this).attr('id') )
		
		if(dataRefresh){refreshCheckout(dataRefresh)}
		e.stopImmediatePropagation()
	});
	event.stopImmediatePropagation()
});

var timerId;
$(document).on('click', '#quickcheckout .quantity i', function(event){											
	var changed = false;
    if($(this).hasClass('increase')){	   
   		$(this).parent().children('input').val(parseInt($(this).parent().children('input').val())+1)
   		changed = true;
    }else{
        if(parseInt($(this).parent().children('input').val()) > 1){
    		$(this).parent().children('input').val(parseInt($(this).parent().children('input').val())-1)
    		changed = true;
        }		
    }
    
    if(changed){
    	clearTimeout(timerId);
    	timerId = setTimeout(function(){
			refreshCheckout(1)	
			event.stopImmediatePropagation()
    	}, 1200)
    }
})


$(document).on('click', '#quickcheckout #confirm_coupon', function(event){	
	$.ajax({
		url: 'index.php?route=module/quickcheckout/validate_coupon',
		type: 'post',
		data: $('#quickcheckout #coupon'),
		dataType: 'json',
		beforeSend: function() {
			
		},
		complete: function() {
				
		},
		success: function(json) {
			
			$('#quickcheckout #step_6 .checkout-product .error').remove();
			if(json['error']){
				$('#quickcheckout #step_6 .checkout-product').prepend('<div class="error" >' + json['error'] + '</div>');
			}
			$('#quickcheckout #step_6 .checkout-product .success').remove();
			if(json['success']){
				$('#quickcheckout #step_6 .checkout-product').prepend('<div class="success" >' + json['success'] + '</div>');
				refreshCheckout(3)
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});		
	event.stopImmediatePropagation()
})

$(document).on('click', '#quickcheckout #confirm_voucher', function(event){	
	$.ajax({
		url: 'index.php?route=module/quickcheckout/validate_voucher',
		type: 'post',
		data: $('#quickcheckout #voucher'),
		dataType: 'json',
		beforeSend: function() {
			
		},
		complete: function() {
				
		},
		success: function(json) {
			$('#quickcheckout #step_6 .checkout-product .error').remove();
			
			if(json['error']){
				$('#quickcheckout #step_6 .checkout-product').prepend('<div class="error" >' + json['error'] + '</div>');
			}
			$('#quickcheckout #step_6 .checkout-product .success').remove();
			if(json['success']){
				$('#quickcheckout #step_6 .checkout-product').prepend('<div class="success" >' + json['success'] + '</div>');
				refreshCheckout(3)
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
	event.stopImmediatePropagation()
})

$(document).on('click', '#quickcheckout #confirm_reward', function(event){	
	$.ajax({
		url: 'index.php?route=module/quickcheckout/validate_reward',
		type: 'post',
		data: $('#quickcheckout #reward'),
		dataType: 'json',
		beforeSend: function() {
			
		},
		complete: function() {
				
		},
		success: function(json) {
			$('#quickcheckout #step_6 .checkout-product .error').remove();
			if(json['error']){
				$('#quickcheckout #step_6 .checkout-product').prepend('<div class="error" >' + json['error'] + '</div>');
			}
			$('#quickcheckout #step_6 .checkout-product .success').remove();
			if(json['success']){
				$('#quickcheckout #step_6 .checkout-product').prepend('<div class="success" >' + json['success'] + '</div>');
				refreshCheckout(3)
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
	event.stopImmediatePropagation()
})

/*
*	Change values of checkbox or radio or select(click)
*/

$(document).on('click', '#quickcheckout  input[type=checkbox], #quickcheckout  input[type=radio]', function(event) {
	console.log('#quickcheckout  input[type=checkbox], #quickcheckout  input[type=radio]') 										
	validateCheckbox( $(this).attr('id'))
	refreshCheckout($(this).attr('data-refresh'))
	event.stopImmediatePropagation()
});

<?php if($settings['general']['debug']){?>	
	var count = 0;
	var timer = $.timer(function() {
		$('#timer').html(++count);
	});
	
	timer.set({ time : 100, autostart : false });
<?php } ?>

$(document).ajaxStart(function(){
    $(".wait").show();
	<?php if($settings['general']['debug']){?>	
	timer.reset();
	timer.play();
	<?php } ?>
})
$(document).ajaxStop(function(){
    $(".wait").hide();
	<?php if($settings['general']['debug']){?>	
	timer.pause();
	<?php } ?>
});
function debug_update(){
	<?php if($settings['general']['debug']){?>	
		console.log('refreshAllSteps debug');
		$.ajax({
		url: 'index.php?route=module/quickcheckout/debug',
		type: 'post',
		data: $('#quickcheckout input[type=\'text\'], #quickcheckout input[type=\'password\'], #quickcheckout input[type=\'checkbox\']:checked, #quickcheckout input[type=\'radio\']:checked, #quickcheckout select,  #quickcheckout textarea'),
		dataType: 'html',
		beforeSend: function() {
			
		},
		complete: function() {
				
		},
		success: function(html) {
			$('#quickcheckout #debug_block').html(html)
		},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
	<?php } ?>
}

// Stop bubbling up live functions
$(document).on('focus', '#quickcheckout input, #quickcheckout select, #quickcheckout textarea', function(event) {
	$(this).bind('change', function(e) {
		e.stopImmediatePropagation()
	})
	event.stopImmediatePropagation()
})
// Stop bubbling up live functions
$(document).on('click', '#quickcheckout input, #quickcheckout select, #quickcheckout textarea', function(event) {
	event.stopImmediatePropagation()
})


$(document).on('click', '#quickcheckout .button-toggle', function(event){
	console.log('click debug' + $('#quickcheckout_debug .debug-content').hasClass('hide'));
	if ($('#quickcheckout_debug .debug-content').hasClass('hide')) {
		$('#quickcheckout_debug .debug-content').removeClass('hide')
	}else{
		$('#quickcheckout_debug .debug-content').addClass('hide')	
	}
	event.stopImmediatePropagation()
})



//--></script>
