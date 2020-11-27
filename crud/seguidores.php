<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Authorization, Access-Control-Allow-Methods, Access-Control-Allow-Headers, Allow, Access-Control-Allow-Origin");
header("Access-Control-Allow-Methods: GET, POST");
header("Allow: GET, POST");
require_once 'database.php';
require_once 'jwt.php';


$seguidores = new DataBase('seguidores');
switch($_SERVER['REQUEST_METHOD']){
    case "GET":
        if(isset($_GET['correo'])){
            $where = array('correo'=>$_GET['correo']);
            $res = $usuarios->Read($where);
        } else if(isset($_GET['buscar'])){
            $prod = $_GET['buscar'];
            $sql = "SELECT * FROM seguidores where correo_seg like '%$prod%'";
            $res = $seguidores->sql_execute($sql);
        } else{
            $res = $seguidores->ReadAll();
        }
        header("HTTP/1.1 200 OK");
        echo json_encode($res);
    break;
    case "POST":
        if(isset($_POST['correo_seg'])){
            $datos = array(
                'correo_seg'=>$_POST['correo_seg']
            );
            try{
                $reg = $seguidores->create($datos);
                $res = array("result"=>"ok","msg"=>"Se guardo el registro", "id"=>$reg);
            }catch(PDOException $e){
                $res = array("result"=>"no","msg"=>$e->getMessage());
            }
        }else{
            $res = array("result"=>"no","msg"=>"Faltan datos");
        }
        header("HTTP/1.1 200 OK");
        echo json_encode($res);
    break;
    default:
        header("HTTP/1.1 401 Bad Request");
}