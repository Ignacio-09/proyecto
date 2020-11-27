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

$usuarios = new DataBase('usuarios');
switch($_SERVER['REQUEST_METHOD']){
    case "GET":
        if(isset($_GET['user'])){
            $u = $_GET['user'];
            $sql = "SELECT u.user, u.pass, u.nombre, r.apellidos, r.correo, r.fecha_nac FROM registros r, usuarios u where r.user = u.user and u.user = "."'$u'";
            $res = $usuarios->sql_execute($sql);
        } else if(isset($_GET['buscar'])){
            $user = $_GET['buscar'];
            $sql = "SELECT * FROM usuarios where user like '%$user%' or nombre like '%$user%'";
            $res = $usuarios->sql_execute($sql);
        } else{
            $res = $usuarios->ReadAll();
        }
        header("HTTP/1.1 200 OK");
        echo json_encode($res);
    break;
    case "POST":
        if(isset($_POST['user']) && isset($_POST['pass']) 
        && isset($_POST['tipo_user']) && isset($_POST['nombre'])){
            
            $datos = array(
                'user'=>$_POST['user'],
                'pass'=>$_POST['pass'],
                'tipo_user'=>$_POST['tipo_user'],
                'nombre'=>$_POST['nombre']
            );

            try{
                $reg = $usuarios->create($datos);
                $res = array("result"=>"ok","msg"=>"Se guardo el usuario", "id"=>$reg);
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
        if(isset($_GET['user']) && isset($_GET['pass']) 
        && isset($_GET['apellidos']) && isset($_GET['nombre'])
        && isset($_GET['correo']) && isset($_GET['fecha_nac'])){
            $where = array('user'=>$_GET['user']);
            $registros = new DataBase('registros');
            $datos = array(
                            'pass'=>$_GET['pass'],
                            'nombre'=>$_GET['nombre']
                            );
            $datos2 = array(
                            'apellidos'=>$_GET['apellidos'],
                            'nombre'=>$_GET['nombre'],
                            'correo'=>$_GET['correo'],
                            'fecha_nac'=>$_GET['fecha_nac']
                            );
            $registros -> update($datos2, $where);
            $reg = $usuarios->update($datos,$where);

            $res = array("result"=>"ok","msg"=>"Se guardo el usuario", "num"=>$reg);
        
        }else if(isset($_GET['user']) && isset($_GET['pass']) 
        && isset($_GET['tipo_user']) && isset($_GET['nombre'])){
            
            $where = array('user'=>$_GET['user']);
            $datos = array('user'=>$_GET['user'],
                            'pass'=>$_GET['pass'],
                            'tipo_user'=>$_GET['tipo_user'],
                            'nombre'=>$_GET['nombre']
                            );
            $reg = $usuarios->update($datos,$where);

            $res = array("result"=>"ok","msg"=>"Se guardo el usuario", "num"=>$reg);
        
        }else{
            $res = array("result"=>"no","msg"=>"Faltan datos");
        }
        echo json_encode($res);
    break;
    case "DELETE":
        if(isset($_GET['user'])){
            $registros = new DataBase('registros');
            $where = array('user'=>$_GET['user']);
            $registros->delete($where);
            $reg = $usuarios->delete($where);
            $res = array("result"=>"ok","msg"=>"Se elimino el usuario", "num"=>$reg);
        
        }else if(isset($_GET['correo_seg'])){
            $where = array('correo_seg'=>$_GET['correo_seg']);
            $seguidores = new DataBase('seguidores');
            $reg = $seguidores->delete($where);
            $res = array("result"=>"ok","msg"=>"Se elimino el seguidor", "num"=>$reg);
        }else{
            $res = array("result"=>"no","msg"=>"Faltan datos");
        }
        echo json_encode($res);
    break;
    default:
        header("HTTP/1.1 401 Bad Request");
}