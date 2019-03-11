<?php
require_once ("./controllers/user.php");

$post_user = trim($_POST["user"]);
$post_pwd = trim($_POST["pwd"]);
$post_remember = (int)($_POST["remember"]);

if (!empty($post_user) && !empty($post_pwd)){
    $user = login($post_user, $post_pwd, $post_remember);
    if ($user != NULL) {
        header("location:./home.php");
    }else{
        header("location:./index.php");
    }
}else{
    header("location:./index.php");
}

?>