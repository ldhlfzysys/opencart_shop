<h3><?php echo $heading_title; ?></h3>
<div class="list-group">
    <?php foreach ($blogs as $blog) { ?>
    	<a href="<?php echo $blog['href']; ?>" class="list-group-item"><?php echo $blog['name']; ?></a>
    <?php } ?>
</div>
