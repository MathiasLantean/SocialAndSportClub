<?php
session_start();

require_once ("./controllers/utils.php");
require_once ("./controllers/user.php");

$usr = getLoggedUser();
$pwd = trim($_POST["pwd"]);
$pwd_confirm = trim($_POST["confirmPwd"]);

if (isset($usr) && $pwd && $pwd_confirm){
    if($pwd == $pwd_confirm){
        if(changePassword($usr["id"], $pwd)){
            $_SESSION["message"] = "Password was changed.";
        }else{
            $_SESSION["message"] = "Something went wrong.";
        }
    }else{
        $_SESSION["message"] = "Passwords don't match.";
    }
}else{
    $_SESSION["message"] = "Password must contain 8 characters at least.";
}
error_log(print_r($_SESSION["message"], TRUE));
header("location: ./editProfile.php");

?>
