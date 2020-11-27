<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Authorization, Access-Control-Allow-Methods, Access-Control-Allow-Headers, Allow, Access-Control-Allow-Origin");
header("Access-Control-Allow-Methods: GET");
header("Allow: GET");
require_once 'database.php';
require_once 'jwt.php';

if($_SERVER['REQUEST_METHOD']=='GET'){
    $tabla = new DataBase('productos');

    if(isset($_GET['id_prod'])){
        $where = array('id_prod'=>$_GET['id_prod']);
        $res = $tabla->Read($where);
    }else if (isset($_GET['nombre_prod'])){
        $prod = $_GET['nombre_prod'];
        $sql = "SELECT * FROM productos where nombre_prod like '%$prod%' or tipo_prod like '%$prod%' or valor_prod like '%$prod%'";
        $res = $tabla->sql_execute($sql);
    }else{
        $res = $tabla->ReadAll();
    }
    header("HTTP/1.1 200 OK");
    echo json_encode($res);
}else{
    header("HTTP/1.1 401 Bad Request");
}