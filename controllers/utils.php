<?php
require_once("./includes/libs/Smarty.class.php");
require_once("./includes/class.Conexion.BD.php");
require_once("./settings/config.php");

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

?>
