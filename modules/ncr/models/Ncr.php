<?php

namespace app\modules\ncr\models;

use Yii;
use app\models\User;
use app\modules\config\models\Department;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\TimestampBehavior;
use yii\db\BaseActiveRecord;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\helpers\Url;

class Ncr extends \yii\db\ActiveRecord
{
    const UPLOAD_FOLDER = 'uploads/ncr/ncr';

    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::class,
                'attributes' => [
                    self::EVENT_BEFORE_INSERT => ['created_at', 'created_date'],
                    self::EVENT_BEFORE_UPDATE => ['updated_at'],
                ],
                'value' => function () {
                    return date('Y-m-d H:i:s');
                },
            ],
            [
                'class' => BlameableBehavior::class,
                'attributes' => [
                    BaseActiveRecord::EVENT_BEFORE_INSERT => ['created_by', 'updated_by', 'report_by'],
                    BaseActiveRecord::EVENT_BEFORE_UPDATE => ['updated_by'],
                ],
            ],
        ];
    }

    public static function tableName()
    {
        return 'ncr';
    }

    public static function getDb()
    {
        return Yii::$app->get('dbqc');
    }

    public function rules()
    {
        return [
            [['created_date', 'production_date', 'created_at', 'updated_at', 'process'], 'safe'],
            [['month', 'year', 'department', 'category_id', 'sub_category_id', 'department_issue', 'report_by', 'ncr_status_id', 'created_by', 'updated_by'], 'integer'],
            [['datail', 'action'], 'string'],
            [['ncr_number'], 'string', 'max' => 100],
            [['lot', 'product_name', 'customer_name'], 'string', 'max' => 255],
            [['ref'], 'string', 'max' => 45],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => NcrCategory::class, 'targetAttribute' => ['category_id' => 'id']],
            [['department_issue'], 'exist', 'skipOnError' => true, 'targetClass' => Department::class, 'targetAttribute' => ['department_issue' => 'id']],
            [['month'], 'exist', 'skipOnError' => true, 'targetClass' => NcrMonth::class, 'targetAttribute' => ['month' => 'id']],
            [['ncr_status_id'], 'exist', 'skipOnError' => true, 'targetClass' => NcrStatus::class, 'targetAttribute' => ['ncr_status_id' => 'id']],
            [['sub_category_id'], 'exist', 'skipOnError' => true, 'targetClass' => NcrSubCategory::class, 'targetAttribute' => ['sub_category_id' => 'id']],
            [['year'], 'exist', 'skipOnError' => true, 'targetClass' => NcrYear::class, 'targetAttribute' => ['year' => 'id']],
            [['docs'], 'file', 'maxFiles' => 10, 'skipOnEmpty' => true]
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'ncr_number' => Yii::t('app', 'NCR Number'),
            'created_date' => Yii::t('app', 'Created Date'),
            'monthly' => Yii::t('app', 'Monthly'),
            'month' => Yii::t('app', 'Month'),
            'year' => Yii::t('app', 'Year'),
            'department' => Yii::t('app', 'To Department'),
            'process' => Yii::t('app', 'Process'),
            'lot' => Yii::t('app', 'Lot'),
            'production_date' => Yii::t('app', 'Production Date'),
            'product_name' => Yii::t('app', 'Product Name'),
            'customer_name' => Yii::t('app', 'Customer Name'),
            'category_id' => Yii::t('app', 'Category'),
            'sub_category_id' => Yii::t('app', 'Sub Category'),
            'datail' => Yii::t('app', 'Datail'),
            'department_issue' => Yii::t('app', 'Department Issue'),
            'report_by' => Yii::t('app', 'Reporter'),
            'action' => Yii::t('app', 'Start Action'),
            'docs' => Yii::t('app', 'Attach file'),
            'ref' => Yii::t('app', 'Refer'),
            'ncr_status_id' => Yii::t('app', 'Ncr Status'),
            'created_at' => Yii::t('app', 'Created At'),
            'created_by' => Yii::t('app', 'Created By'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'updated_by' => Yii::t('app', 'Updated By'),
        ];
    }

    public function getCategory()
    {
        return $this->hasOne(NcrCategory::class, ['id' => 'category_id']);
    }

    public function getFromDepartment()
    {
        return $this->hasOne(Department::class, ['id' => 'department_issue']);
    }

    public function getNcrProcess()
    {
        return $this->hasOne(NcrProcess::class, ['id' => 'process']);
    }

    // public function getNcrAcceptS()
    // {
    //     return $this->hasMany(NcrAccept::class, ['ncr_id' => 'id']);
    // }

    public function getNcrProtections()
    {
        return $this->hasMany(NcrProtection::class, ['ncr_id' => 'id']);
    }

    public function getNcrReplies()
    {
        return $this->hasMany(NcrReply::class, ['ncr_id' => 'id']);
    }

    public function getNcrStatus()
    {
        return $this->hasOne(NcrStatus::class, ['id' => 'ncr_status_id']);
    }

    public function getSubCategory()
    {
        return $this->hasOne(NcrSubCategory::class, ['id' => 'sub_category_id']);
    }

    public function getYear0()
    {
        return $this->hasOne(NcrYear::class, ['id' => 'year']);
    }

    public function getMonth0()
    {
        return $this->hasOne(NcrMonth::class, ['id' => 'month']);
    }

    public function getToDepartment()
    {
        return $this->hasOne(Department::class, ['id' => 'department']);
    }

    public function getReporter()
    {
        return $this->hasOne(User::class, ['id' => 'report_by']);
    }

    public function getCreated()
    {
        return $this->hasOne(User::class, ['id' => 'created_by']);
    }

    public function getUpdated()
    {
        return $this->hasOne(User::class, ['id' => 'updated_by']);
    }

    // process
    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if (!empty($this->process)) {
                $this->process = $this->setToArray($this->process);
            }
            return true;
        } else {
            return false;
        }
    }

    //********** Array
    public function getArray($value)
    {
        return explode(',', $value);
    }

    public function setToArray($value)
    {
        return is_array($value) ? implode(',', $value) : NULL;
    }

    //********** Upload Path*/
    public static function getUploadPath()
    {
        return Yii::getAlias('@webroot') . '/' . self::UPLOAD_FOLDER . '/';
    }

    public static function getUploadUrl()
    {
        return Url::base(true) . '/' . self::UPLOAD_FOLDER  . '/';
    }

    //********** List Downloads */
    public function listDownloadFiles($type, $width)
    {
        $docs_file = '';
        if (in_array($type, ['docs'])) {
            $data = $type === 'docs' ? $this->docs : '';
            $files = Json::decode($data);
            if (is_array($files)) {
                $docs_file = '<ul>';
                foreach ($files as $key => $value) {
                    if (strpos($value, '.jpg') !== false || strpos($value, '.jpeg') !== false || strpos($value, '.png') !== false || strpos($value, '.gif') !== false) {
                        $thumbnail = Html::img(['/ncr/ncr/download', 'id' => $this->id, 'file' => $key, 'fullname' => $value], ['class' => 'img-thumbnail', 'alt' => 'Image', 'style' => 'width:' . $width]);
                        $fullSize = Html::a($thumbnail, ['/ncr/ncr/download', 'id' => $this->id, 'file' => $key, 'fullname' => $value], ['target' => '_blank']);
                        $docs_file .= '<li class="mb-2">' . $fullSize . '</li>';
                    } else {
                        $docs_file .= '<li class="mb-2">' . Html::a($value, ['/ncr/ncr/download', 'id' => $this->id, 'file' => $key, 'fullname' => $value]) . '</li>';
                    }
                }
                $docs_file .= '</ul>';
            }
        }

        return $docs_file;
    }

    //********** initialPreview */    
    public function isImage($filePath)
    {
        return @is_array(getimagesize($filePath)) ? true : false;
    }

    public function initialPreview($data, $field, $type = 'file')
    {
        $initial = [];
        $files = Json::decode($data);
        if (is_array($files)) {
            foreach ($files as $key => $value) {
                if ($isImage = true) {
                    if ($type == 'file') {
                        $initial[] = Html::img(['/ncr/ncr/download', 'id' => $this->id, 'file' => $key, 'fullname' => $value], ['class' => 'file-preview-image', 'alt' => '']);
                    } elseif ($type == 'config') {
                        $initial[] = [
                            // 'type' => 'pdf',
                            'caption' => $value,
                            'width'  => '120px',
                            'url'    => Url::to(['/ncr/ncr/deletefile', 'id' => $this->id, 'fileName' => $key, 'field' => $field]),
                            'key'    => $key
                        ];
                    } else {
                        $initial[] = "<div class='file-preview-other'><h2><i class='fa fa-file'></i></h2></div>";
                    }
                }
            }
        }
        return $initial;
    }


    public function getNcrReplyItem()
    {
        return $this->hasMany(NcrReply::class, ['ncr_id' => 'id']);
    }

    public function getNcrProtectItem()
    {
        return $this->hasMany(NcrProtection::class, ['ncr_id' => 'id']);
    }

    public function getNcrClosingItem()
    {
        return $this->hasMany(NcrClosing::class, ['ncr_id' => 'id']);
    }
}
