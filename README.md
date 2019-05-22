# CPE 231 Project
## Controller Folder
เก็บไฟล์ PHP Function ที่จะใช้งานสำหรับแต่ละ URL

    // HomeController.php (ชื่อไฟล์กับชื่อฟังก์ชันตั้งชื่ออะไรก็ได้)
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

## index.php
กำหนด URL และไฟล์กับฟังก์ชันในโฟลเดอร์ Controller ที่จะใช้กับ URL นั้น

    $klein->respond('/home', route("HomeController@student"));
    $klein->respond('ชื่อ URL', route("ชื่อไฟล์ในโฟลเดอร์ Controller@ชื่อฟังก์ชันในไฟล์นั้น"));

## Public Folder
ใช้เก็บไฟล์ Static ต่าง ๆ (ไฟล์ css , javascript , รูปภาพ ฯ)

## View Folder
ใช้เก็บไฟล์ HTML หรือ PHP สำหรับหน้าเว็บ

การเรียกใช้งานไฟล์ Static ในไฟล์ HTML หรือ PHP ในโฟล์เดอร์ View

    Javascript
    <script src="public/js/login.js"></script>
    <script src="public/โฟล์เดอร์/ชื่อไฟล์"></script>

    CSS
    <link rel="stylesheet" type="text/css" href="/public/css/login.css">
    <link rel="stylesheet" type="text/css" href="/public/โฟล์เดอร์/ชื่อไฟล์">