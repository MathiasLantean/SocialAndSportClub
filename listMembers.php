<?php
session_start();
require_once ("./controllers/utils.php");
require_once ("./controllers/user.php");
require_once ("./controllers/activity.php");

$miSmarty = createSmartyTemplate();
$usr = getLoggedUser();

if (isset($usr) && $usr["user_type"] == ADMIN_TYPE){
    $activities = getAllActivities();
    $miSmarty->assign("activities", $activities);
    $miSmarty->display("members_list.tpl");
}else{
    $miSmarty->display("error404.tpl");
}

?>
