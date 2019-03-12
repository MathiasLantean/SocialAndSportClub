<?php

require_once ("./controllers/user.php");
require_once ("./controllers/utils.php");
require_once("./settings/constants.php");

$usr = getLoggedUser();
$activity = isset($_GET["activity"]) ? (int)$_GET["activity"] : Null;
$start = isset($_GET["start"]) ? (int)$_GET["start"] : 0;
$start = $start < 0 ? 0 : $start;
$draw = isset($_GET["draw"]) ? (int)$_GET["draw"] : 0;

if (!empty($usr) && $usr["user_type"] == ADMIN_TYPE){
    $memberCount = getMemberCount($activity);
    $result = getMemberList($activity, $start);

    $ret = Array();
    $ret["data"] = $result;
    $ret["draw"] = $draw;
    $ret["recordsTotal"] = $memberCount;
    $ret["recordsFiltered"] = $memberCount;
    
   echo json_encode($ret);

}else{
   header("location: ./error404.php"); 
}

?>
