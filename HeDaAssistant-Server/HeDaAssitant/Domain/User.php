<?php

class Domain_User {

    public function getBaseInfo($userId) {
        $rs = array();

        $userId = intval($userId);
        if ($userId <= 0) {
            return $rs;
        }

        $model = new Model_User();
        $rs = $model->getByUserId($userId);

		/**
        $model = new Model_User();
        $rs = $model->getByUserIdWithCache($userId);
		*/

		/**
		$query = new PhalApi_ModelQuery();
		$query->id = $userId;
		$modelProxy = new ModelProxy_UserBaseInfo();
		$rs = $modelProxy->getData($query);
		*/

        return $rs;
    }
}
