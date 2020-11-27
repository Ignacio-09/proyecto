<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Authorization, Access-Control-Allow-Methods, Access-Control-Allow-Headers, Allow, Access-Control-Allow-Origin");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS, HEAD");
header("Allow: GET, POST, PUT, DELETE, OPTIONS, HEAD");
require_once 'database.php';
require_once 'jwt.php';
if($_SERVER['REQUEST_METHOD']=="OPTIONS"){
    exit();
}

$header = apache_request_headers();
$jwt = trim($header['Authorization']);
switch (JWT::verify($jwt, CONFIG::SECRET_JWT)) {
    case 1:
        header("HTTP/1.1 401 Unauthorized");
        echo "El token no es válido";
        exit();
        break;
    case 2:
        header("HTTP/1.1 408 Request Timeout");
        echo "La sesión caduco";
        exit();
        break;
}
$tabla = new DataBase('carritos');
$data = JWT::get_data($jwt, CONFIG::SECRET_JWT);
switch($_SERVER['REQUEST_METHOD']){
    case "GET":
        if(isset($_GET['id_car'])){
            $where = array('id_car'=>$_GET['id_car']);
            $res = $tabla->Read($where);
        }else if (isset($_GET['user'])){
            $prod = $_GET['user'];
            $sql = "SELECT * FROM carritos where user = '$prod'";
            $res = $tabla->sql_execute($sql);
        }else{
            $res = $tabla->ReadAll();
        }
        
        header("HTTP/1.1 200 OK");
        echo json_encode($res);
    break;  
    case "POST":
        if(isset($_POST['user']) && isset($_POST['precio_car']) &&
            isset($_POST['nombre_prod']) && isset($_POST['piezas_car']) && isset($_POST['id_prod'])){
            $datos = array(
                'nombre_prod'=>$_POST['nombre_prod'],
                'precio_car'=>$_POST['precio_car'],
                'piezas_car'=>$_POST['piezas_car'],
                'id_prod'=>$_POST['id_prod'],
                'user'=>$_POST['user']
            );
            try{
                $reg = $tabla->create($datos);
                $res = array("result"=>"ok","msg"=>"Se ha agregado a carrito", "id"=>$reg);
            }catch(PDOException $e){
                $res = array("result"=>"no","msg"=>$e->getMessage());
            }
        }else{
            $res = array("result"=>"no","msg"=>"Faltan datos");
        }
        header("HTTP/1.1 200 OK");
        echo json_encode($res);
    break;
    case "PUT":
        if(isset($_GET['piezas_car']) && isset($_GET['id_car'])){

                $where = array('id_car'=>$_GET['id_car']);
                $datos = array('piezas_car'=>$_GET['piezas_car']
                                );
                $reg = $tabla->update($datos,$where);
                $res = array("result"=>"ok","msg"=>"Se guardo el Producto", "num"=>$reg);
        }else{
            $res = array("result"=>"no","msg"=>"Faltan datos");
        }
        
        echo json_encode($res);
    break;
    case "DELETE":
        if(isset($_GET['id_prod']) && isset($_GET['user'])){
                $where = array('id_prod'=>$_GET['id_prod'],
                                'user'=>$_GET['user']);
                $reg = $tabla->delete($where);
                $res = array("result"=>"ok","msg"=>"Se elimino el mensaje", "num"=>$reg);
              
        }else{
            $res = array("result"=>"no","msg"=>"Faltan datos");
        }
        echo json_encode($res);
    break;
    default:
        header("HTTP/1.1 401 Bad Request");
}