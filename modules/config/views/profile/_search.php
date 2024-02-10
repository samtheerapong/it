<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\modules\config\models\search\ProfileSearch $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="profile-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'active') ?>

    <?= $form->field($model, 'user_id') ?>

    <?= $form->field($model, 'thai_name') ?>

    <?= $form->field($model, 'eng_name') ?>

    <?php // echo $form->field($model, 'nick_name') ?>

    <?php // echo $form->field($model, 'department') ?>

    <?php // echo $form->field($model, 'location') ?>

    <?php // echo $form->field($model, 'position') ?>

    <?php // echo $form->field($model, 'email') ?>

    <?php // echo $form->field($model, 'tel_number') ?>

    <?php // echo $form->field($model, 'mobile_number') ?>

    <?php // echo $form->field($model, 'emp_id') ?>

    <?php // echo $form->field($model, 'birth_date') ?>

    <?php // echo $form->field($model, 'address') ?>

    <?php // echo $form->field($model, 'starting_date') ?>

    <?php // echo $form->field($model, 'resign_date') ?>

    <?php // echo $form->field($model, 'avatar') ?>

    <?php // echo $form->field($model, 'note') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
