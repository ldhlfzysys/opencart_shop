<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
        <meta name="keywords" content= "<?php echo $keywords; ?>" />
        <?php } ?>
        <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="catalog/view/theme/mcc001/stylesheet/bootstrap.css" rel="stylesheet" media="screen" />
        <link href="catalog/view/theme/mcc001/stylesheet/jquery.sidr.dark.css" rel="stylesheet">
        <link href="catalog/view/theme/mcc001/stylesheet/stylesheet.css" rel="stylesheet">
        <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>
        <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
        <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
        <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="catalog/view/theme/mcc001/js/jquery.flexnav.js" type="text/javascript"></script>
        <script src="catalog/view/theme/mcc001/js/jquery.sidr.min.js" type="text/javascript"></script>
        <?php foreach ($scripts as $script) { ?>
        <script src="<?php echo $script; ?>" type="text/javascript"></script>
        <?php } ?>
        <script src="catalog/view/theme/mcc001/js/common.js" type="text/javascript"></script>
        <?php foreach ($analytics as $analytic) { ?>
        <?php echo $analytic; ?>
        <?php } ?>
    </head>
    <body class="<?php echo $class; ?>">
        <div class="full-boxed">
            <header id="header">
                <nav id="top" class="hidden-xs hidden-sm">
                    <div class="boxed bg-top">
                        <div class="container">
                            <div class="pull-left"><a class="btn btn-link" href="<?php echo $contact; ?>"><i class="fa fa-phone"></i><span><?php echo $telephone; ?></span></a></div>
                            <div id="top-links" class="nav pull-right">
                                <ul class="list-inline navbar-right">
                                    <li class="wishlist-link">
                                        <a class="btn btn-link" href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><span><?php echo $text_wishlist; ?></span></a>
                                    </li>
                                    <?php echo $currency; ?>
                                    <?php echo $language; ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                </nav>
                <div class="header-content">
                    <div class="boxed bg-header-content">
                        <div class="container">
                            <div class="row">
                                <div id="mobile-header" class="col-sm-2 col-xs-2 hidden-md hidden-lg">
                                    <a id="responsive-menu-button"  href="javascript:void(0)" class="pull-left"><i class="fa fa-bars"></i></a>
                                </div>
                                <div class="col-xs-8 col-sm-8 col-md-4">
                                    <div id="logo">
                                        <div class="hidden-xs hidden-sm">
                                            <?php if ($logo) { ?>
                                            <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                                            <?php } else { ?>
                                            <div class="logo"><a href="<?php echo $home; ?>"><?php echo $name; ?></a></div>
                                            <?php } ?>
                                        </div>

                                        <div class="visible-xs visible-sm text-center text-uppercase logo-mobile"><a href="<?php echo $home; ?>"><strong><?php echo $name; ?></strong></a></div>

                                    </div>
                                </div>
                                <div class="header-content-block hidden-xs hidden-sm col-md-4"><?php echo $search; ?>
                                </div>
                                <div class="header-content-block col-xs-2 col-sm-2 col-md-4">
                                    <div class="cart_info pull-right">
                                        <ul class="list-unstyled list-compact">
                                            <li class="hidden-xs hidden-sm"><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><b><?php echo $text_shopping_cart; ?></b></a></li>
                                            <li><?php echo $cart; ?></li>
                                        </ul>
                                    </div>
                                    <div class="user_info pull-right">
                                        <ul class="list-unstyled list-compact">
                                            <?php if ($logged) { ?>
                                            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                                            <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><span ><?php echo $text_account; ?></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="<?php echo $account; ?>" class="btn-block"><?php echo $text_account; ?></a></li>
                                                    <li><a href="<?php echo $order; ?>" class="btn-block"><?php echo $text_order; ?></a></li>
                                                    <li><a href="<?php echo $transaction; ?>" class="btn-block"><?php echo $text_transaction; ?></a></li>
                                                    <li><a href="<?php echo $download; ?>" class="btn-block"><?php echo $text_download; ?></a></li>
                                                </ul>
                                            </li>

                                            <?php } else { ?>
                                            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                                            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php if ($categories) { ?>
                <nav id="navigation">
                    <div class="boxed bg-navigation">
                        <div class="container">
                            <ul data-breakpoint="992" class="flexnav with-js lg-screen clearfix">
                                <?php foreach ($categories as $category) { ?>
                                <?php if ($category['children']) { ?>
                                <li><a href="<?php echo $category['href']; ?>" ><?php echo $category['name']; ?></a>
                                    <ul class="list-unstyled ul-col-<?php echo $category['column']; ?>">
                                        <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                        <?php if ($category['column'] == 1) { ?>
                                        <?php foreach ($children as $child) { ?>
                                        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                                        <?php } ?>
                                        <?php } else { ?>
                                        <li class="li-inline">
                                            <div>
                                                <?php foreach ($children as $child) { ?>
                                                <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                                <?php } ?>
                                            </div>
                                        </li>
                                        <?php } ?>
                                        <?php } ?>
                                    </ul>
                                </li>
                                <?php } else { ?>
                                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                                <?php } ?>
                                <?php } ?>
                                
                                <li><a href="<?php echo $blog; ?>"><?php echo $text_blog; ?></a></li>
                                <li><a href="<?php echo $press; ?>"><?php echo $text_press; ?></a></li>
                                <li><a href="<?php echo $faq; ?>"><?php echo $text_faq; ?></a></li>
                            </ul>

                        </div>
                    </div>
                </nav>
                <?php } ?>
            </header>
