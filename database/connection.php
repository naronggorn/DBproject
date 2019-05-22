<?php

$servername = "localhost";
$username = "newacis";
$password = "12345678";
$dbname = "newacis";

$con = new mysqli($servername, $username, $password, $dbname);

mysqli_set_charset($con,"utf8");

if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}