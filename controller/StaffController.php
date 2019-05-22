<?php
    function showStaff($request, $response, $service) {
        $service->pageTitle = 'Staff List';
        $service->script = '<script src="public/js/staff.js"></script>';
    
        $service->render('views/staff.html');
    }

    function addStaff($request, $response) {
        include 'database/connection.php';
    
        $array = $request->paramsPost();
    
        $hash = password_hash($array['password'], PASSWORD_DEFAULT);
        $array['password'] = $hash;
    
        $sql = "INSERT INTO staff_info VALUES(";
    
        $i = 1;
    
        foreach($array as $param) {
            if($i == count($array)) $sql .= '"'. $param . '")';
            else $sql .= '"'. $param . '",';
            $i++;
        }
    
        $con->query($sql);
    
        $response->redirect("/staff", $status = 200)->send();
    }

    function getOneStaff($request, $response, $service) {
        include_once 'database/connection.php';
    
        $sql = 'SELECT * FROM staff_info WHERE staffID = "'.$request->params()['id'].'"';
        $data = $con->query($sql);
    
        $con->close();
    
        return json_encode($data->fetch_assoc(), JSON_UNESCAPED_UNICODE);
    }
    
    function getAllStaff($request, $response, $service) {
        include_once 'database/connection.php';
    
        $sql = 'SELECT * FROM staff_info';
        $data = $con->query($sql);
    
        $con->close();
    
        return json_encode($data->fetch_all(), JSON_UNESCAPED_UNICODE);
    }

    function editStaff($request, $response, $service) {
        include 'database/connection.php';
    
        $sql = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'staff_info'";
        $data = $con->query($sql);
    
        if($request->paramsPost()['pass'] == "") {
            $array = $data->fetch_all();
            array_splice($array, count($data->fetch_all()) - 1);
    
            $params = $request->params();
            array_splice($params, count($request->paramsPost()) - 1);
        } else {
            $array = $data->fetch_all();
            $params = $request->paramsPost();
    
            $hash = password_hash($params['pass'], PASSWORD_DEFAULT);
            $params['pass'] = $hash;
        }
    
        $i = 0;
    
        foreach($params as $param) {
            $array[$i][1] = $param;
            $i++;
        }
    
        $sql = 'UPDATE staff_info SET ';
    
        $i = 1;
    
        foreach($array as $param) {
            if($i == count($array)) $sql .= $param[0] . ' = "' . $param[1] . '"';
            else $sql .= $param[0] . '= "' . $param[1] . '", ';
            $i++;
        }
    
        $sql .= ' WHERE staffID = "' . $request->paramsPost()['id'] . '"';
    
        $data = $con->query($sql);
    
        $con->close();
    }

    function deleteStaff($request, $response, $service) {
        include_once 'database/connection.php';
    
        $sql = 'DELETE FROM staff_info WHERE staffID = "'.$request->params()['id'].'"';
        $data = $con->query($sql);
        $con->close();
    }
?>