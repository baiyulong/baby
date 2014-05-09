<?php

namespace Baby\Home\Controllers;

use Phalcon\Tag,
    Baby\Home\Models as Model;

class SessionController extends ControllerBase
{

    /**
     * 初始化
     * @return [type] [description]
     */
    public function init() {
        Tag::setTitle('注册');
        parent::init();
    }
    
    /**
     * 用户注册
     * @return [type] [description]
     */
    public function registerAction() {
        $request = $this->request;
        if (! $request->isPost()) {
            Tag::setDefault('username', '');
            Tag::setDefault('password', '');
            Tag::setDefault('sex', 1);
        } else {
            $username = $request->getPost('username', array('email', 'email'));
            $password = $request->getPost('password');
            $rePassword = $request->getPost('repassword');
            $sex = $request->getPost('sex', array('int'));

            if ($password != $rePassword) {
                $this->flash->error('两次输入的密码不一致，请重新输入！');
                return false;
            }

            $user = new Model\User();
            $user->username = $username;
            $user->password = sha1($password);
            $user->email = $username;
            if ($user->create()) {
                if ($user->save() == false) {
                    foreach ($user->getMessage() as $msg) {
                        $this->flash->error((string) $msg);
                    }
                } else {
                    Tag::setDefault('username', '');
                    Tag::setDefault('password', '');
                    Tag::setDefault('sex', 1);
                    $this->flash->success('欢饮加入我们的团队，您的宝宝将万众瞩目下成长！');
                    return $this->forward('index/index');
                }
            }
        }
    }

}

