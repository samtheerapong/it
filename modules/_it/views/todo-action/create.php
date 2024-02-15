<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\it\models\TodoAction $model */

$this->title = Yii::t('app', 'Create Todo Action');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Todo Actions'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="todo-action-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
