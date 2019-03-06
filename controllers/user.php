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

function getUserByToken($token) {
    $sql = "SELECT * FROM user WHERE token = :token";
    $params = array();
    $params[0] = array("token", $token, "string");
    $conn = getConnection();
    
    if ($conn){
        if($conn->consulta($sql, $params)){
            return $conn->siguienteRegistro();
        }
    }
    return null;
}

function setToken($email, $token) {
    $sql = "UPDATE user SET token = :token WHERE email = :email";
    $params = array();
    $params[0] = array("token", $token, "string");
    $params[1] = array("email", $email, "string");
    $conn = getConnection();
    
    if ($conn){
        if($conn->consulta($sql, $params)){
            return TRUE;
        }
    }
    return FALSE;
}

function removeToken($token) {
    $sql = "UPDATE user SET token = null WHERE token = :token";
    $params = array();
    $params[0] = array("token", $token, "string");
    $conn = getConnection();
    
    if ($conn){
        if($conn->consulta($sql, $params)){
            return TRUE;
        }
    }
    return FALSE;
}

function isCorrectPassword($user, $pwd_to_check){
    $dbUser = getUser($user);
    $upperMd5Pwd = strtoupper(md5($pwd_to_check));
    return $dbUser && ($dbUser['password'] == $upperMd5Pwd);
}

function login($user, $pwd, $remember) {
    session_start();
    $dbUser = getUser($user);
    $upperMd5Pwd = strtoupper(md5($pwd));
    error_log(print_r("DB user:", TRUE));
    error_log(print_r( $dbUser, TRUE));
    if ($dbUser && ($dbUser['password'] == $upperMd5Pwd)){
        unset($dbUser['password']);
        if ($remember == 1) {
            $token = uniqid();
            setToken($user, $token);
            setcookie("remembered", $token, time() + (60 * 60 * 12));
        }else{
            setToken($user, null);
        }
        $_SESSION["user"] = $dbUser;
        $_SESSION["message"] = "";
        return $dbUser;
    }
    $_SESSION["message"] = "Wrong username or password.";
    error_log(print_r($_SESSION["message"], TRUE));
    return null;
}

function remembered() {
    if (isset($_COOKIE["remembered"])) {
        $logged = getUserByToken($_COOKIE["remembered"]);
        unset($logged['password']);
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
    session_start();
    if (isset($_COOKIE["remembered"])) {
        removeToken($_COOKIE["remembered"]);
    }
    setcookie('remembered', null, -1);
    session_destroy();
}

function changePassword($user_id, $pwd) {
    $upperMd5Pwd = strtoupper(md5($pwd));
    $sql = "UPDATE user SET password = :password WHERE id = :userid";
    $params = array();
    $params[0] = array("password", $upperMd5Pwd, "string");
    $params[1] = array("userid", $user_id, "string");
    $conn = getConnection();
    
    if ($conn){
        if($conn->consulta($sql, $params)){
            return TRUE;
        }
    }
    return FALSE;
}

?>