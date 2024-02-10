<?php

namespace app\modules\config\models;

use Yii;

/**
 * This is the model class for table "profile".
 *
 * @property int $id
 * @property int|null $active สถานะ
 * @property int|null $user_id USER ID
 * @property string|null $thai_name ชื่อ-สกุล
 * @property string|null $eng_name ชื่ออังกฤษ
 * @property string|null $nick_name ชื่อเล่น
 * @property int|null $department แผนก
 * @property string|null $location สถานที่
 * @property string|null $position ตำแหน่ง
 * @property string|null $email อีเมล
 * @property string|null $tel_number เบอร์ภายใน
 * @property string|null $mobile_number เบอร์มือถือ
 * @property string|null $emp_id รหัสพนักงาน
 * @property string|null $birth_date วันเกิด
 * @property string|null $address ที่อยู่
 * @property string|null $starting_date วันเริ่มงาน
 * @property string|null $resign_date วันลาออก
 * @property string|null $avatar อวทาร์
 * @property string|null $note บันทึก
 */
class Profile extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'profile';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['active', 'user_id', 'department'], 'integer'],
            [['birth_date', 'starting_date', 'resign_date'], 'safe'],
            [['address', 'avatar', 'note'], 'string'],
            [['thai_name', 'eng_name', 'location', 'position', 'email'], 'string', 'max' => 200],
            [['nick_name', 'tel_number', 'mobile_number', 'emp_id'], 'string', 'max' => 45],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'active' => Yii::t('app', 'สถานะ'),
            'user_id' => Yii::t('app', 'USER ID'),
            'thai_name' => Yii::t('app', 'ชื่อ-สกุล'),
            'eng_name' => Yii::t('app', 'ชื่ออังกฤษ'),
            'nick_name' => Yii::t('app', 'ชื่อเล่น'),
            'department' => Yii::t('app', 'แผนก'),
            'location' => Yii::t('app', 'สถานที่'),
            'position' => Yii::t('app', 'ตำแหน่ง'),
            'email' => Yii::t('app', 'อีเมล'),
            'tel_number' => Yii::t('app', 'เบอร์ภายใน'),
            'mobile_number' => Yii::t('app', 'เบอร์มือถือ'),
            'emp_id' => Yii::t('app', 'รหัสพนักงาน'),
            'birth_date' => Yii::t('app', 'วันเกิด'),
            'address' => Yii::t('app', 'ที่อยู่'),
            'starting_date' => Yii::t('app', 'วันเริ่มงาน'),
            'resign_date' => Yii::t('app', 'วันลาออก'),
            'avatar' => Yii::t('app', 'อวทาร์'),
            'note' => Yii::t('app', 'บันทึก'),
        ];
    }
}
