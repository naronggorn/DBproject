<?php
    function student($request, $response, $service) {
        include_once 'database/connection.php';
    
        $service->pageTitle = 'Student List';
    
        $sql = "SELECT * FROM student_info";
        $service->data = $con->query($sql);
    
        $service->render('views/home.php');
    }

    function login($request, $response, $service) {
        $service->render('views/login.html');
    }
?>