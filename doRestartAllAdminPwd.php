<?php

require_once ("./controllers/user.php");
require_once ("./controllers/utils.php");
require_once("./settings/constants.php");

$usr = getLoggedUser();
$miSmarty = createSmartyTemplate();

if (!empty($usr) && $usr["user_type"] == ADMIN_TYPE){
    error_log(print_r("Entro1"), TRUE);
    if(changePasswordForAdmins(DEFAULT_RESET_PWD_ADMIN)){
        error_log(print_r("Entro2"), TRUE);
        $miSmarty->assign("activities", $myActivities);
        $miSmarty->display("reset_admin_passwords.tpl");
    }else{
        error_log(print_r("Entro3"), TRUE);
        header("location: ./error404.php");
    }
}else{
   error_log(print_r("EntroASDFASDF"), TRUE);
   header("location: ./error404.php"); 
}

?>
