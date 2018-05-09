<div class="list-group">
    <?php if (!$logged) { ?>
    <a href="<?php echo $login; ?>" class="list-group-item my-account"><i class="fa fa-user"></i><?php echo $text_login; ?></a> 
    <a href="<?php echo $register; ?>" class="list-group-item new-register"><i class="fa fa-pencil"></i><?php echo $text_register; ?></a> 
    <a href="<?php echo $forgotten; ?>" class="list-group-item forgotten-page"><i class="fa fa-exclamation"></i><?php echo $text_forgotten; ?></a>
    <?php } ?>
    <a href="<?php echo $account; ?>" class="list-group-item view-account"><i class="fa fa-cogs"></i><?php echo $text_account; ?></a>
    <?php if ($logged) { ?>
    <a href="<?php echo $edit; ?>" class="list-group-item edit-account"><i class="fa fa-pencil-square-o"></i><?php echo $text_edit; ?></a> 
    <a href="<?php echo $password; ?>" class="list-group-item password-list"><i class="fa fa-lock"></i><?php echo $text_password; ?></a>
    <?php } ?>
    <a href="<?php echo $address; ?>" class="list-group-item address-list"><i class="fa fa-building-o"></i><?php echo $text_address; ?></a>
    <a href="<?php echo $wishlist; ?>" class="list-group-item wishlist-list"><i class="fa fa-heart-o"></i><?php echo $text_wishlist; ?></a>
    <a href="<?php echo $order; ?>" class="list-group-item order-history"><i class="fa fa-history"></i><?php echo $text_order; ?></a>
    <a href="<?php echo $download; ?>" class="list-group-item download-list"><i class="fa fa-download"></i><?php echo $text_download; ?></a>
    <a href="<?php echo $reward; ?>" class="list-group-item reward-list"><i class="fa fa-trophy"></i><?php echo $text_reward; ?></a>
    <a href="<?php echo $return; ?>" class="list-group-item return-list"><i class="fa fa-reply"></i><?php echo $text_return; ?></a>
    <a href="<?php echo $transaction; ?>" class="list-group-item transaction-list"><i class="fa fa-shopping-cart"></i><?php echo $text_transaction; ?></a>
    <a href="<?php echo $newsletter; ?>" class="list-group-item newsletter-list"><i class="fa fa-envelope-o"></i><?php echo $text_newsletter; ?></a>
    <a href="<?php echo $recurring; ?>" class="list-group-item recurring-list"><i class="fa fa-credit-card"></i> <?php echo $text_recurring; ?></a>
    <?php if ($logged) { ?>
    <a href="<?php echo $logout; ?>" class="list-group-item"><i class="fa fa-power-off"></i><?php echo $text_logout; ?></a>
    <?php } ?>
</div>
