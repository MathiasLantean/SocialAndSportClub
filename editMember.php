<?php
session_start();
require_once ("./controllers/utils.php");
require_once ("./controllers/user.php");
require_once ("./controllers/activity.php");

$miSmarty = createSmartyTemplate();
$usr = getLoggedUser();
$id = (int)$_GET["id"];

if (isset($usr) && $usr["user_type"] == ADMIN_TYPE){
    $userToEdit = getUserById($id);
    if (!empty($userToEdit) && $userToEdit["user_type"] != ADMIN_TYPE){
        $miSmarty->assign("user", $userToEdit);
        $miSmarty->display("edit_member.tpl");
    }else{
        $miSmarty->display("error404.tpl");
    }
}else{
    $miSmarty->display("error404.tpl");
}
unset($_SESSION["status"]);
unset($_SESSION["message"]);

?>