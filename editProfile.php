<?php
session_start();

require_once("includes/libs/Smarty.class.php");
require_once ("./controllers/utils.php");
require_once ("./controllers/user.php");

$miSmarty = createSmartyTemplate();
$usr = getLoggedUser();
if (isset($usr) && $usr["user_type"] == "admin"){
    $miSmarty->display("edit_profile_admin.tpl");
}else{
    $miSmarty->display("edit_profile_member.tpl");
}
unset($_SESSION["status"]);
unset($_SESSION["status_update"]);
unset($_SESSION["message"]);
?>
