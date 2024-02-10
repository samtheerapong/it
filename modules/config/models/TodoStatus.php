<?php

namespace app\modules\config\models;

use app\modules\it\models\Todo;
use Yii;

/**
 * This is the model class for table "todo_status".
 *
 * @property int $id
 * @property string|null $name
 * @property string|null $color
 * @property int|null $active
 *
 * @property Todo[] $todos
 */
class TodoStatus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'todo_status';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['active'], 'integer'],
            [['name', 'color'], 'string', 'max' => 45],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'color' => Yii::t('app', 'Color'),
            'active' => Yii::t('app', 'Active'),
        ];
    }

    /**
     * Gets query for [[Todos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTodos()
    {
        return $this->hasMany(Todo::class, ['status' => 'id']);
    }
}
