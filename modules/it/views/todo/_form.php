<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\modules\it\models\Todo $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="todo-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'todo_code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'request_date')->textInput() ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'department')->textInput() ?>

    <?= $form->field($model, 'request_name')->textInput() ?>

    <?= $form->field($model, 'photo')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'created_by')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <?= $form->field($model, 'updated_by')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
