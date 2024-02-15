<?php

use yii\bootstrap5\LinkPager;
use yii\helpers\Html;
use kartik\grid\GridView;

$this->title = Yii::t('app', 'Todos');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="todo-index">

    <div style="display: flex; justify-content: space-between;">
        <p>
            <?= Html::a('<i class="fa fa-circle-plus"></i> ' . Yii::t('app', 'Create New'), ['create'], ['class' => 'btn btn-success']) ?>
        </p>

        <p style="text-align: right;">
            <?= Html::a('<i class="fa fa-refresh text-white"></i>', ['index'], ['class' => 'btn btn-info btn-sm', 'title' => Yii::t('app', 'Refresh'), 'data-toggle' => 'tooltip']) ?>
            <?= Html::a('<i class="fa-solid fa-download"></i> ', ['/it/todo/export'], ['class' => 'btn btn-warning btn-sm', 'title' => Yii::t('app', 'Export'), 'data-toggle' => 'tooltip']) ?>
        </p>
    </div>

    <div class="card border-secondary">
        <div class="card-header text-white bg-secondary">
            <?= Html::encode($this->title) ?>
        </div>
        <div class="card-body table-responsive">

            <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'pager' => [
                    'class' => LinkPager::class,
                ],
                'columns' => [
                    [
                        'class' => 'yii\grid\SerialColumn',
                        'contentOptions' => ['class' => 'text-center', 'style' => 'width:45px;'],
                    ],

                    'todo_code',
                    'request_date',
                    'title',
                    'department',
                    //'request_name',
                    // 'photo:ntext',
                    'status',
                    //'created_at',
                    //'created_by',
                    //'updated_at',
                    //'updated_by',
                    [
                        'class' => 'kartik\grid\ActionColumn',
                        'headerOptions' => ['style' => 'width:250px;'],
                        'contentOptions' => ['class' => 'text-center'],
                        'buttonOptions' => ['class' => 'btn btn-outline-dark btn-sm'],
                        'template' => '<div class="btn-group btn-group-xs" role="group">{view} {update} {approve}</div>',
                        'buttons' => [
                            'approve' => function ($url, $model, $key) {
                                return Html::a('<i class="fa-solid fa-right-left"></i>', ['approve', 'id' => $model->id], [
                                    'title' => Yii::t('app', 'Approve'),
                                    'class' => 'btn btn-outline-dark btn-sm',
                                ]);
                            },
                        ],
                    ],
                ],
            ]); ?>


        </div>
    </div>
</div>