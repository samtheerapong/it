<?php

namespace app\modules\ncr\models;

use Yii;

class NcrConcession extends \yii\db\ActiveRecord
{
 
    public static function tableName()
    {
        return 'ncr_concession';
    }

    public static function getDb()
    {
        return Yii::$app->get('dbqc');
    }

    public function rules()
    {
        return [
            [['active'], 'integer'],
            [['concession_name'], 'string', 'max' => 100],
            [['color'], 'string', 'max' => 45],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'concession_name' => Yii::t('app', 'การยอมรับ'),
            'color' => Yii::t('app', 'สี'),
            'active' => Yii::t('app', 'สถานะ'),
        ];
    }

    // public function getNcrAccepts()
    // {
    //     return $this->hasMany(NcrAccept::class, ['ncr_concession_id' => 'id']);
    // }
}
