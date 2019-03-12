<?php
session_start();

require_once("includes/libs/Smarty.class.php");
require_once ("./controllers/utils.php");
require_once ("./controllers/user.php");

$miSmarty = createSmartyTemplate();
$usr = getLoggedUser();

if (!empty($usr) && $usr["user_type"] == ADMIN_TYPE){
    $miSmarty->display("create_user.tpl");
}else{
    header("location: ./error404.php");
}
unset($_SESSION["status"]);
unset($_SESSION["message"]);

?>
