<?php if (!isset($redirect)) { ?>
<div class="table-responsive">
    <table class="table table-bordered table-hover table-shopping-cart">
        <thead>
            <tr>
                <td class="text-left"><?php echo $column_name; ?></td>
                <td class="text-left"><?php echo $column_model; ?></td>
                <td class="text-right"><?php echo $column_quantity; ?></td>
                <td class="text-right"><?php echo $column_price; ?></td>
                <td class="text-right"><?php echo $column_total; ?></td>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
                <td class="text-left td-data"  data-title="<?php echo $column_name; ?>"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    <?php foreach ($product['option'] as $option) { ?>
                    <br />
                    &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                    <?php } ?>

                    <?php if($product['recurring']) { ?>
                    <br />
                    <span class="label label-info"><?php echo $text_recurring_item; ?></span>
                    <small><?php echo $product['recurring']; ?></small>
                    <?php } ?>
                </td>
                <td class="text-left td-data"  data-title="<?php echo $column_model; ?>"><?php echo $product['model']; ?></td>
                <td class="text-right td-data" data-title="<?php echo $column_quantity; ?>"><?php echo $product['quantity']; ?></td>
                <td class="text-right td-price " data-title="<?php echo $column_price; ?>"><?php echo $product['price']; ?></td>
                <td class="text-right td-total " data-title="<?php echo $column_total; ?>"><?php echo $product['total']; ?></td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
                <td class="text-left"><?php echo $voucher['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-right">1</td>
                <td class="text-right td-price"><?php echo $voucher['amount']; ?></td>
                <td class="text-right td-total"><?php echo $voucher['amount']; ?></td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
</div>
<div class="row">
    <div class="col-sm-4 col-sm-offset-8">
        <table class="total table table-bordered">
            <?php foreach ($totals as $total) { ?>
            <tr>
                <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                <td class="text-right"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
        </table>
    </div>
</div>


<?php echo $payment; ?>
<?php } else { ?>
<script type="text/javascript"><!--
    location = '<?php echo $redirect; ?>';
    //--></script>
<?php } ?>
