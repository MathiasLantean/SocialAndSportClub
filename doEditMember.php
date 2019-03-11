<?php

require_once ("./controllers/user.php");
require_once ("./controllers/utils.php");
require_once("./settings/constants.php");

$usr = getLoggedUser();
$id = isset($_POST["id"]) ? (int)$_POST["id"] : Null;
$name = ucfirst(strtolower(trim($_POST["name"])));
$surname = ucfirst(strtolower(trim($_POST["surname"])));
$email = strtolower(trim($_POST["email"]));
$phone = trim($_POST["phone"]);
$dob = trim($_POST["dob"]);
$address = trim($_POST["address"]);
$photo = isset($_FILES["photo"]) ? $_FILES["photo"] : Null;
$validEmail = True;

if (!empty($usr) && $usr["user_type"] == ADMIN_TYPE){
    $dbUser = getUserById($id);
    if (!empty($dbUser) && $dbUser["user_type"] != ADMIN_TYPE){
        if(!($name && $surname && $email && $phone && $dob && $address)){
            $_SESSION["message"] = "You must fill all the fields.";
            $_SESSION["status"] = False;
        }else{
            $data =array();
            if($dbUser["name"] != $name){
                $data["name"] = $name; 
            }
            if ($dbUser["surname"] != $surname){
                $data["surname"] = $surname;
            }
            if($dbUser["phone"] != $phone){
                $data["phone"] = $phone;
            }
            if($dbUser["DOB"] != $dob){
                $data["DOB"] = $dob;
            }
            if($dbUser["address"] != $address){
                $data["address"] = $address;
            }
            if($photo && is_uploaded_file($photo["tmp_name"])){
                $oldPhotoName = $dbUser["photo"];
                $photoName = savePhoto($photo);
                $data["photo"] = $photoName;
                if ($oldPhotoName != STATIC_DIR . "default.jpeg"){
                    unlink($oldPhotoName);
                }
            }
            if($dbUser["email"] != $email){
                if(getUser($email)){
                    $_SESSION["message"] = "Email already in use.";
                    $_SESSION["status"] = False;
                    $validEmail = False;
                }else{
                    $data["email"] = $email;
                }
            }

            if($validEmail){
                if(!empty($data)){
                    $wasUpdated = updateUser($dbUser["id"], $data);
                    if($wasUpdated){
                        $_SESSION["message"] = "The user has been updated.";
                        $_SESSION["status"] = True;
                    }else{
                        $_SESSION["message"] = "Something went wrong.";
                        $_SESSION["status"] = False;
                    }
                }else{
                    $_SESSION["message"] = "No chenges were found.";
                    $_SESSION["status"] = True;
                }
            }
        }
        header("location: ./editMember.php?id=" . $id);
    }else{
        header("location: ./error404.php");
    }
}else{
    header("location: ./error404.php");
}

?>
