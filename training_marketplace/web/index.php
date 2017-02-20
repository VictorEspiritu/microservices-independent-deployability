<?php

require_once __DIR__ . '/../vendor/autoload.php';

$app = new Silex\Application();
$app['debug'] = true;

$app->get('/', function () {
    $answerFromTrainingManagement = file_get_contents(
        'http://training_management_webserver/'
    );

    return 'Hello, world! This is Training Marketplace. Training Management says: '
        . $answerFromTrainingManagement;
});

$app->run();
