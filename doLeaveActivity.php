<?php
session_start();

require_once ("./controllers/utils.php");
require_once ("./controllers/user.php");
require_once ("./controllers/activity.php");

$usr = getLoggedUser();
$activityId = (int)$_POST["activityId"];

error_log(print_r($activityId, TRUE));

if (isset($usr) && isset($activityId)){
    if (leaveActivity((int)$usr["id"], $activityId)){
        header("location: ./myActivity.php");
    }else{
        header("location: ./error404.php");
    }
}else{
    header("location: ./error404.php");
}

?>
