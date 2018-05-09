<?php echo $header; ?>
<div class="container columns">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-4 col-md-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-8 col-md-9 '; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
            <section id="content">
                <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
                <?php } ?>
                <?php echo $content_top; ?>
                <h1><?php echo $heading_title; ?></h1>
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                    <fieldset>
                        <legend><?php echo $text_your_details; ?></legend>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-fullname"><?php echo $entry_fullname; ?> </label>
                            <div class="col-sm-10">
                                <input type="text" name="fullname" value="<?php echo $fullname; ?>" placeholder="<?php echo $entry_fullname; ?>" id="input-fullname" class="form-control" />
                                <?php if ($error_fullname) { ?>
                                <div class="text-danger"><?php echo $error_fullname; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                            <div class="col-sm-10">
                                <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                                <?php if ($error_email) { ?>
                                <div class="text-danger"><?php echo $error_email; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                          <div class="col-sm-10">
                            <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                            
                            <?php if($sms_gateway) { ?>
                            <br />
                            <input type="button" class="btn btn-long" id="mobile_code" value="<?php echo $text_get_sms_code; ?>" />
                            <?php } ?>
                            
                            <?php if ($error_telephone) { ?>
                            <div class="text-danger"><?php echo $error_telephone; ?></div>
                            <?php } ?>
                          </div>
                        </div>
                        
                        <?php if($sms_gateway) { ?>
                        
                        <div class="form-group">
                          <label class="col-sm-2 control-label" for="input-sms"><?php echo $entry_sms_code; ?></label>
                          <div class="col-sm-10">
                            <input type="text" name="sms_code" value="<?php echo $sms_code; ?>" placeholder="<?php echo $entry_sms_code; ?>" id="input-sms-code" class="form-control" />
                            <?php echo $text_sms_hint; ?>
                            <?php if ($error_sms_code) { ?>
                            <div class="text-danger"><?php echo $error_sms_code; ?></div>
                            <?php } ?>
                          </div>
                        </div>
                        
                        <?php } ?>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
                            </div>
                        </div>
                        <?php foreach ($custom_fields as $custom_field) { ?>
                        <?php if ($custom_field['location'] == 'account') { ?>
                        <?php if ($custom_field['type'] == 'select') { ?>
                        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                                    <option value=""><?php echo $text_select; ?></option>
                                    <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                    <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                                    <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                                    <?php } else { ?>
                                    <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                                    <?php } ?>
                                    <?php } ?>
                                </select>
                                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($custom_field['type'] == 'radio') { ?>
                        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <div>
                                    <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                    <div class="radio">
                                        <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                                        <label>
                                            <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                            <?php echo $custom_field_value['name']; ?></label>
                                        <?php } else { ?>
                                        <label>
                                            <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                            <?php echo $custom_field_value['name']; ?></label>
                                        <?php } ?>
                                    </div>
                                    <?php } ?>
                                </div>
                                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($custom_field['type'] == 'checkbox') { ?>
                        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <div>
                                    <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                    <div class="checkbox">
                                        <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                                        <label>
                                            <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                            <?php echo $custom_field_value['name']; ?></label>
                                        <?php } else { ?>
                                        <label>
                                            <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                            <?php echo $custom_field_value['name']; ?></label>
                                        <?php } ?>
                                    </div>
                                    <?php } ?>
                                </div>
                                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($custom_field['type'] == 'text') { ?>
                        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['location']][$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['location']][$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($custom_field['type'] == 'textarea') { ?>
                        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($account_custom_field[$custom_field['location']][$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['location']][$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($custom_field['type'] == 'file') { ?>
                        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['location']][$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['location']][$custom_field['custom_field_id']] : ''); ?>" />
                                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($custom_field['type'] == 'date') { ?>
                        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <div class="input-group date">
                                    <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['location']][$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['location']][$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                    </span></div>
                                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($custom_field['type'] == 'time') { ?>
                        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <div class="input-group time">
                                    <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['location']][$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['location']][$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                    </span></div>
                                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($custom_field['type'] == 'datetime') { ?>
                        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                            <div class="col-sm-10">
                                <div class="input-group datetime">
                                    <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['location']][$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['location']][$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                    </span></div>
                                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                    </fieldset>
                    <div class="buttons clearfix">
                        <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default btn-custom"><?php echo $button_back; ?></a></div>
                        <div class="pull-right">
                            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary btn-custom" />
                        </div>
                    </div>
                </form>
                <?php echo $content_bottom; ?>
            </section>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<script type="text/javascript"><!--
// Sort the custom fields
$('.form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group').length) {
		$('.form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('.form-group').length) {
		$('.form-group:last').after(this);
	}
	
	if ($(this).attr('data-sort') == $('.form-group').length) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('.form-group').length) {
		$('.form-group:first').before(this);
	}
});
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});
//--></script>


<?php if($sms_gateway) { ?>
<script type="text/javascript"><!--
$('#mobile_code').on('click', function() {
	$.ajax({
		url: 'index.php?route=sms/<?php echo $sms_gateway; ?>/create_mobile_code',
		type: 'post',
		dataType: 'json',
		data: 'telephone=' + encodeURIComponent($('input[name=\'telephone\']').val()),
		beforeSend: function() {
			$('.alert-success, .alert-danger').remove();
			$('#mobile_code').attr('disabled', true);
			
		},
		complete: function() {
			//$('#mobile_code').attr('disabled', false);
			//$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#mobile_code').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + data['error'] + '</div>');
				$('#mobile_code').attr('disabled', false);
			}
			
			if (data['success']) {
				$('#mobile_code').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + data['success'] + '</div>');
				
				setTimeout(function(){
					$('#mobile_code').attr('disabled', false);
				}, 60000);
								
			}
		}
	});
});

//--></script> 
<?php } ?>

<?php echo $footer; ?>