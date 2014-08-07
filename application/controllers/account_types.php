<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * @description REST Controller for Account Types
 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
 */
class Account_Types extends CI_Controller {

	public function index() {
		$data = new stdClass();
		$this->load->model('Account_Type',"", TRUE);
  		$data->fetch = $this->Account_Type->fetch();
		
		$page = new Pages('Account Types List');
		$this->load->view('header', $page);
        $this->load->view('account_types/index', $data);
        $this->load->view('footer');
	}
}