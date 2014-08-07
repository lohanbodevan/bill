<?php
//include(APPPATH.'libraries/entities/AccountType.php');

/**
 * @description Model for Account Types table
 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
 */
class Account_Type extends CI_Model {

	private $table = "account_types";

	function __construct() {
		parent::__construct();
	}

	/**
	 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
	 * @description find on database for all account types
	 * @return Query result
	 */
	public function fetch() {
		$this->db->select($this->defaultSelect());
		$this->db->from($this->table);
		$query = $this->db->get();

        return $query->result();
	}

	/**
	 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
	 * @description find on database for an account type
	 * @return Query Row Result
	 */
	public function getAccountType($object) {
		if (!$object->id) {
			return false;
		}

		$this->db->select($this->defaultSelect());
		$this->db->from($this->table);
		$this->db->where("id",$object->id);
		$this->db->limit(1);
		$query = $this->db->get();
		
		return $query->row();
	}

	/**
	 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
	 * @description Create a new account type
	 * @return boolean (true for success e false for failure)
	 */
	public function create($object) {
		if ($object->validate()) {
			$this->db->set($object);
			if ($this->db->insert($this->table)){
				return true;
			}
		}

		return false;
	}

	/**
	 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
	 * @description Default select
	 * @return database columns
	 */
	private function defaultSelect() {
		return 'id, name';
	}
}