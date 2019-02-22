<?php
session_start();

require_once("includes/libs/Smarty.class.php");

$miSmarty = new Smarty();

$miSmarty->template_dir = "templates";
$miSmarty->compile_dir = "templates_c";


$miSmarty->display("index.tpl");

?>
