<?php

namespace app\modules\config\models;

use Yii;

/**
 * This is the model class for table "hardware".
 *
 * @property int $id
 * @property string $hardware_name ชื่อ
 * @property int|null $active สถานะ
 */
class Hardware extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'hardware';
    }

    public static function getDb()
    {
        return Yii::$app->get('dbit');
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['hardware_name'], 'required'],
            [['active'], 'integer'],
            [['hardware_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'hardware_name' => Yii::t('app', 'ชื่อ'),
            'active' => Yii::t('app', 'สถานะ'),
        ];
    }
}
