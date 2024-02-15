<?php

use app\modules\config\models\Department;
use app\modules\config\models\TodoStatus;
use yii\helpers\Html;
use kartik\form\ActiveForm;
use kartik\widgets\Select2;
use yii\helpers\ArrayHelper;

/** @var yii\web\View $this */
/** @var app\modules\it\models\Todo $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="todo-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="card border-secondary">
        <div class="card-header text-white bg-secondary">
            <?= Html::encode($this->title) ?>
        </div>

        <div class="card-body table-responsive">

            <?= $form->field($model, 'request_date')->textInput() ?>

            <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'department')->widget(Select2::class, [
                'data' => ArrayHelper::map(Department::find()->where(['active' => 1])->all(), 'id', 'name'),
                'options' => ['placeholder' => Yii::t('app', 'Select...')],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ]);
            ?>

            <?= $form->field($model, 'request_name')->textInput() ?>

            <?= $form->field($model, 'photo')->textarea(['rows' => 6]) ?>

            <?= $form->field($model, 'status')->widget(Select2::class, [
                'data' => ArrayHelper::map(TodoStatus::find()->where(['active' => 1])->all(), 'id', 'name'),
                'options' => ['placeholder' => Yii::t('app', 'Select...')],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ]);
            ?>
        
            <div class="form-group">
                <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
            </div>

        </div>

    </div>

    <?php ActiveForm::end(); ?>

</div>