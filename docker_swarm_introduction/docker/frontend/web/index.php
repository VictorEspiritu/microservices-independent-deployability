<?php

$backendResponse = file_get_contents('http://backend/');

echo 'Hello, world! Backend says: ' . $backendResponse;
exit;
