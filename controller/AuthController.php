<?php

function sign($request, $response, $service){
    require_once(__DIR__ . '\middleware\Auth.php');

    $auth = new Auth();
    $data = [
        "uid" => "S123",
        "name" => "Jack"
    ];

    $jwt = $auth->signJWT($data);

    return $jwt;
}

function decode($request, $response, $service){
    require_once(__DIR__ . '\middleware\Auth.php');

    $auth = new Auth();
    $dec = $auth->decodeJWT($request->param('jwt'));

    echo "\nDecode:\n" . print_r($dec, true) . "\n";
}

function auth($request, $response, $service) {
    include 'database/connection.php';
    require_once(__DIR__ . '\middleware\Auth.php');

    $auth = new Auth();
    
    $array = $request->paramsPost();

    include_once 'database/connection.php';
    
    $sql = 'SELECT * FROM student_info WHERE studentID = ' . $array["sid"] . ' AND password = ' . $array["pass"];
    $data = $con->query($sql);

    $token = [
        "uid" => $data->fetch_assoc()['studentID']
    ];

    $jwt = $auth->signJWT($token);

    return $jwt;
}