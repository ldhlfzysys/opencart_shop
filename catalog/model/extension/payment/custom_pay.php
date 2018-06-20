<?php
class ModelExtensionPaymentCustomPay extends Model {
	var $https_verify_url = 'https://mapi.alipay.com/gateway.do?service=notify_verify&';
	var $https_verify_url_test = 'https://openapi.alipaydev.com/gateway.do?service=notify_verify&';
	var $alipay_config;

	public function getMethod($address, $total) {
		$this->load->language('extension/payment/custom_pay');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('payment_custom_pay_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if ($this->config->get('payment_custom_pay_total') > 0 && $this->config->get('payment_custom_pay_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('payment_custom_pay_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$method_data = array(
				'code'       => 'custom_pay',
				'title'      => $this->language->get('text_title'),
				'terms'      => '',
				'sort_order' => $this->config->get('payment_custom_pay_sort_order')
			);
		}

		return $method_data;
	}



	function buildRequestPara($alipay_config, $para_temp) {
		$this->alipay_config = $alipay_config;

		$para_filter = $this->paraFilter($para_temp);

		$para_sort = $this->argSort($para_filter);

		return $para_sort;
	}

	function verifyNotify($alipay_config){
		$this->alipay_config = $alipay_config;

		if(empty($_POST)) {
			return false;
		}
		else {
			$isSign = $this->getSignVeryfy($_POST, $_POST["sign"]);

			$responseTxt = 'false';
			if (! empty($_POST["notify_id"])) {
				$responseTxt = $this->getResponse($_POST["notify_id"]);
			}

			//Veryfy
			if (preg_match("/true$/i",$responseTxt) && $isSign) {
				return true;
			} else {
				$this->log->write($responseTxt);
				return false;
			}
		}
	}

	function getResponse($notify_id) {
		$partner = trim($this->alipay_config['partner']);
		$veryfy_url = $this->config->get('payment_custom_pay_test') == "sandbox" ? $this->https_verify_url_test : $this->https_verify_url;
		$veryfy_url .= "partner=" . $partner . "&notify_id=" . $notify_id;
		$responseTxt = $this->getHttpResponseGET($veryfy_url, $this->alipay_config['cacert']);

		return $responseTxt;
	}

}

