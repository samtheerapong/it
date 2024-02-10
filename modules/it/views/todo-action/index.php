<?php

use app\modules\it\models\TodoAction;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\modules\it\models\search\TodoActionSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Todo Actions');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="todo-action-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Create Todo Action'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'todo_id',
            'hardware:ntext',
            'software:ntext',
            'cost',
            //'actor',
            //'activity:ntext',
            //'start_date',
            //'end_date',
            //'docs:ntext',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, TodoAction $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ],
        ],
    ]); ?>


</div>
