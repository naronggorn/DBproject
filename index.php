<?php
error_reporting(-1);

require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/map_route.php';

header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$klein = new \Klein\Klein();

// Core
$klein->respond(route("AppController@layout"));

// Resource
$klein->respond('/public/[css|js|font:folder]/[:filename].[:ext]', route("AppController@staticFile"));
$klein->respond('/public/img/[:filename].[:ext]', route("AppController@staticPicture"));

// View
$klein->respond('/home', route("HomeController@student"));
$klein->respond('GET', '/login', route("HomeController@login"));

$klein->respond('/sign', route("AuthController@sign"));
$klein->respond('/decode/[:jwt]', route("AuthController@decode"));
$klein->respond('POST', '/login', route("AuthController@auth"));

// Action

// Staff Route
$klein->respond('/staff', route("StaffController@showStaff"));
$klein->respond('POST', '/add-staff', route("StaffController@addStaff"));
$klein->respond('GET', '/get-staff', route("StaffController@getAllStaff"));
$klein->respond('GET', '/get-staff/[:id]', route("StaffController@getOneStaff"));
$klein->respond('POST', '/edit-staff', route("StaffController@editStaff"));
$klein->respond('POST', '/delete-staff', route("StaffController@deleteStaff"));

// Parent Route
$klein->respond('/parent', route("ParentController@showParent"));
$klein->respond('POST', '/add-parent', route("ParentController@addParent"));
$klein->respond('GET', '/get-parent/[:id]', route("ParentController@getOneParent"));
$klein->respond('GET', '/get-parent', route("ParentController@getAllParent"));
$klein->respond('POST', '/edit-parent', route("ParentController@editParent"));
$klein->respond('POST', '/delete-parent', route("ParentController@deleteParent"));

$klein->dispatch();