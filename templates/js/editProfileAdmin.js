$(document).ready(function(){
    $("#formEditUser").submit(function(){
        var pwdToCheck = $.trim($("#InputPassword").val());
        var confirmPwdToCheck = $.trim($("#InputRepeatPassword").val());
        var pwdCheck = checkPassword(pwdToCheck, confirmPwdToCheck);
        if (!pwdCheck.valid){
            $(".msg-server").remove();
            $("#error-card").show();
            $("#error-text").text(pwdCheck.message);
            return false;
        }
        return true;
    });
    
    $("#formUpdateUser").submit(function(){
        $(".msg-server").remove();
        if (!validateForm('formUpdateUser')){
            $(".msg-server").remove();
            $("#error-text-update").text('You must fill all the fields.');
            $("#error-card-update").show();
            return false;
        }else{
            var inputPhoto = $("#InputPhoto")[0].files[0];
            if (typeof inputPhoto !== "undefined"){
                if(inputPhoto.size > 1048576){
                    // the file size is greater than 1MB
                    $(".msg-server").remove();
                    var msg = "The file size must be less than 1MB. The size of this file is ";
                    msg += returnFileSize(inputPhoto.size);
                    $("#error-text-update").text(msg);
                    $("#error-card-update").show();
                    return false;
                }
            }
        }    
        return true;
    });
    
});

