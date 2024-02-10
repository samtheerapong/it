<?php

use app\modules\config\models\Profile;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\modules\config\models\search\ProfileSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Profiles');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="profile-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Create Profile'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'active',
            'user_id',
            'thai_name',
            'eng_name',
            //'nick_name',
            //'department',
            //'location',
            //'position',
            //'email:email',
            //'tel_number',
            //'mobile_number',
            //'emp_id',
            //'birth_date',
            //'address:ntext',
            //'starting_date',
            //'resign_date',
            //'avatar:ntext',
            //'note:ntext',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Profile $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ],
        ],
    ]); ?>


</div>
