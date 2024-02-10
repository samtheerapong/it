<?php
$this->title = 'Starter Page';
$this->params['breadcrumbs'] = [['label' => $this->title]];
?>
<div class="container-fluid">
    <div class="row">
        <p><?= env('TOKEN_LINE') ?></p>
    </div>
</div>