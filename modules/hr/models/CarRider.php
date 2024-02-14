<?php

namespace app\modules\hr\models;

use Yii;

/**
 * This is the model class for table "car_rider".
 *
 * @property int $id
 * @property string $name ชื่อ-สกุล
 * @property string|null $photo รูป
 * @property string|null $exp วันหมดอายุใบขับขี่
 * @property int|null $active สถานะ
 *
 * @property CarReserve[] $carReserves
 */
class CarRider extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'car_rider';
    }

    /**
     * @return \yii\db\Connection the database connection used by this AR class.
     */
    public static function getDb()
    {
        return Yii::$app->get('dbhr');
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['exp'], 'safe'],
            [['active'], 'integer'],
            [['name', 'photo'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'ชื่อ-สกุล'),
            'photo' => Yii::t('app', 'รูป'),
            'exp' => Yii::t('app', 'วันหมดอายุใบขับขี่'),
            'active' => Yii::t('app', 'สถานะ'),
        ];
    }

    /**
     * Gets query for [[CarReserves]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCarReserves()
    {
        return $this->hasMany(CarReserve::class, ['rider_id' => 'id']);
    }
}
