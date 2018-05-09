<?php echo $header; ?>
<div class="container columns">
    <div class="row">
        <div class="col-xs-12"><?php echo $content_top; ?></div>
    </div>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-4 col-md-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-8 col-md-9 '; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
            <div id="content" ><?php echo $content_bottom; ?></div></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

