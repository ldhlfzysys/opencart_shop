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
                <?php if ($success) { ?>
                <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
                <?php } ?>
                <?php echo $content_top; ?>
                <div class="row">
                    <div class="col-sm-12 col-md-6">

                        <h2><?php echo $text_my_account; ?></h2>
                        <ul class="list-unstyled">
                            <li><a href="<?php echo $edit; ?>" class="btn btn-link" title="<?php echo $text_edit; ?>"><i class="fa fa-pencil-square-o"></i><?php echo $text_edit; ?></a></li>
                            <li><a href="<?php echo $password; ?>" class="btn btn-link" title="<?php echo $text_password; ?>"><i class="fa fa-lock"></i><?php echo $text_password; ?></a></li>
                            <li><a href="<?php echo $address; ?>" class="btn btn-link" title="<?php echo $text_address; ?>"><i class="fa fa-building-o"></i><?php echo $text_address; ?></a></li>
                            <li><a href="<?php echo $wishlist; ?>" class="btn btn-link" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart-o"></i><?php echo $text_wishlist; ?></a></li>
                        </ul>
                    </div>
                    <div class="col-sm-12 col-md-6">
                        <?php if ($credit_cards) { ?>
                        <h2><?php echo $text_credit_card; ?></h2>
                        <ul class="list-unstyled">
                          <?php foreach ($credit_cards as $credit_card) { ?>
                          <li><a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a></li>
                          <?php } ?>
                        </ul>
                        <?php } ?>
                    </div>
                    <div class="col-sm-12 col-md-6">
                        <h2><?php echo $text_my_orders; ?></h2>
                        <ul class="list-unstyled">
                            <li><a href="<?php echo $order; ?>" class="btn btn-link" title="<?php echo $text_order; ?>"><i class="fa fa-history"></i><?php echo $text_order; ?></a></li>
                            <li><a href="<?php echo $download; ?>" class="btn btn-link" title="<?php echo $text_download; ?>"><i class="fa fa-download"></i><?php echo $text_download; ?></a></li>
                            <?php if ($reward) { ?>
                            <li><a href="<?php echo $reward; ?>" class="btn btn-link" title="<?php echo $text_reward; ?>"><i class="fa fa-trophy"></i><?php echo $text_reward; ?></a></li>
                            <?php } ?>
                            <li><a href="<?php echo $return; ?>" class="btn btn-link" title="<?php echo $text_return; ?>"><i class="fa fa-reply"></i><?php echo $text_return; ?></a></li>
                            <li><a href="<?php echo $transaction; ?>" class="btn btn-link" title="<?php echo $text_transaction; ?>"><i class="fa fa-shopping-cart"></i><?php echo $text_transaction; ?></a></li>
                            <li><a href="<?php echo $recurring; ?>" class="btn btn-link" title="<?php echo $text_recurring; ?>"><i class="fa fa-credit-card"></i><?php echo $text_recurring; ?></a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h2><?php echo $text_my_newsletter; ?></h2>
                        <ul class="list-unstyled">
                            <li><a href="<?php echo $newsletter; ?>" class="btn btn-link" title="<?php echo $text_newsletter; ?>"><i class="fa fa-envelope-o"></i><?php echo $text_newsletter; ?></a></li>
                        </ul>
                    </div>
                </div>
                <?php echo $content_bottom; ?>
            </section>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<?php echo $footer; ?>
