<?php

namespace Baby\Home\Models;

use Phalcon\Mvc\Model\Validator\PresenceOf,
    Phalcon\Mvc\Model\Validator\Email,
    Phalcon\Mvc\Model\Validator\InclusionIn;

class User extends ModelBase
{

    /**
     *
     * @var integer
     */
    public $u_id;
     
    /**
     *
     * @var string
     */
    public $u_username;
     
    /**
     *
     * @var string
     */
    public $u_password;
     
    /**
     *
     * @var string
     */
    public $u_nickname;
     
    /**
     *
     * @var string
     */
    public $u_realname;
     
    /**
     *
     * @var integer
     */
    public $u_sex;
     
    /**
     *
     * @var integer
     */
    public $u_birthday;
     
    /**
     *
     * @var string
     */
    public $u_mobile;
     
    /**
     *
     * @var string
     */
    public $u_email;
     
    /**
     *
     * @var integer
     */
    public $u_time;
     
    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'u_id'       => 'id', 
            'u_username' => 'username', 
            'u_password' => 'password', 
            'u_nickname' => 'nickname', 
            'u_realname' => 'realname', 
            'u_sex'      => 'sex', 
            'u_birthday' => 'birthday', 
            'u_mobile'   => 'mobile', 
            'u_email'    => 'email', 
            'u_status'   => 'status',
            'u_time'     => 'time'
        );
    }

    /**
     * 设置字段默认值
     * @return [type] [description]
     */
    public function beforeCreate() {
        $this->u_time = Phalcon\Db\RawValue('now()');
    }

    /**
     * 字段验证
     * @return bool 成功返回true，失败返回false
     */
    public function validation() {
        //空值验证
        $this->validate(new PresenceOf(
            array('field' => 'u_username', 'message' => '邮箱不能为空！')
        ));
        $this->validate(new PresenceOf(
            array('field' => 'u_password', 'message' => '密码不能为空！')
        ));
        //验证邮箱
        $this->validate(new Email(
            array('field' => 'u_username', 'message' => '请填写正确的邮箱格式！')
        ));
        //性别验证
        $this->validate(new InclusionIn(
            array('fileld' => 'u_sex', 'domain' => array(1,2))
        ));

        if ($this->validationHasFailed() == true) {
            return false;
        }
    }

}
