<?php
/**
 * @description Validations interface
 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
 */
interface Validations {
	public function validate();
	public function getErrors();
}