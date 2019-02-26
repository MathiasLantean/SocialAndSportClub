<?php
session_start();

require_once ("./controllers/utils.php");

$miSmarty = createSmartyTemplate();
$miSmarty->assign("message",$_SESSION["message"]);
$miSmarty->display('./templates/login.tpl');

?>