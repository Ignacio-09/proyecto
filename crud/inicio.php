<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Authorization, Access-Control-Allow-Methods, Access-Control-Allow-Headers, Allow, Access-Control-Allow-Origin");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS, HEAD");
header("Allow: GET, POST, PUT, DELETE, OPTIONS, HEAD");
require_once 'database.php';
require_once 'jwt.php';

if($_SERVER['REQUEST_METHOD']=='GET'){
    $tabla = new DataBase('productos');

    if(isset($_GET['id_prod'])){
        $where = array('id_prod'=>$_GET['id_prod']);
        $res = $tabla->Read($where);
    }else{
        $res = $tabla->ReadAll();
    }
    header("HTTP/1.1 200 OK");
    echo json_encode($res);
}else{
    header("HTTP/1.1 401 Bad Request");
}