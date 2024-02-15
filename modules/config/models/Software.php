<?php

namespace app\modules\config\models;

use Yii;

/**
 * This is the model class for table "software".
 *
 * @property int $id
 * @property string|null $software_name ชื่อ
 * @property int|null $active สถานะ
 */
class Software extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'software';
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
            [['active'], 'integer'],
            [['software_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'software_name' => Yii::t('app', 'ชื่อ'),
            'active' => Yii::t('app', 'สถานะ'),
        ];
    }
}
