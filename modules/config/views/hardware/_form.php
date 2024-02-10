<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\modules\config\models\Hardware $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="hardware-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'hardware_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'active')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
