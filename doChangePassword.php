<?php
session_start();

require_once ("./controllers/utils.php");
require_once ("./controllers/user.php");

$usr = getLoggedUser();
$pwd = trim($_POST["pwd"]);
$pwd_confirm = trim($_POST["confirmPwd"]);
$pwd_current = trim($_POST["currentPwd"]);

if (!empty($usr)){
    if(!isCorrectPassword($usr["email"], $pwd_current)){
        $_SESSION["message"] = "Wrong password, try again.";
        $_SESSION["status"] = False;
    }
    elseif($pwd && $pwd_confirm && strlen($pwd) >= 8){
        if($pwd == $pwd_confirm){
            if(changePassword($usr["id"], $pwd)){
                $_SESSION["message"] = "Password was changed.";
                $_SESSION["status"] = True;
            }else{
                $_SESSION["message"] = "Something went wrong.";
                $_SESSION["status"] = False;
            }
        }else{
            $_SESSION["message"] = "Passwords don't match.";
            $_SESSION["status"] = False;
        }
    }else{
        $_SESSION["message"] = "Password must contain 8 characters at least.";
        $_SESSION["status"] = False;
    }
    header("location: ./editProfile.php");
}else{
    header("location: ./error404.php");
}
        
?>
