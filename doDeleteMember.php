<?php

require_once ("./controllers/user.php");
require_once ("./controllers/utils.php");
require_once("./settings/constants.php");

$usr = getLoggedUser();
$id = isset($_GET["id"]) ? (int)$_GET["id"] : Null;

if (isset($usr) && $usr["user_type"] == ADMIN_TYPE && !empty($id)){
    deleteUserById($id);
}else{
    header("location: ./error404.php");
}

?>
