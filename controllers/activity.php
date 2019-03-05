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

function leaveActivity($user_id, $activity_id){
    $sql = "DELETE FROM enroll WHERE user = :user AND activity = :activity";
    $params = array();
    $params[0] = array("user", $user_id, "int");
    $params[1] = array("activity", $activity_id, "int");
    $conn = getConnection();
    
    error_log(print_r( $sql, TRUE));
    error_log(print_r( $params[0], TRUE));
    error_log(print_r( $params[1], TRUE));
    if ($conn){
        if($conn->consulta($sql, $params)){
            return True;
        }
    }
    return False;
}

?>