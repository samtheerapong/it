<?php

return [
    // 'class' => 'yii\db\Connection',
    // 'dsn' => 'mysql:host=localhost;dbname=db-it',
    // 'username' => 'sam',
    // 'password' => 'sam',
    // 'charset' => 'utf8',
    'class' => 'yii\db\Connection',
    'dsn' => 'mysql:host='. env('DB_HOST') .';dbname='. env('DB_NAME'),
    'username' => env('DB_USER'),
    'password' => env('DB_PASS'),
    'charset' => env('CHARSET'),

    // Schema cache options (for production environment)
    //'enableSchemaCache' => true,
    //'schemaCacheDuration' => 60,
    //'schemaCache' => 'cache',
];
