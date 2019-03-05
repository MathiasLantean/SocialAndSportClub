<?php
session_start();
require_once("./includes/libs/Smarty.class.php");
require_once ("./controllers/utils.php");
require_once ("./controllers/user.php");
require_once ("./controllers/activity.php");

$miSmarty = new Smarty();
$miSmarty->template_dir = 'templates';
$miSmarty->compile_dir = 'templates_c';
$miSmarty->cache_dir = 'cache';
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
