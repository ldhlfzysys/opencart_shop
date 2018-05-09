<footer id="footer">
    <div class="content-footer">
        <div class="container">
            <div class="boxed">
                <div class="row">
                    <?php if ($informations) { ?>
                    <div class="col-sm-3 block-footer">
                        <h5><?php echo $text_information; ?></h5>
                        <ul class="list-unstyled toggle-footer">
                            <?php foreach ($informations as $information) { ?>
                            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                            <?php } ?>
                        </ul>
                    </div>
                    <?php } ?>
                    <div class="col-sm-3 block-footer">
                        <h5><?php echo $text_service; ?></h5>
                        <ul class="list-unstyled toggle-footer">
                            <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                            <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                            <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                        </ul>
                    </div>
                    <div class="col-sm-3 block-footer">
                        <h5><?php echo $text_extra; ?></h5>
                        <ul class="list-unstyled toggle-footer">
                            <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                            <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                            <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                            <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                        </ul>
                    </div>
                    <div class="col-sm-3 block-footer">
                        <h5><?php echo $text_account; ?></h5>
                        <ul class="list-unstyled toggle-footer">
                            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                            <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                            <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="powered-footer">
        <div class="container">
            <div class="boxed row">
                <div class="col-xs-12 col-sm-6 hidden-xs"><?php echo $powered; ?></div> 
                <div class="logo-payment col-xs-12 col-sm-6 text-right">
                    <ul class="list-inline list-unstyled">
                        <li class="cc-amex"></li>
                        <li class="mastercard "></li>
                        <li class="paypal"></li>
                        <li class="visa"></li>
                    </ul>
                </div> 
            </div>
        </div>
    </div>
    <div class="rapidtop">
        <button class="btn btn-rapidtop"><i class="fa fa-chevron-up"></i></button>
    </div>
</footer>
</div>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        // initialize FlexNav
        $(".flexnav").flexNav();

        // Currency
        $('#currency .currency-select').on('click', function(e) {
            e.preventDefault();

            $('#currency input[name=\'code\']').attr('value', $(this).attr('name'));

            $('#currency').submit();
        });

        // Language
        $('#language a').on('click', function(e) {
            e.preventDefault();

            $('#language input[name=\'code\']').attr('value', $(this).attr('href'));

            $('#language').submit();
        });

        /* Search */
        $('.sidr-inner input[name=\'search\']').parent().find('button').on('click', function() {
            url = $('base').attr('href') + 'index.php?route=product/search';

            var value = $('.sidr-inner input[name=\'search\']').val();

            if (value) {
                url += '&search=' + encodeURIComponent(value);
            }

            location = url;
        });

        $('.sidr-inner input[name=\'search\']').on('keydown', function(e) {
            if (e.keyCode == 13) {
                $('.sidr-inner input[name=\'search\']').parent().find('button').trigger('click');
            }
        });


    });

    $(window).resize(function(){

        $('#price-block .affix-product').css('width',$('#price-block').width());

        if($(window).width() < 768) {   
            $('#footer h5').on('click', function(){
                $(this).toggleClass('active').parent().find('.toggle-footer').collapse('toggle');
            })
            $('.toggle-footer').addClass('collapse').removeClass('in');
        }
        else
        {
            $('#footer h5').removeClass('active').off().parent().find('.toggle-footer').collapse('show').removeAttr('style');;

        }
    });
</script>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

</body></html>