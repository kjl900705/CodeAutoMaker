<?php

class Api_ExamArrange extends PhalApi_Api {

    public function getRules() {
        return array(
            'getExamArrangeByUserID' => array(
                'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '用户ID'),
            ),



        );
    }


    /**
     * 根据用户id   获取监考安排
     * @desc   根据用户id   来获取用户监考安排
     * @return array
     */
    public function getExamArrangeByUserID() {

        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $where['user_id']=$this->userId;


        //sql语句
        $sql = 'SELECT * FROM tbl_exam
                          WHERE exam_id
                          IN (SELECT exam_id FROM tbl_examArrange WHERE user_id=?)';




        //获取参数
        $params = array($this->userId);

        //获取多行数据
        $info = DI()->notorm->examArrange->queryRows($sql, $params);


        //如果为空则拼接为空的数组
        if (empty($info)) {
            DI()->logger->debug('user not found', $this->userId);

            $rs['code'] = 1;
            $rs['msg'] = T('user not exists');
            return $rs;
        }

        $rs['info'] = $info;

        return $rs;
    }






}
