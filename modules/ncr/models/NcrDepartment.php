<?php

namespace app\modules\ncr\models;

use Yii;

class NcrDepartment extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return 'ncr_department';
    }

    public static function getDb()
    {
        return Yii::$app->get('dbqc');
    }

    public function rules()
    {
        return [
            [['active'], 'integer'],
            [['code', 'color'], 'string', 'max' => 45],
            [['name'], 'string', 'max' => 255],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'code' => Yii::t('app', 'รหัส'),
            'name' => Yii::t('app', 'แผนก'),
            'color' => Yii::t('app', 'สี'),
            'active' => Yii::t('app', 'สถานะ'),
        ];
    }

    public function getNcrs()
    {
        return $this->hasMany(Ncr::class, ['department_issue' => 'id']);
    }

    public function getNcrs0()
    {
        return $this->hasMany(Ncr::class, ['department_issue' => 'id']);
    }
}
