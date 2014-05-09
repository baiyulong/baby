<?php

namespace Baby\Home\Models;

class Comment extends ModelBase
{

    /**
     *
     * @var integer
     */
    public $c_id;
     
    /**
     *
     * @var integer
     */
    public $c_userid;
     
    /**
     *
     * @var string
     */
    public $c_content;
     
    /**
     *
     * @var integer
     */
    public $c_time;
     
}
