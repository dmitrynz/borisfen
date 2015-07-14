<h2><?php echo $text_credit_card; ?></h2>
<div class="content" id="payment">
  <table class="form">
    <tr>
      <td><?php echo $entry_cc_owner; ?></td>
      <td><input class="form-control"  type="text" name="cc_owner" value="" /></td>
    </tr>
    <tr>
      <td><?php echo $entry_cc_number; ?></td>
      <td><input class="form-control"  type="text" name="cc_number" value="" /></td>
    </tr>
    <tr>
      <td><?php echo $entry_cc_expire_date; ?></td>
      <td><select name="cc_expire_date_month">
          <?php foreach ($months as $month) { ?>
          <option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
          <?php } ?>
        </select>
        /
        <select name="cc_expire_date_year">
          <?php foreach ($year_expire as $year) { ?>
          <option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
          <?php } ?>
        </select></td>
    </tr>
    <tr>
      <td><?php echo $entry_cc_cvv2; ?></td>
      <td><input class="form-control"  type="text" name="cc_cvv2" value="" size="3" /></td>
    </tr>
  </table>
</div>
<div class="buttons">
  <div class="pull-right">
    <input class="form-control"  type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
  </div>
</div>
<script type="text/javascript">
$('#button-confirm').bind('click', function() {
	$.ajax({
		url: 'index.php?route=payment/web_payment_software/send',
		type: 'post',
		data: $('#payment :input'),
		dataType: 'json',		
		beforeSend: function() {
			$('#button-confirm').attr('disabled', true);
			$('#payment').before('<div class="alert alert-danger"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-confirm').attr('disabled', false);
			$('.attention').remove();
		},				
		success: function(json) {
			if (json['error']) {
				alert(json['error']);
			}
			
			if (json['success']) {
				location = json['success'];
			}
		}
	});
});
</script> 