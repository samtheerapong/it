<?php

namespace app\modules\ncr\models;

use Yii;

class NcrYear extends \yii\db\ActiveRecord
{
    
    public static function tableName()
    {
        return 'ncr_year';
    }

    public static function getDb()
    {
        return Yii::$app->get('dbqc');
    }

    public function rules()
    {
        return [
            [['active'], 'integer'],
            [['year'], 'string', 'max' => 255],
            [['color'], 'string', 'max' => 45],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'year' => Yii::t('app', 'ปี'),
            'color' => Yii::t('app', 'สี'),
            'active' => Yii::t('app', 'สถานะ'),
        ];
    }

    public function getNcrs()
    {
        return $this->hasMany(Ncr::class, ['year' => 'id']);
    }
}
