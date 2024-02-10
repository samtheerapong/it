<?php

namespace app\modules\it\models;

use Yii;

/**
 * This is the model class for table "todo_action".
 *
 * @property int $id
 * @property int|null $todo_id TO DO
 * @property string|null $hardware อุปกรณ์
 * @property string|null $software
 * @property float|null $cost ค่าใช้จ่าย
 * @property int|null $actor ผู้ดำเนินการ
 * @property string|null $activity วิธีการ
 * @property string|null $start_date วันที่เริ่ม
 * @property string|null $end_date วันที่เสร็จ
 * @property string|null $docs แนบไฟล์
 *
 * @property Todo $todo
 */
class TodoAction extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'todo_action';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['todo_id', 'actor'], 'integer'],
            [['hardware', 'software', 'activity', 'docs'], 'string'],
            [['cost'], 'number'],
            [['start_date', 'end_date'], 'safe'],
            [['todo_id'], 'exist', 'skipOnError' => true, 'targetClass' => Todo::class, 'targetAttribute' => ['todo_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'todo_id' => Yii::t('app', 'TO DO'),
            'hardware' => Yii::t('app', 'อุปกรณ์'),
            'software' => Yii::t('app', 'Software'),
            'cost' => Yii::t('app', 'ค่าใช้จ่าย'),
            'actor' => Yii::t('app', 'ผู้ดำเนินการ'),
            'activity' => Yii::t('app', 'วิธีการ'),
            'start_date' => Yii::t('app', 'วันที่เริ่ม'),
            'end_date' => Yii::t('app', 'วันที่เสร็จ'),
            'docs' => Yii::t('app', 'แนบไฟล์'),
        ];
    }

    /**
     * Gets query for [[Todo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTodo()
    {
        return $this->hasOne(Todo::class, ['id' => 'todo_id']);
    }
}
