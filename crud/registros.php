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



$registros = new DataBase('registros');
$usuarios = new DataBase('usuarios');
switch($_SERVER['REQUEST_METHOD']){
    case "GET":
        if(isset($_GET['user'])){
            $where = array('user'=>$_GET['user']);
            $res = $usuarios->Read($where);
        }else{
            $res = $registros->ReadAll();
        }
        header("HTTP/1.1 200 OK");
        echo json_encode($res);
    break;
    case "POST":
        if(isset($_POST['user']) && isset($_POST['apellidos']) 
        && isset($_POST['correo']) && isset($_POST['nombre'])
        && isset($_POST['fecha_nac']) && isset($_POST['tipo_user']) 
        && isset($_POST['pass'])){
            
            $datos = array(
                'user'=>$_POST['user'],
                'apellidos'=>$_POST['apellidos'],
                'correo'=>$_POST['correo'],
                'nombre'=>$_POST['nombre'],
                'fecha_nac'=>$_POST['fecha_nac'],
            );
            $datos2 = array(
                'user'=>$_POST['user'],
                'tipo_user'=>$_POST['tipo_user'],
                'pass'=>$_POST['pass'],
                'nombre'=>$_POST['nombre']
            );

            try{
                $usuarios -> create($datos2);
                $reg = $registros->create($datos);
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
    /*case "PUT":
        if(isset($_GET['user']) && isset($_GET['pass']) 
        && isset($_GET['tipo']) && isset($_GET['nombre'])){
            
            $where = array('user'=>$_GET['user']);
            $datos = array('user'=>$_GET['user'],
                            'pass'=>$_GET['pass'],
                            'tipo'=>$_GET['tipo'],
                            'nombre'=>$_GET['nombre']
                            );
            $reg = $registros->update($datos,$where);

            $res = array("result"=>"ok","msg"=>"Se guardo el usuario", "num"=>$reg);
        
        }else{
            $res = array("result"=>"no","msg"=>"Faltan datos");
        }
        echo json_encode($res);
    break;
    case "DELETE":
        if(isset($_GET['user'])){
            
            $where = array('user'=>$_GET['user']);
            $reg = $registros->delete($where);
            $res = array("result"=>"ok","msg"=>"Se elimino el usuario", "num"=>$reg);
        
        }else{
            $res = array("result"=>"no","msg"=>"Faltan datos");
        }
        echo json_encode($res);
    break; */
    default:
        header("HTTP/1.1 401 Bad Request");
}