<?php
    function route($controller) {
        $command = explode ("@", $controller);

        if(file_exists(__DIR__ . "\controller\\" . $command[0] . ".php"))
        {
            include_once(__DIR__ . "\controller\\" . $command[0] . ".php");
        } else {
            return 'File Not Found';
        }

        if(function_exists($command[1])) {
            return $command[1];
        } else {
            return 'Function Not Found';
        }
    }
?>