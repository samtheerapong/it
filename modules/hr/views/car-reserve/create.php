<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\hr\models\CarReserve $model */

$this->title = Yii::t('app', 'Create Car Reserve');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Car Reserves'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="car-reserve-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
