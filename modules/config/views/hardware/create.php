<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\config\models\Hardware $model */

$this->title = Yii::t('app', 'Create Hardware');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Hardwares'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="hardware-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
