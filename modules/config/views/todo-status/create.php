<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\config\models\TodoStatus $model */

$this->title = Yii::t('app', 'Create Todo Status');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Todo Statuses'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="todo-status-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
