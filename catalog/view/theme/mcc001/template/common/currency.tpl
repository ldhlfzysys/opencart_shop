<?php if (count($currencies) > 1) { ?>
<li id="currency-block">
    <div  class="dropdown">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">
            <div class="btn-group">
                <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
                    <?php foreach ($currencies as $currency) { ?>
                    <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
                    <strong><?php echo $currency['symbol_left']; ?></strong>
                    <?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
                    <strong><?php echo $currency['symbol_right']; ?></strong>
                    <?php } ?>
                    <?php } ?>
                    <span><?php echo $text_currency; ?></span> <i class="fa fa-angle-down"></i>
                </button>
                <ul class="dropdown-menu">
                    <?php foreach ($currencies as $currency) { ?>
                    <?php if ($currency['symbol_left']) { ?>
                    <li><a class="currency-select btn-block" href=""  name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?> <?php echo $currency['title']; ?></a></li>
                    <?php } else { ?>
                    <li><a class="currency-select  btn-block" href=""  name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_right']; ?> <?php echo $currency['title']; ?></a></li>
                    <?php } ?>
                    <?php } ?>
                </ul>
            </div>
            <input type="hidden" name="code" value="" />
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
        </form>
    </div>
</li>
<?php } ?>
