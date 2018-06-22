<?php
class ControllerExtensionPaymentCustomPay extends Controller {
	var $alipay_gateway = 'https://mapi.alipay.com/gateway.do?';
	var $alipay_gateway_test = 'https://openapi.alipaydev.com/gateway.do?';
	var $pay_base_url = 'http://qrpay.ottpay.com/h5Pay?';
	var $pay_url = 'merCode=66e201e8d8f9415be8eb9c1e6e0b308e&orderId=99776665345670&amount=100&newURL=http%3A%2F%2Fwww.ottpay.com%2Fpay';

	public function index() {
		$data['button_confirm'] = $this->language->get('button_confirm');

		$this->load->model('checkout/order');

		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

		#订单号
		$out_trade_no = str_pad($order_info['order_id'], 7, "0",STR_PAD_LEFT); // Length must be greater than 7

		$subject = trim($this->config->get('config_name'));

		#货币
		$currency = $this->config->get('payment_custom_pay_currency');
		$total_fee = trim($this->currency->format($order_info['total'], $currency, '', false));
		// $total_fee = $total_fee*100;
		#人民币总价
		$total_fee_cny = trim($this->currency->format($order_info['total'], 'CNY', '', false));
		$body = trim($this->config->get('config_name'));

		$alipay_config = array (
			'partner'              => $this->config->get('payment_custom_pay_app_id'),
			'notify_url'           => HTTPS_SERVER . "index.php?route=extension/payment/custom_pay/callback",
			'return_url'           => $this->url->link('checkout/success'),
			'input_charset'        => strtolower('utf-8'),
			'transport'            => 'https',
			'service'              => 'create_forex_trade'
		);

		$parameter = array(
			"service"        => $alipay_config['service'],
			"partner"        => $alipay_config['partner'],
			"notify_url"     => $alipay_config['notify_url'],
			"return_url"     => $alipay_config['return_url'],

			"out_trade_no"   => $out_trade_no,
			"subject"        => $subject,
			"body"           => $body,
			"currency"       => $currency,
			"_input_charset" => trim(strtolower($alipay_config['input_charset']))
		);
		if ($this->session->data['currency'] == 'CNY') {
			$parameter['rmb_fee'] = $total_fee_cny;
		} else {
			$parameter['total_fee'] = $total_fee;
		}

		$parameter_custom = array(
			"merCode"        => $alipay_config['partner'],
			"orderId"        => $out_trade_no,
			"amount"        => $parameter['total_fee'],
			"newURL"        => urlencode($alipay_config['notify_url']),
		);

		$this->load->model('extension/payment/custom_pay');
		$data['params'] = $parameter_custom;
		$hash_order_id = time().$out_trade_no;
		$pay_url = $this->pay_base_url."merCode=".$alipay_config['partner']."&orderId=".$hash_order_id."&amount=".$parameter['total_fee']."&newURL=".urlencode($alipay_config['notify_url']);
		$data['action'] = $pay_url;

		return $this->load->view('extension/payment/custom_pay', $data);
	}

	public function callback() {
		$this->log->write('alipay cross payment notify:');
		$alipay_config = array (
			'partner'              => $this->config->get('payment_custom_pay_app_id'),
			'input_charset'        => strtolower('utf-8'),
		);
		$this->load->model('extension/payment/custom_pay');

		$status = $_GET['status'];
		if ($status == "success") {
			$order_id = $_GET['orderId'];
			$this->load->model('checkout/order');
			$this->model_checkout_order->addOrderHistory($order_id, $this->config->get('payment_custom_pay_order_status_id'));
			return $this->response->redirect($this->url->link('checkout/success', '', true));
		}else{
			return $this->response->redirect($this->url->link('checkout/failure', '', true));
		}
	}
}
