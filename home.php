<?php
session_start();

require_once ("./controllers/utils.php");

$miSmarty = createSmartyTemplate();
$miSmarty->display("home.tpl");

?>
