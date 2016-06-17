<?php

class Api_User extends PhalApi_Api {

    public function getRules() {
        return array(
            'getBaseInfo' => array(
                'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '用户ID'),
                'userPwd' => array('name' => 'user_pwd', 'require' => true, 'desc' => '用户密码'),

            ),
            'regist' => array(
                'pwd' => array('name' => 'pwd', 'require' => true, 'desc' => '密码'),
                'email' => array('name' => 'email', 'require' => true, 'desc' => '邮件'),
            ),
            'update' => array(
                'id'    => array('name' => 'id', 'require' => true, 'desc' => '用户Id'),
                'name'  => array('name' => 'name', 'require' => true, 'desc' => '用户名称'),
                'email' => array('name' => 'email', 'require' => true, 'desc' => '邮件'),
                'pwd' => array('name' => 'pwd', 'require' => true, 'desc' => '邮件'),
            ),
            'delete' => array(
                'id' => array('name' => 'id', 'require' => true, 'desc' => '用户Id'),
            ),

        );
    }

    /**
     * 获取用户基本信息
     * @desc 用于获取单个用户基本信息
     * @return int code 操作码，0表示成功，1表示用户不存在
     * @return object info 用户信息对象
     * @return int info.id 用户ID
     * @return string info.name 用户名字
     * @return string info.note 用户来源
     * @return string msg 提示信息
     */
    public function getBaseInfo() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());


        $where['user_id']=$this-> userId;
        $where['user_pwd']=$this->userPwd;

        $info = DI()->notorm->user->where($where)->fetchOne();

        if (empty($info)) {
            DI()->logger->debug('user not found', $this->userId);

            $rs['code'] = 1;
            $rs['msg'] = T('user not exists');
            return $rs;
        }

        $rs['info'] = $info;

        return $rs;
    }



    /**
     * 注册用户
     * @desc 用于获取单个用户注册
     * @return int id 新增列的Id
     */
    public function regist(){
        $data = array(                                               //用数组构成需要插入键值一一对应
            'id'    => 0,                                            //默认自增
            'pwd'  => $this->pwd,
            'email' => $this->email,
        );
        $rs   = DI()->notorm->user->insert($data);                  //执行数据库操作user代表的是表,返回结果是插入成功的值
        return $rs['id'];                                           //返回插入的id
    }

}
