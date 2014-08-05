<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * @description REST Controller for Account Types
 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
 */
class Account_Types extends CI_Controller {

	public function index() {
		// $this->load->model('Account_Type',"", TRUE);
  		// $this->Account_Type->list();
		
		$this->load->view('header');
        $this->load->view('account_types/index');
        $this->load->view('footer');
	}
}