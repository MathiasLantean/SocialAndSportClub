<?php
require_once("utils.php");

function getUser($email) {
    $sql = "SELECT * FROM user WHERE email = :email";
    $params = array();
    $params[0] = array("email", $email, "string");
    $conn = getConnection();
    
    if ($conn){
        if($conn->consulta($sql, $params)){
            return $conn->siguienteRegistro();
        }
    }
    return null;
}

function login($user, $pwd, $remember) {
    session_start();
    $dbUser = getUser($user);
    error_log(print_r("DB user:", TRUE));
    error_log(print_r( $dbUser, TRUE));
    // TODO: PWD MUST BE IN MD5 FORMAT
    if ($dbUser && ($dbUser['password'] == $pwd)){
        unset($dbUser['password']);
        $_SESSION["user"] = $dbUser;
        $_SESSION["message"] = "";
        // TODO: ADD GUID TO THE USER
        if ($remember == 1) {
            setcookie("remembered", "TEST", time() + (60 * 60 * 12));
            error_log(print_r("user remembered", TRUE));
        }
        return $dbUser;
    }
    $_SESSION["message"] = "Wrong username or password.";
    error_log(print_r($_SESSION["message"], TRUE));
    return null;
}

function remembered() {
    // TODO: USE THE GUID IN THE DATABASE TO IDENTIFY THE USER
    if (isset($_COOKIE["remembered"]) &&
            $_COOKIE["remembered"] == "asdlkjasdlkjasdñlkasjñdlk") {

        $logueado = array("id" => 1,
            "nombre" => "Juan Perez",
            "guid" => "asdlkjasdlkjasdñlkasjñdlk");


        $_SESSION["user"] = $logged;

        return $logged;
    }

    return null;
}

function getLoggedUser() {
    if (isset($_SESSION["user"])) {
        return $_SESSION["user"];
    }

    return remembered();
}


function logout() {
    setcookie('remembered', null, -1);
    session_destroy();
}

?>