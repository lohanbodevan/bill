<?php
include(APPPATH.'libraries/entities/GenericEntity.php');
include(APPPATH.'libraries/interfaces/Validations.php');

/**
 * Entity class for Account Type
 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
 */
class AccountType extends GenericEntity implements Validations {
	protected $id;
	protected $name;

	/**
	 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
 	 * @description create validation
 	 * @override
	 */
	public function validate() {
		if (empty($this->name)) {
			$this->errors[] = "Name is required";
			return false;
		}
	}

	/**
	 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
 	 * @description Returns the errors of validation
 	 * @override
	 */
	public function getErrors() {
		return $this->errors;
	}
}