<?php if (count($languages) > 1) { ?>
<li id="languages-block">
    <div  class="dropdown">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
            <div class="btn-group">
                <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
                    <?php foreach ($languages as $language) { ?>
                    <?php if ($language['code'] == $code) { ?>
                    <img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
                    <?php } ?>
                    <?php } ?>
                    <span><?php echo $text_language; ?></span> <i class="fa fa-angle-down"></i></button>
                <ul class="dropdown-menu">
                    <?php foreach ($languages as $language) { ?>
                    <li><a href="<?php echo $language['code']; ?>" class="btn-block"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <input type="hidden" name="code" value="" />
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
        </form>
    </div>   
</li>
<?php } ?>

