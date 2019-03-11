<?php
session_start();

require_once ("./controllers/utils.php");
require_once ("./controllers/user.php");

$miSmarty = createSmartyTemplate();
$usr = getLoggedUser();
if (!empty($usr)){
    if ($usr["user_type"] == ADMIN_TYPE){
       $miSmarty->display("edit_profile_admin.tpl"); 
    }else{
        $miSmarty->display("edit_profile_member.tpl");
    }
}else{
    header("location: ./error404.php");
}
unset($_SESSION["status"]);
unset($_SESSION["status_update"]);
unset($_SESSION["message"]);

?>
