<?php

namespace app\modules\it\models;

use app\modules\config\models\TodoStatus;
use Yii;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\TimestampBehavior;
use yii\db\BaseActiveRecord;
use yii\web\UploadedFile;

/**
 * This is the model class for table "todo".
 *
 * @property int $id
 * @property string $todo_code รหัส
 * @property string|null $request_date วันที่ขอ
 * @property string $title หัวข้อ
 * @property int $department แผนก
 * @property int $request_name ผู้แจ้ง
 * @property string|null $photo รูป
 * @property int|null $status สถานะ
 * @property string|null $created_at เพิ่มเมื่อ
 * @property int|null $created_by เพิ่มโดย
 * @property string|null $updated_at ปรับปรุงเมื่อ
 * @property int|null $updated_by ปรับปรุงโดย
 *
 * @property TodoStatus $status0
 * @property TodoAction[] $todoActions
 */
class Todo extends \yii\db\ActiveRecord
{
    const UPLOAD_FOLDER = 'uploads/it/todo';

    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::class,
                'attributes' => [
                    self::EVENT_BEFORE_INSERT => ['created_at'],
                    self::EVENT_BEFORE_UPDATE => ['updated_at'],
                ],
                'value' => function () {
                    return date('Y-m-d H:i:s');
                },
            ],
            [
                'class' => BlameableBehavior::class,
                'attributes' => [
                    BaseActiveRecord::EVENT_BEFORE_INSERT => ['created_by', 'updated_by'],
                    BaseActiveRecord::EVENT_BEFORE_UPDATE => ['updated_by'],
                ],
            ],
        ];
    }
 
    public static function tableName()
    {
        return 'todo';
    }

    public static function getDb()
    {
        return Yii::$app->get('dbit');
    }

    public function rules()
    {
        return [
            [['title', 'department', 'request_name'], 'required'],
            [['request_date', 'created_at', 'updated_at'], 'safe'],
            [['department', 'request_name', 'status', 'created_by', 'updated_by'], 'integer'],
            [['photo'], 'string'],
            [['todo_code'], 'string', 'max' => 45],
            [['title'], 'string', 'max' => 255],
            [['status'], 'exist', 'skipOnError' => true, 'targetClass' => TodoStatus::class, 'targetAttribute' => ['status' => 'id']],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'todo_code' => Yii::t('app', 'รหัส'),
            'request_date' => Yii::t('app', 'วันที่ขอ'),
            'title' => Yii::t('app', 'หัวข้อ'),
            'department' => Yii::t('app', 'แผนก'),
            'request_name' => Yii::t('app', 'ผู้แจ้ง'),
            'photo' => Yii::t('app', 'รูป'),
            'status' => Yii::t('app', 'สถานะ'),
            'created_at' => Yii::t('app', 'เพิ่มเมื่อ'),
            'created_by' => Yii::t('app', 'เพิ่มโดย'),
            'updated_at' => Yii::t('app', 'ปรับปรุงเมื่อ'),
            'updated_by' => Yii::t('app', 'ปรับปรุงโดย'),
        ];
    }

    public function getStatus0()
    {
        return $this->hasOne(TodoStatus::class, ['id' => 'status']);
    }

    public function getTodoActions()
    {
        return $this->hasMany(TodoAction::class, ['todo_id' => 'id']);
    }

    public function upload($model, $attribute)
    {
        $photo  = UploadedFile::getInstance($model, $attribute);
        $path = $this->getUploadPath();
        if ($this->validate() && $photo !== null) {

            $fileName = md5($photo->baseName . time()) . '.' . $photo->extension;
            if ($photo->saveAs($path . $fileName)) {
                return $fileName;
            }
        }
        return $model->isNewRecord ? false : $model->getOldAttribute($attribute);
    }

    public function getUploadPath()
    {
        return Yii::getAlias('@webroot') . '/' . self::UPLOAD_FOLDER . '/';
    }

    public function getUploadUrl()
    {
        return Yii::getAlias('@web') . '/' . self::UPLOAD_FOLDER . '/';
    }

    public function getPhotoViewer()
    {
        return empty($this->photo) ? Yii::getAlias('@web') . '/images/avatar.jpg' : $this->getUploadUrl() . $this->photo;
    }
}
