<?php

namespace Baby\Home\Library;

use Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Password,
	Phalcon\Forms\Element\Select,
	Phalcon\Forms\Element\Hidden,
	Phalcon\Validation\Validator\PresenceOf;

class UserForm extends Form
{
	/**
	 * Forms initialize
	 *
	 * @param User $user
	 * @param array $options
	 */
	public function initialize($user, $options) {

		if ($options['edit']) {
			$this->form->add(new Hidden('id'));
		}

		//Create & Validation u_username
		$username = new Text('u_username');
		$username->addValidator(new PresenceOf(array('message' => 'Username is require!')));
	}
}