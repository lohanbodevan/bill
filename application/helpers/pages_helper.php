<?php
/**
 * @description Helper for manage Pages info
 * @author Lohan Bodevan <lohan.bodevan@gmail.com>
 */
class Pages {

	public $pageTitle;
	public $prefixPageTitle;

	public function __construct($pageTitle = NULL){
		$this->pageTitle = $pageTitle;
		$this->prefixPageTitle = "Bill";
	}
}