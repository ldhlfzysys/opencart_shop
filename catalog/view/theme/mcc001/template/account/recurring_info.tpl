<?php echo $header; ?>
<div class="container columns">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6 col-md-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9 col-md-9 '; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
            <section id="content">
                <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
                <?php } ?>
                <?php echo $content_top; ?>
                <h1><?php echo $heading_title; ?></h1>
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <td class="text-left" colspan="2"><?php echo $text_recurring_detail; ?></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                          <td class="text-left" style="width: 50%;">
                            <p><b><?php echo $text_order_recurring_id; ?></b> #<?php echo $order_recurring_id; ?></p>
                            <p><b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></p>
                            <p><b><?php echo $text_status; ?></b> <?php echo $status; ?></p>
                            <p><b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?></p></td>
                          <td class="text-left" style="width: 50%;"><p><b><?php echo $text_order_id; ?></b> <a href="<?php echo $order; ?>">#<?php echo $order_id; ?></a></p>
                            <p><b><?php echo $text_product; ?></b> <a href="<?php echo $product; ?>"><?php echo $product_name; ?></a></p>
                            <p><b><?php echo $text_quantity; ?></b> <?php echo $product_quantity; ?></p></td>
                        </tr>
          
                    </tbody>
                </table>
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $text_description; ?></td>
                      <td class="text-left"><?php echo $text_reference; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="text-left" style="width: 50%;"><p style="margin:5px;"><?php echo $recurring_description; ?></p></td>
                      <td class="text-left" style="width: 50%;"><p style="margin:5px;"><?php echo $reference; ?></p></td>
                    </tr>
                  </tbody>
                </table>
                <h2><?php echo $text_transaction; ?></h2>
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $column_date_added; ?></td>
                      <td class="text-left"><?php echo $column_type; ?></td>
                      <td class="text-right"><?php echo $column_amount; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php if ($transactions) { ?>
                    <?php foreach ($transactions as $transaction) { ?>
                    <tr>
                      <td class="text-left"><?php echo $transaction['date_added']; ?></td>
                      <td class="text-left"><?php echo $transaction['type']; ?></td>
                      <td class="text-right"><?php echo $transaction['amount']; ?></td>
                    </tr>
                    <?php } ?>
                    <?php } else { ?>
                    <tr>
                      <td colspan="3" class="text-center"><?php echo $text_no_results; ?></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
      
                <?php echo $recurring; ?><?php echo $content_bottom; ?></div>
    			<?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

