<?php

class Api_News extends PhalApi_Api {

    public function getRules() {
        return array(
            'getList' => array(
                'currPage' => array('name' => 'currPage', 'type' => 'int', 'min' => 0, 'require' => true, 'desc' => '当前页数'),
                'count' => array('name' => 'count', 'require' => true, 'desc' => '每页行数'),

            ),

        );
    }


    public function getList(){
        $rs = array('code' => 0, 'msg' => '', 'info' => array());




        $info = DI()->notorm->news->limit($this->currPage*$this->count,$this->count)->fetchAll();



        if (empty($info)) {
            DI()->logger->debug('user not found', $this->currPage);

            $rs['code'] = 1;
            $rs['msg'] = T('user not exists');
            return $rs;
        }

        $rs['info'] = $info;

        return $rs;
    }



}