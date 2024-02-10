<?php

use yii\helpers\Url;

$this->title = Yii::t('app', 'Home');
$this->params['breadcrumbs'] = [['label' => $this->title]];
?>
<div class="container-fluid">

    <p>
    <h1>Non-conformity Report (NCR)</h1>
    <h4>
        <ol>
            <li><a href="<?= Url::toRoute('/ncr/ncr/index') ?>"><?= Yii::t('app', 'NCR') ?></a> | <a href="<?= Url::toRoute('/ncr/export/export-ncr') ?>">Export</a></li>
            <li><a href="<?= Url::toRoute('/ncr/ncr-reply/index') ?>"><?= Yii::t('app', 'Reply') ?></a> | <a href="<?= Url::toRoute('/ncr/export/export-reply') ?>">Export</a></li>
            <li><a href="<?= Url::toRoute('/ncr/ncr-protection/index') ?>"><?= Yii::t('app', 'Protection') ?></a> | <a href="<?= Url::toRoute('/ncr/export/export-protection') ?>">Export</a></li>
            <li><a href="<?= Url::toRoute('/ncr/ncr-closing/index') ?>"><?= Yii::t('app', 'Closing') ?></a> | <a href="<?= Url::toRoute('/ncr/export/export-closing') ?>">Export</a></li>
        </ol>
    </h4>
    </p>
</div>