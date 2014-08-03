<?php
/**
 * Classe genérica para entidades
 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
 */
class GenericEntity {
	protected $errors;

	/**
	 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
	 * @description GETTERS 
	 */
	public function get($property) {
		if (property_exists($this, $property)) {
			return $this->$property;
		}
	}

	/**
	 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
	 * @description SETTERS
	 */
  	public function set($property, $value) {
  		if (property_exists($this, $property)) {
			$this->$property = $value;
		}
	}
}