<?php
require_once("utils.php");
require_once("./settings/constants.php");

function createUser($name, $surname, $email, $pwd, $phone, $dob, $address, $photo, $type){
    $sql = "INSERT INTO user (name, surname, DOB, phone, address, email, photo, password, user_type)";
    $sql .= " VALUES (:nom, :sur, :dob, :pho, :add, :email, :photo, :pwd, :type)";
    $params = array();
    $params[0] = array("nom", $name, "string");
    $params[1] = array("sur", $surname, "string");
    $params[2] = array("dob", $dob, "string");
    $params[3] = array("pho", $phone, "string");
    $params[4] = array("add", $address, "string");
    $params[5] = array("email", $email, "string");
    $params[6] = array("photo", $photo, "string");
    $params[7] = array("pwd", $pwd, "string");
    $params[8] = array("type", $type, "string");
    
    $conn = getConnection();
    
    if ($conn){
        if($conn->consulta($sql, $params)){
            return True;
        }
    }
    return False;
}

function updateUser($userId, $data){
        if(!empty($data)){
            $list = array();
            $params = array();
            $i = 0;
            foreach($data as $k => $v){
                $list[] = $k ." = :". $k;
                $params[$i] = array($k, $v, "string");
                $i++;
            }
            $params[$i] = array('id', $userId, "int");

            $list = implode(",", $list);
            $sql = "UPDATE user SET " . $list . " WHERE id = :id";
            $conn = getConnection();
            if ($conn){
                if($conn->consulta($sql, $params)){
                    return True;
                }
            }
            return False;
        }
        return True;
}

function getMemberCount($activity){
    $params = array();
    if(empty($activity)){
        $sql = "SELECT count(*) total FROM user WHERE user_type <> '". ADMIN_TYPE . "'";
    }else{
        $sql = "SELECT count(*) total FROM user u, enroll e WHERE u.id = e.user";
        $sql .= " AND e.activity = :filter AND u.user_type <> '". ADMIN_TYPE . "'";
        $params[0] = array("filter", $activity,"int");
    }
    
    $ret = 0;
    $conn = getConnection();
    if($conn && $conn->consulta($sql, $params)){
        $result = $conn->siguienteRegistro();
        $ret = $result["total"];
    }
    return $ret;
}

function getMemberList($activity, $start){
    $params = array();
    if(empty($activity)){
        $sql = "SELECT * FROM user WHERE user_type <> '". ADMIN_TYPE . "'";
    }else{
        $sql = "SELECT * FROM user u, enroll e WHERE u.id = e.user";
        $sql .= " AND e.activity = :filter AND u.user_type <> '". ADMIN_TYPE . "'";
        $params[0] = array("filter", $activity,"int");
    }
     $sql .= " LIMIT " . $start . "," . PAGINATION;
    
    $ret = Array();
    $conn = getConnection();
    if($conn && $conn->consulta($sql, $params)){
        $ret = $conn->restantesRegistros();
        foreach ($ret as &$elem) {
           unset($elem['password']);
           unset($elem['token']);
        }
    }
    return $ret; 
}

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

function getUserById($id) {
    $sql = "SELECT * FROM user WHERE id = :id";
    $params = array();
    $params[0] = array("id", $id, "int");
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
    session_start();
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

function deleteUserById($id) {
    $sql = "DELETE FROM user WHERE id = :id AND user_type <> '" . ADMIN_TYPE . "'";
    $params = array();
    $params[0] = array("id", $id, "int");
    $conn = getConnection();
    
    if ($conn){
        if($conn->consulta($sql, $params)){
            return True;
        }
    }
    return False;
}


function changePasswordForAdmins($pwd) {
    $upperMd5Pwd = strtoupper(md5($pwd));
    $sql = "UPDATE user SET password = :password WHERE user_type='admin'";
    $params = array();
    $params[0] = array("password", $upperMd5Pwd, "string");
    $conn = getConnection();
    
    if ($conn){
        if($conn->consulta($sql, $params)){
            return TRUE;
        }
    }
    return FALSE;
}

?>
