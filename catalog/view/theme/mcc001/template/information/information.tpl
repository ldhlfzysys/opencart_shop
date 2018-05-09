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
                <?php echo $content_top; ?>
                <h1><?php echo $heading_title; ?></h1>
                <?php echo $description; ?><?php echo $content_bottom; ?>
            </section>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<?php echo $footer; ?> 