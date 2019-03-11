<?php

require_once("utils.php");

function getAllActivities(){
    $sql = "SELECT * FROM activity";
    $conn = getConnection();
    
    if ($conn){
        if($conn->consulta($sql, $params)){
            return $conn->restantesRegistros();
        }
    }
    return Null;
}

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
    return Null;
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
    return Null;
}

function leaveActivity($user_id, $activity_id){
    $sql = "DELETE FROM enroll WHERE user = :user AND activity = :activity";
    $params = array();
    $params[0] = array("user", $user_id, "int");
    $params[1] = array("activity", $activity_id, "int");
    $conn = getConnection();
    
    if ($conn){
        if($conn->consulta($sql, $params)){
            return True;
        }
    }
    return False;
}

function enrollActivity($user_id, $activity_id){
    $sql = "INSERT INTO enroll (user, activity) VALUES (:user, :activity)";
    $params = array();
    $params[0] = array("user", $user_id, "int");
    $params[1] = array("activity", $activity_id, "int");
    $conn = getConnection();
    
    if ($conn){
        if($conn->consulta($sql, $params)){
            return True;
        }
    }
    return False;
}

?>
