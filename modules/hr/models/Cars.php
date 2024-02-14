<?php

namespace app\modules\hr\models;

use Yii;

/**
 * This is the model class for table "cars".
 *
 * @property int $id
 * @property string|null $ license_plate ทะเบียนรถ
 * @property int|null $car_type_id ประเภทรถ
 * @property int|null $seats จำนวนที่นั่ง
 * @property string|null $photo รูปรถ
 * @property string|null $last_service ซ่อมบำรุงล่าสุด
 * @property int|null $status_id สถานะ
 *
 * @property CarReserve[] $carReserves
 * @property CarsType $carType
 * @property CarsStatus $status
 */
class Cars extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'cars';
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
            [['car_type_id', 'seats', 'status_id'], 'integer'],
            [['last_service'], 'safe'],
            [['license_plate'], 'string', 'max' => 45],
            [['photo'], 'string', 'max' => 255],
            [['status_id'], 'exist', 'skipOnError' => true, 'targetClass' => CarsStatus::class, 'targetAttribute' => ['status_id' => 'id']],
            [['car_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => CarsType::class, 'targetAttribute' => ['car_type_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'license_plate' => Yii::t('app', 'ทะเบียนรถ'),
            'car_type_id' => Yii::t('app', 'ประเภทรถ'),
            'seats' => Yii::t('app', 'จำนวนที่นั่ง'),
            'photo' => Yii::t('app', 'รูปรถ'),
            'last_service' => Yii::t('app', 'ซ่อมบำรุงล่าสุด'),
            'status_id' => Yii::t('app', 'สถานะ'),
        ];
    }

    /**
     * Gets query for [[CarReserves]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCarReserves()
    {
        return $this->hasMany(CarReserve::class, ['car_id' => 'id']);
    }

    /**
     * Gets query for [[CarType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCarType()
    {
        return $this->hasOne(CarsType::class, ['id' => 'car_type_id']);
    }

    /**
     * Gets query for [[Status]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getStatus()
    {
        return $this->hasOne(CarsStatus::class, ['id' => 'status_id']);
    }
}
