<?php

require_once ("./controllers/user.php");
require_once ("./controllers/utils.php");
require_once("./settings/constants.php");

$usr = getLoggedUser();
$name = ucfirst(strtolower(trim($_POST["name"])));
$surname = ucfirst(strtolower(trim($_POST["surname"])));
$email = strtolower(trim($_POST["email"]));
$phone = trim($_POST["phone"]);
$dob = trim($_POST["dob"]);
$address = trim($_POST["address"]);
$photo = isset($_FILES["photo"]) ? $_FILES["photo"] : Null;
$validEmail = True;

if (isset($usr) && $usr["user_type"] == ADMIN_TYPE){
    if(!($name && $surname && $email && $phone && $dob && $address)){
        $_SESSION["message"] = "You must fill all the fields.";
        $_SESSION["status_update"] = False;
    }else{
        $data =array();
        if($usr["name"] != $name){
            $data["name"] = $name; 
        }
        if ($usr["surname"] != $surname){
            $data["surname"] = $surname;
        }
        if($usr["phone"] != $phone){
            $data["phone"] = $phone;
        }
        if($usr["DOB"] != $dob){
            $data["DOB"] = $dob;
        }
        if($usr["address"] != $address){
            $data["address"] = $address;
        }
        if($photo && is_uploaded_file($photo["tmp_name"])){
            $photoName = savePhoto($photo);
            $data["photo"] = $photoName;
        }
        if($usr["email"] != $email){
            if(getUser($email)){
                $_SESSION["message"] = "Email already in use.";
                $_SESSION["status_update"] = False;
                $validEmail = False;
            }else{
                $data["email"] = $email;
            }
        }
        
        if($validEmail){
            if(!empty($data)){
                $wasCreated = updateUser($usr["id"], $data);
                if($wasCreated){
                    $dbUser = getUser($usr["email"]);
                    unset($dbUser['password']);
                    $_SESSION["user"] = $dbUser;
                    $_SESSION["message"] = "The user has been updated.";
                    $_SESSION["status_update"] = True;
                }else{
                    $_SESSION["message"] = "Something went wrong.";
                    $_SESSION["status_update"] = False;
                }
            }else{
                $_SESSION["message"] = "No chenges were found.";
                $_SESSION["status_update"] = True;
            }
        }
    }
        
    header("location: ./editProfile.php");
}else{
    header("location: ./error404.php");
}

?>