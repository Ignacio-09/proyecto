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
$tabla = new DataBase('productos');
$data = JWT::get_data($jwt, CONFIG::SECRET_JWT);
switch($_SERVER['REQUEST_METHOD']){
    case "GET":
        if(isset($_GET['id_prod'])){
            $where = array('id_prod'=>$_GET['id_prod']);
            $res = $tabla->Read($where);
        }else if (isset($_GET['nombre_prod'])){
            $prod = $_GET['nombre_prod'];
            $sql = "SELECT * FROM productos where nombre_prod like '%$prod%'";
            $res = $tabla->sql_execute($sql);
        }else{
            $res = $tabla->ReadAll();
        }
        
        header("HTTP/1.1 200 OK");
        echo json_encode($res);
    break;
    case "POST":
        if(isset($_POST['nombre_prod']) && isset($_POST['precio_prod']) &&
            isset($_POST['desc_prod']) && isset($_POST['tipo_prod']) &&
            isset($_POST['valor_prod']) && isset($_POST['estado_prod']) &&
            isset($_POST['url_prod'])){
            $datos = array(
                'nombre_prod'=>$_POST['nombre_prod'],
                'precio_prod'=>$_POST['precio_prod'],
                'desc_prod'=>$_POST['desc_prod'],
                'url_prod'=>$_POST['url_prod'],
                'tipo_prod'=>$_POST['tipo_prod'],
                'valor_prod'=>$_POST['valor_prod'],
                'estado_prod'=>$_POST['estado_prod']
            );
            try{
                $reg = $tabla->create($datos);
                $res = array("result"=>"ok","msg"=>"Se guardo el producto", "id"=>$reg);
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
        if(isset($_GET['nombre_prod']) && isset($_GET['precio_prod']) &&
            isset($_GET['desc_prod']) && isset($_GET['tipo_prod']) &&
            isset($_GET['valor_prod']) && isset($_GET['estado_prod']) &&
            isset($_GET['url_prod']) && isset($_GET['id_prod'])){
            if($data['level']=='A'){
                $where = array('id_prod'=>$_GET['id_prod']);
                $datos = array('nombre_prod'=>$_GET['nombre_prod'],
                                'precio_prod'=>$_GET['precio_prod'],    
                                'desc_prod'=>$_GET['desc_prod'],
                                'tipo_prod'=>$_GET['tipo_prod'],
                                'valor_prod'=>$_GET['valor_prod'],
                                'estado_prod'=>$_GET['estado_prod'],
                                'url_prod'=>$_GET['url_prod']
                                );
                $reg = $tabla->update($datos,$where);
                $res = array("result"=>"ok","msg"=>"Se guardo el Producto", "num"=>$reg);
            } else {
                $res = array("result"=>"no","msg"=>"Faltan datos");
            }
        }else{
            $res = array("result"=>"no","msg"=>"Faltan datos");
        }
        
        echo json_encode($res);
    break;
    case "DELETE":
        if(isset($_GET['id_prod'])){
            if($data['level']=='A'){
                $where = array('id_prod'=>$_GET['id_prod']);
                $reg = $tabla->delete($where);
                $res = array("result"=>"ok","msg"=>"Se elimino el mensaje", "num"=>$reg);
            }else{
                $res = array("result"=>"no","msg"=>"Faltan datos");
            }
           
        }else{
            $res = array("result"=>"no","msg"=>"Faltan datos");
        }
        echo json_encode($res);
    break;
    default:
        header("HTTP/1.1 401 Bad Request");
}