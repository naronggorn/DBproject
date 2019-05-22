<?php
    function layout($request, $response, $service) {
        if(strcasecmp($_SERVER['REQUEST_URI'],"/login") != 0) {
            $service->layout('views/layouts/shell.php');
        }
    }

    function staticFile($request, $response, $service) {
        $file = file_get_contents(rtrim(dirname(__DIR__), '/\\') . DIRECTORY_SEPARATOR . "public\\" . $request->param('folder') . DIRECTORY_SEPARATOR . $request->param('filename') . "." . $request->param('ext'));
        $file = preg_replace('/\s+/', ' ', trim($file));

        if(strcasecmp($request->param('ext'),"woff2") != 0) $head = "content-type: text/" . $request->param('ext');
        else $head = "content-type: application/font-" . $request->param('ext');
        header($head);
        
        return $file;
    }

    function staticPicture($request, $response, $service) {
        $filename = rtrim(dirname(__DIR__), '/\\') . DIRECTORY_SEPARATOR . "public\img" . DIRECTORY_SEPARATOR . $request->param('filename') . "." . $request->param('ext');
        $handle = fopen($filename, "rb");
        $contents = fread($handle, filesize($filename));
        fclose($handle);

        $head = "content-type: image/" . $request->param('ext');
            
        header($head);
            
        return $contents;
    }
?>