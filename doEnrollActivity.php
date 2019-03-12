<?php
session_start();

require_once ("./controllers/utils.php");
require_once ("./controllers/user.php");
require_once ("./controllers/activity.php");

$usr = getLoggedUser();
$activityId = (int)$_POST["activityId"];

if (isset($usr) && $usr["user_type"] == MEMBER_TYPE && isset($activityId)){
    if (enrollActivity((int)$usr["id"], $activityId)){
        header("location: ./myAvailableActivities.php");
    }else{
        header("location: ./error404.php");
    }
}else{
    header("location: ./error404.php");
}

?>