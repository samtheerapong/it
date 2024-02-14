<?php

namespace app\modules\hr\models;

use Yii;

/**
 * This is the model class for table "car_reserve".
 *
 * @property int $id
 * @property string $code รหัส
 * @property string $destination ที่หมาย
 * @property string|null $description รายละเอียด
 * @property int|null $passenger จำนวนผู้โดยสาร
 * @property string $date_start วันที่ไป
 * @property string $date_end วันที่กลับ
 * @property string|null $note บันทึก
 * @property int|null $user_id ผู้จจอง
 * @property int|null $car_id รถ
 * @property int|null $rider_id ผู้ขับ
 * @property int|null $approve_by ผู้อนุมัติ
 * @property string|null $approve_date อนุมัติเมื่อ
 * @property string|null $approve_comment ความคิดเห็นผู้อนุมัติ
 * @property int $status_id สถานะ
 * @property string|null $created_at บันทึกเมื่อ
 * @property string|null $updated_at ปรับปรุงเมื่อ
 *
 * @property Cars $car
 * @property CarRider $rider
 * @property CarReserveStatus $status
 */
class CarReserve extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'car_reserve';
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
            [['code', 'destination', 'date_start', 'date_end'], 'required'],
            [['description', 'approve_comment'], 'string'],
            [['passenger', 'user_id', 'car_id', 'rider_id', 'approve_by', 'status_id'], 'integer'],
            [['date_start', 'date_end', 'approve_date', 'created_at', 'updated_at'], 'safe'],
            [['code'], 'string', 'max' => 45],
            [['destination', 'note'], 'string', 'max' => 255],
            [['status_id'], 'exist', 'skipOnError' => true, 'targetClass' => CarReserveStatus::class, 'targetAttribute' => ['status_id' => 'id']],
            [['rider_id'], 'exist', 'skipOnError' => true, 'targetClass' => CarRider::class, 'targetAttribute' => ['rider_id' => 'id']],
            [['car_id'], 'exist', 'skipOnError' => true, 'targetClass' => Cars::class, 'targetAttribute' => ['car_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'code' => Yii::t('app', 'รหัส'),
            'destination' => Yii::t('app', 'ที่หมาย'),
            'description' => Yii::t('app', 'รายละเอียด'),
            'passenger' => Yii::t('app', 'จำนวนผู้โดยสาร'),
            'date_start' => Yii::t('app', 'วันที่ไป'),
            'date_end' => Yii::t('app', 'วันที่กลับ'),
            'note' => Yii::t('app', 'บันทึก'),
            'user_id' => Yii::t('app', 'ผู้จจอง'),
            'car_id' => Yii::t('app', 'รถ'),
            'rider_id' => Yii::t('app', 'ผู้ขับ'),
            'approve_by' => Yii::t('app', 'ผู้อนุมัติ'),
            'approve_date' => Yii::t('app', 'อนุมัติเมื่อ'),
            'approve_comment' => Yii::t('app', 'ความคิดเห็นผู้อนุมัติ'),
            'status_id' => Yii::t('app', 'สถานะ'),
            'created_at' => Yii::t('app', 'บันทึกเมื่อ'),
            'updated_at' => Yii::t('app', 'ปรับปรุงเมื่อ'),
        ];
    }

    /**
     * Gets query for [[Car]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCar0()
    {
        return $this->hasOne(Cars::class, ['id' => 'car_id']);
    }

    /**
     * Gets query for [[Rider]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRider0()
    {
        return $this->hasOne(CarRider::class, ['id' => 'rider_id']);
    }

    /**
     * Gets query for [[Status]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getStatus0()
    {
        return $this->hasOne(CarReserveStatus::class, ['id' => 'status_id']);
    }
}
