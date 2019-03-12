<?php
session_start();
require_once ("./controllers/utils.php");
require_once ("./controllers/user.php");
require_once ("./controllers/activity.php");

$miSmarty = createSmartyTemplate();
$usr = getLoggedUser();
if (!empty($usr) && $usr["user_type"] == MEMBER_TYPE){
    $myActivities = getAvailableActivities($usr["id"]);
    $miSmarty->assign("activities", $myActivities);
    $miSmarty->display("enroll_activities.tpl");
}else{
    header("location: ./error404.php");
}

?>
