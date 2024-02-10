<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\modules\config\models\Profile $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="profile-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'active')->textInput() ?>

    <?= $form->field($model, 'user_id')->textInput() ?>

    <?= $form->field($model, 'thai_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'eng_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nick_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'department')->textInput() ?>

    <?= $form->field($model, 'location')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'position')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tel_number')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'mobile_number')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'emp_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'birth_date')->textInput() ?>

    <?= $form->field($model, 'address')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'starting_date')->textInput() ?>

    <?= $form->field($model, 'resign_date')->textInput() ?>

    <?= $form->field($model, 'avatar')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'note')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
