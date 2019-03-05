<?php

require_once("utils.php");

function getCurrentActivities($user_id){
    $sql = "SELECT * FROM activity a, enroll e WHERE e.user = :user AND e.activity = a.id";
    $params = array();
    $params[0] = array("user", $user_id, "string");
    $conn = getConnection();
    
    if ($conn){
        if($conn->consulta($sql, $params)){
            return $conn->restantesRegistros();
        }
    }
    return null;
}

function getAvailableActivities($user_id){
    $sql = "SELECT * FROM activity a WHERE a.id NOT IN(SELECT aa.id FROM activity aa, enroll e WHERE e.user = :user AND e.activity = aa.id)";
    $params = array();
    $params[0] = array("user", $user_id, "string");
    $conn = getConnection();
    
    if ($conn){
        if($conn->consulta($sql, $params)){
            return $conn->restantesRegistros();
        }
    }
    return null;
}

?>
