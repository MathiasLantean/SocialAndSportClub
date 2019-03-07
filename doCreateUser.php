<?php
session_start();

require_once ("./controllers/utils.php");
require_once ("./controllers/user.php");
require_once("./settings/constants.php");

$usr = getLoggedUser();
$pwd = trim($_POST["pwd"]);
$pwd_confirm = trim($_POST["confirmPwd"]);
$name = trim($_POST["name"]);
$surname = trim($_POST["surname"]);
$email = trim($_POST["email"]);
$phone = trim($_POST["phone"]);
$dob = trim($_POST["dob"]);
$address = trim($_POST["address"]);
$isAdmin = (int)($_POST["isAdmin"]);
$photo = "";


error_log(print_r($name, TRUE));
error_log(print_r($surname, TRUE));
error_log(print_r($email, TRUE));
error_log(print_r($phone, TRUE));
error_log(print_r($dob, TRUE));
error_log(print_r($address, TRUE));


if (isset($usr) && $usr["user_type"] == "admin"){
    if($pwd && $pwd_confirm && strlen($pwd) >= PASSWORD_LENGTH){
        if($pwd == $pwd_confirm){
            if(!($name && $surname && $email && $phone && $dob && $address)){
                $_SESSION["message"] = "You must fill all the fields.";
                $_SESSION["status"] = False;
            }else if(getUser($email)){
                $_SESSION["message"] = "Email already in use.";
                $_SESSION["status"] = False;
            }else{
                $type = MEMBER_TYPE;
                if ($isAdmin == 1){
                    $type = ADMIN_TYPE;
                }
                $upperMd5Pwd = strtoupper(md5($pwd));
                $name = ucfirst($name);
                $surname = ucfirst($surname);
                $email = strtolower($email);
                $wasCreated = createUser($name, $surname, $email, $upperMd5Pwd, $phone, $dob, $address, $photo, $type);
                if($wasCreated){
                    $_SESSION["message"] = "The user has been created.";
                    $_SESSION["status"] = True;
                }else{
                    $_SESSION["message"] = "Something went wrong.";
                    $_SESSION["status"] = False;
                }
            }
        }else{
            $_SESSION["message"] = "Passwords don't match.";
            $_SESSION["status"] = False;
        }
    }else{
        $_SESSION["message"] = "Password must contain 8 characters at least.";
        $_SESSION["status"] = False;
    }
    header("location: ./createUser.php");
}else{
    header("location: ./error404.php");
}
        
?>

