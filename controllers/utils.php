<?php
require_once("./includes/libs/Smarty.class.php");
require_once("./includes/class.Conexion.BD.php");
require_once("./settings/config.php");
require_once("./settings/constants.php");

function getConnection() {
    
    $conn = new ConexionBD(engine, server, database, dbUser, dbPassword);
    
    if ($conn->conectar()){
        return $conn;
    }else{
        return NULL;
    }
}

function createSmartyTemplate() {
    $miSmarty = new Smarty();
    $miSmarty->template_dir = 'templates';
    $miSmarty->compile_dir = 'templates_c';
    $miSmarty->cache_dir = 'cache';
    return $miSmarty;
}

function savePhoto($photo){
    if($photo && is_uploaded_file($photo["tmp_name"])){
        $foto = date("YmdHis") . "_" . $photo["name"];
        if(move_uploaded_file($photo["tmp_name"], UPLOAD_DIR . $foto)){
           return UPLOAD_DIR.$foto; 
        }
    }
    return STATIC_DIR . "default.jpeg";
}

?>
