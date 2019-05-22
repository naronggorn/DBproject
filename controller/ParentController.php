<?php
    function showParent($request, $response, $service) {
        $service->pageTitle = 'Parent List';
        $service->script = '<script src="public/js/parent.js"></script>';
        
        $service->render('views/parent.html');
    }

    function addParent($request, $response) {
        include 'database/connection.php';
    
        $array = $request->paramsPost();
    
        $hash = password_hash($array['password'], PASSWORD_DEFAULT);
        $array['password'] = $hash;
    
        $sql = "INSERT INTO parent_info VALUES(";
    
        $i = 1;
    
        foreach($array as $param) {
            if($i == count($array)) $sql .= '"'. $param . '")';
            else $sql .= '"'. $param . '",';
            $i++;
        }
    
        if ($con->query($sql) === TRUE) {
            return $response->redirect("/add-parent", $code = 200)->send();
        } else {
            echo "Error: " . $sql . "<br>" . $con->error;
        }
    }

    function getOneParent($request, $response, $service) {
        include_once 'database/connection.php';
    
        $sql = 'SELECT * FROM parent_info WHERE parentID = "'.$request->params()['id'].'"';
        $data = $con->query($sql);
    
        $con->close();
    
        return json_encode($data->fetch_assoc(), JSON_UNESCAPED_UNICODE);
    }

    function getAllParent($request, $response, $service) {
        include_once 'database/connection.php';
    
        $sql = 'SELECT * FROM parent_info';
        $data = $con->query($sql);
    
        $con->close();
    
        return json_encode($data->fetch_all(), JSON_UNESCAPED_UNICODE);
    }

    function editParent($request, $response, $service) {
        include 'database/connection.php';
    
        $sql = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'parent_info'";
        $data = $con->query($sql);
    
        if($request->paramsPost()['p_pass'] == "") {
            $array = $data->fetch_all();
            array_splice($array, count($data->fetch_all()) - 1);
    
            $params = $request->params();
            array_splice($params, count($request->paramsPost()) - 1);
        } else {
            $array = $data->fetch_all();
            $params = $request->paramsPost();
    
            $hash = password_hash($params['p_pass'], PASSWORD_DEFAULT);
            $params['p_pass'] = $hash;
        }
    
        $i = 0;
    
        foreach($params as $param) {
            $array[$i][1] = $param;
            $i++;
        }
    
        $sql = 'UPDATE parent_info SET ';
    
        $i = 1;
    
        foreach($array as $param) {
            if($i == count($array)) $sql .= $param[0] . ' = "' . $param[1] . '"';
            else $sql .= $param[0] . '= "' . $param[1] . '", ';
            $i++;
        }
    
        $sql .= ' WHERE parentID = "' . $request->paramsPost()['id'] . '"';
    
        $data = $con->query($sql);
    
        $con->close();
    }

    function deleteParent($request, $response, $service) {
        include_once 'database/connection.php';
    
        $sql = 'DELETE FROM parent_info WHERE parentID = "'.$request->params()['id'].'"';
        $data = $con->query($sql);
        $con->close();
    }
?>