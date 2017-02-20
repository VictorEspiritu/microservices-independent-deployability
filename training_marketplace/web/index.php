<?php

if ($_SERVER['REQUEST_URI'] == '/healthcheck') {
    echo 'I am healthy';
    exit;
}

$answerFromTrainingManagement = file_get_contents(
    'http://training_management_webserver/'
);

echo'Hello, world! This is Training Marketplace. Training Management says: '
    . $answerFromTrainingManagement;

//require_once __DIR__ . '/../vendor/autoload.php';
//
//$app = new Silex\Application();
//$app['debug'] = true;
//
//$app->get('/', function () {
//    $answerFromTrainingManagement = file_get_contents(
//        'http://training_management_webserver/'
//    );
//
//    return 'Hello, world! This is Training Marketplace. Training Management says: '
//        . $answerFromTrainingManagement;
//});
//
//$app->run();
