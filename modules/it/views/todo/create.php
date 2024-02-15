<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\it\models\Todo $model */

$this->title = Yii::t('app', 'Create Todo');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Todos'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="todo-create">
    <p>
        <?= Html::a('<i class="fas fa-circle-left"></i> ' . Yii::t('app', 'Go Back'), ['index'], ['class' => 'btn btn-primary']) ?>
    </p>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>