<?php

namespace Baby\Home\Models;

use Phalcon\Mvc\Model;

class ModelBase extends Model
{

	public function getSource() {
		$classStr = get_class($this);
		$className = substr($classStr, strrpos($classStr, '\\')+1);
		return 'by_' . strtolower($className);
	}
     
}
