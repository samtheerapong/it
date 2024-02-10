<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\modules\it\models\search\TodoActionSearch $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="todo-action-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'todo_id') ?>

    <?= $form->field($model, 'hardware') ?>

    <?= $form->field($model, 'software') ?>

    <?= $form->field($model, 'cost') ?>

    <?php // echo $form->field($model, 'actor') ?>

    <?php // echo $form->field($model, 'activity') ?>

    <?php // echo $form->field($model, 'start_date') ?>

    <?php // echo $form->field($model, 'end_date') ?>

    <?php // echo $form->field($model, 'docs') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
