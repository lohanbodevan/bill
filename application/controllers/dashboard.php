<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * @description REST Controller for Account Types
 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
 */
class Dashboard extends CI_Controller {

	public function index() {		
		$page = new Pages('Dashboard');
		$this->load->view('header', $page);
        $this->load->view('dashboard/index');
        $this->load->view('footer');
	}
}