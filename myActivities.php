<?php
session_start();
require_once ("./controllers/utils.php");
require_once ("./controllers/user.php");
require_once ("./controllers/activity.php");

$miSmarty = createSmartyTemplate();
$usr = getLoggedUser();
if (isset($usr)){
    $myActivities = getCurrentActivities($usr["id"]);
    $miSmarty->assign("activities", $myActivities);
    error_log(print_r( $myActivities, TRUE));
    $miSmarty->display("current_activities.tpl");
}else{
    $miSmarty->display("error404.tpl");
}

?>
