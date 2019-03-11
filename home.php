<?php
session_start();

require_once ("./controllers/user.php");
require_once ("./controllers/utils.php");

$usr = getLoggedUser();
$miSmarty = createSmartyTemplate();

if (!empty($usr)){
    $miSmarty->display("home.tpl");
}else{
    header("location: ./error404.php");
}

?>
