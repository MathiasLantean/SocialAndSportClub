<?php
require_once ("./controllers/user.php");

$post_user = trim($_POST["user"]);
$post_pwd = trim($_POST["pwd"]);
$post_remember = (int)($_POST["remember"]);
error_log(print_r($post_user, TRUE));
error_log(print_r($post_pwd, TRUE));
error_log(print_r($post_remember, TRUE));

if (!empty($post_user) && !empty($post_pwd)){
    $user = login($post_user, $post_pwd, $post_remember) ;
    error_log(print_r("doLogin user:", TRUE));
    error_log(print_r($user, TRUE));
    if ($user != NULL) {
        header("location:./index.php");
    }else{
        header("location:./login.php");
    }
}else{
    error_log(print_r("DATOS VACIOS", TRUE));
    header("location:./login.php");
}

?>