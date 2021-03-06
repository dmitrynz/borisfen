<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $cols = 6; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $cols = 9; ?>
    <?php } else { ?>
    <?php $cols = 12; ?>
    <?php } ?>  
    <div id="content" class="col-xs-<?php echo $cols; ?>"><?php echo $content_top; ?>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
      <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><?php echo $error_warning; ?></div>
      <?php } ?>
      <h1><?php echo $heading_title; ?></h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend><?php echo $text_your_details; ?></legend>
          <div class="form-group col-xs-10 required">
            <label class="col-xs-4 control-label" for="input-firstname"><?php echo $entry_firstname; ?> </label>
            <div class="col-xs-8">
              <input type="text" name="firstname" value="<?php echo $firstname; ?>" id="input-firstname" class="form-control default" />
              <?php if ($error_firstname) { ?>
              <div class="text-danger"><?php echo $error_firstname; ?></div>
              <?php } ?>
            </div>
          </div>
          <!-- 
          <div class="form-group col-xs-8 required">
            <label class="col-xs-3 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
            <div class="col-xs-9">
              <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
              <?php if ($error_lastname) { ?>
              <div class="text-danger"><?php echo $error_lastname; ?></div>
              <?php } ?>
            </div>
          </div>
           -->
          <div class="form-group col-xs-10 required">
            <label class="col-xs-4 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-xs-8">
              <input type="email" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control default" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group col-xs-10 required">
            <label class="col-xs-4 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
            <div class="col-xs-8">
              <input type="tel" name="telephone" value="<?php echo $telephone; ?>" id="input-telephone" class="form-control" />
              <?php if ($error_telephone) { ?>
              <div class="text-danger"><?php echo $error_telephone; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group col-xs-10">
            <label class="col-xs-4 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
            <div class="col-xs-8">
              <input type="text" name="fax" value="" id="input-fax" class="form-control" />
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="Сохранить" class="btn btn-primary" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>