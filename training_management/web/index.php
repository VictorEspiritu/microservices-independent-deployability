<?php

if ($_SERVER['REQUEST_URI'] == '/healthcheck') {
    echo 'I am healthy';
    exit;
}

echo 'Hello, world! This is Training Management 10.0';
exit;

//require_once __DIR__ . '/../vendor/autoload.php';
//
//$app = new Silex\Application();
//$app['debug'] = true;
//
//$app->get('/', function () {
//    return 'Hello, world! This is Training Management';
//});
//
//$app->run();
