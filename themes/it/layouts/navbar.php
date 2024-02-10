<?php

use yii\bootstrap5\Nav;
use yii\helpers\Html;
use yii\helpers\Url;

?>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="<?= Url::toRoute('/site/index') ?>" class="nav-link"><?= Yii::t('app', 'Home') ?></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="<?= Url::toRoute('/it/todo/index') ?>" class="nav-link"><?= Yii::t('app', 'Todos') ?></a>
        </li>
       
        <li class="nav-item dropdown">
            <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><?= Yii::t('app', 'Config') ?></a>
            <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
                <li><a href="<?= Url::toRoute('/config/department/index') ?>" class="dropdown-item"><?= Yii::t('app', 'Department') ?></a></li>
                <li><a href="<?= Url::toRoute('/config/hardware/index') ?>" class="dropdown-item"><?= Yii::t('app', 'Hardware') ?></a></li>
                <li><a href="<?= Url::toRoute('/config/software/index') ?>" class="dropdown-item"><?= Yii::t('app', 'Software') ?></a></li>
                <li><a href="<?= Url::toRoute('/config/todo-status/index') ?>" class="dropdown-item"><?= Yii::t('app', 'Status') ?></a></li>
                <!-- <li class="dropdown-divider"></li>
                <li><a href="<?= Url::toRoute('/user/index') ?>" class="dropdown-item"><?= Yii::t('app', 'User') ?></a></li> -->
            </ul>
        </li>
        <li class="nav-item dropdown">
            <a id="dropdownlogout" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Dropdown</a>
            <ul aria-labelledby="dropdownlogout" class="dropdown-menu border-0 shadow">
                <li><a href="#" class="dropdown-item">Some action </a></li>
                <li><a href="#" class="dropdown-item">Some other action</a></li>
                <li><?= Html::a('Sign out', ['site/logout'], ['data-method' => 'post', 'class' => 'dropdown-item']) ?></li>

                <li class="dropdown-divider"></li>

                <!-- Level two dropdown-->
                <li class="dropdown-submenu dropdown-hover">
                    <a id="dropdownSubMenu02" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-item dropdown-toggle">Hover for action</a>
                    <ul aria-labelledby="dropdownSubMenu02" class="dropdown-menu border-0 shadow">
                        <li>
                            <a tabindex="-1" href="#" class="dropdown-item">level 2</a>
                        </li>

                        <!-- Level three dropdown-->
                        <li class="dropdown-submenu">
                            <a id="dropdownSubMenu03" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-item dropdown-toggle">level 2</a>
                            <ul aria-labelledby="dropdownSubMenu03" class="dropdown-menu border-0 shadow">
                                <li><a href="#" class="dropdown-item">3rd level</a></li>
                                <li><a href="#" class="dropdown-item">3rd level</a></li>
                            </ul>
                        </li>
                        <!-- End Level three -->

                        <li><a href="#" class="dropdown-item">level 2</a></li>
                        <li><a href="#" class="dropdown-item">level 2</a></li>
                    </ul>
                </li>
                <!-- End Level two -->
            </ul>
        </li>
    </ul>


    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <?php
        if (Yii::$app->user->isGuest) {
            // echo Html::tag('li', Html::a(Yii::t('app', 'Register'), ['/site/signup'], ['class' => 'nav-link']));
            echo Html::tag('li', Html::a(Yii::t('app', 'Login'), ['/site/login'], ['class' => 'nav-link']));
        } else {
            $nameToDisplay = Yii::$app->user->identity->thai_name ?: Yii::$app->user->identity->username;
            $menuItems = [
                [
                    'label' => Yii::t('app', 'Configuration'),
                    'visible' => in_array(Yii::$app->user->identity->username, ['admin', 'theerapong']),
                    'items' => [
                        // [
                        //     'label' => Yii::t('app', 'Auto Number'),
                        //     'visible' => in_array(Yii::$app->user->identity->username, ['admin']),
                        //     'url' => ['/auto-number/index'],
                        // ],
                        [
                            'label' => Yii::t('app', 'Profile'),
                            'url' => ['/user/view', 'id' => Yii::$app->user->identity->id],
                        ],
                        // [
                        //     'label' => Yii::t('app', 'Users'),
                        //     'url' => ['/user/index'],
                        // ],
                    ],
                ],
                [
                    'label' => Yii::$app->language == 'th-TH' ? 'TH' : 'EN',
                    'url' => Url::current(['language' => Yii::$app->language == 'th-TH' ? 'en-US' : 'th-TH']),
                    'linkOptions' => ['class' => 'active'],
                ],
                [
                    'label' => "( $nameToDisplay )",
                    'items' => [
                        ['label' => Yii::t('app', 'Logout'), 'url' => ['/site/logout'], 'linkOptions' => ['class' => 'logout-link', 'data-method' => 'post']],
                    ],
                ],
            ];
            echo Nav::widget([
                'options' => ['class' => 'navbar-nav ml-auto'],
                'items' => $menuItems,
            ]);
        }
        ?>
    </ul>
</nav>
<!-- /.navbar -->