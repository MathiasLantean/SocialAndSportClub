<?php
session_start();

require_once ("./controllers/user.php");
require_once ("./controllers/utils.php");

$miSmarty = createSmartyTemplate();
if (getLoggedUser()){
    $miSmarty->display("./templates/home.tpl");
}else{
    $miSmarty->assign("message",$_SESSION["message"]);
    $miSmarty->display('./templates/login.tpl');
}

?>
