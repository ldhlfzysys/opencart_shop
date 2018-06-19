<?php
class ControllerExtensionPaymentCustomePay extends Controller {
	private $error = array();
	private $currencies = array('GBP', 'HKD', 'USD', 'CHF', 'SGD', 'SEK', 'DKK', 'NOK', 'JPY', 'CAD', 'AUD', 'EUR', 'NZD', 'KRW', 'THB');

	public function index() {
		$this->load->language('extension/payment/custom_pay');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('payment_custom_pay', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['app_id'])) {
			$data['error_app_id'] = $this->error['app_id'];
		} else {
			$data['error_app_id'] = '';
		}

		if (isset($this->error['merchant_private_key'])) {
			$data['error_merchant_private_key'] = $this->error['merchant_private_key'];
		} else {
			$data['error_merchant_private_key'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/payment/custom_pay', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['action'] = $this->url->link('extension/payment/custom_pay', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=payment', true);

		if (isset($this->request->post['payment_custom_pay_app_id'])) {
			$data['payment_custom_pay_app_id'] = $this->request->post['payment_custom_pay_app_id'];
		} else {
			$data['payment_custom_pay_app_id'] = $this->config->get('payment_custom_pay_app_id');
		}

		if (isset($this->request->post['payment_custom_pay_merchant_private_key'])) {
			$data['payment_custom_pay_merchant_private_key'] = $this->request->post['payment_custom_pay_merchant_private_key'];
		} else {
			$data['payment_custom_pay_merchant_private_key'] = $this->config->get('payment_custom_pay_merchant_private_key');
		}

		if (isset($this->request->post['payment_custom_pay_currency'])) {
			$data['payment_custom_pay_currency'] = $this->request->post['payment_custom_pay_currency'];
		} else {
			$data['payment_custom_pay_currency'] = $this->config->get('payment_custom_pay_currency');
		}

		$this->load->model('localisation/currency');

		$currencies = $this->model_localisation_currency->getCurrencies();
		$data['currencies'] = array();
		foreach ($currencies as $currency) {
			if (in_array($currency['code'], $this->currencies)) {
				$data['currencies'][] = array(
					'code'   => $currency['code'],
					'title'  => $currency['title']
				);
			}
		}

		if (isset($this->request->post['payment_custom_pay_test'])) {
			$data['payment_custom_pay_test'] = $this->request->post['payment_custom_pay_test'];
		} else {
			$data['payment_custom_pay_test'] = $this->config->get('payment_custom_pay_test');
		}

		if (isset($this->request->post['payment_custom_pay_total'])) {
			$data['payment_custom_pay_total'] = $this->request->post['payment_custom_pay_total'];
		} else {
			$data['payment_custom_pay_total'] = $this->config->get('payment_custom_pay_total');
		}

		if (isset($this->request->post['payment_custom_pay_order_status_id'])) {
			$data['payment_custom_pay_order_status_id'] = $this->request->post['payment_custom_pay_order_status_id'];
		} else {
			$data['payment_custom_pay_order_status_id'] = $this->config->get('payment_custom_pay_order_status_id');
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['payment_custom_pay_geo_zone_id'])) {
			$data['payment_custom_pay_geo_zone_id'] = $this->request->post['payment_custom_pay_geo_zone_id'];
		} else {
			$data['payment_custom_pay_geo_zone_id'] = $this->config->get('payment_custom_pay_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['payment_custom_pay_test'])) {
			$data['payment_custom_pay_test'] = $this->request->post['payment_custom_pay_test'];
		} else {
			$data['payment_custom_pay_test'] = $this->config->get('payment_custom_pay_test');
		}

		if (isset($this->request->post['payment_custom_pay_status'])) {
			$data['payment_custom_pay_status'] = $this->request->post['payment_custom_pay_status'];
		} else {
			$data['payment_custom_pay_status'] = $this->config->get('payment_custom_pay_status');
		}

		if (isset($this->request->post['payment_custom_pay_sort_order'])) {
			$data['payment_custom_pay_sort_order'] = $this->request->post['payment_custom_pay_sort_order'];
		} else {
			$data['payment_custom_pay_sort_order'] = $this->config->get('payment_custom_pay_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/payment/custom_pay', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/custom_pay')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['payment_custom_pay_app_id']) {
			$this->error['app_id'] = $this->language->get('error_app_id');
		}

		if (!$this->request->post['payment_custom_pay_merchant_private_key']) {
			$this->error['merchant_private_key'] = $this->language->get('error_merchant_private_key');
		}

		return !$this->error;
	}
}