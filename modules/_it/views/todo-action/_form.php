<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\modules\it\models\TodoAction $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="todo-action-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'todo_id')->textInput() ?>

    <?= $form->field($model, 'hardware')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'software')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'cost')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'actor')->textInput() ?>

    <?= $form->field($model, 'activity')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'start_date')->textInput() ?>

    <?= $form->field($model, 'end_date')->textInput() ?>

    <?= $form->field($model, 'docs')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
