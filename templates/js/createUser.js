$(document).ready(function(){
    $("#InputRepeatPassword, #InputPassword").focus(function() {
        $("#error-card").hide();
    });    
        
    $("#InputRepeatPassword").blur(function() {
        var pwdToCheck = $.trim($("#InputPassword").val());
        var confirmPwdToCheck = $.trim($("#InputRepeatPassword").val());
        var pwdCheck = checkPassword(pwdToCheck, confirmPwdToCheck);
        if (!pwdCheck.valid){
            $(".msg-server").remove();
            $("#error-card").show();
            $("#error-text").text(pwdCheck.message);
        }
    });
    
    $("#InputPassword").blur(function() {
        var confirmPwdToCheck = $.trim($("#InputRepeatPassword").val());
        if (confirmPwdToCheck){
            var pwdToCheck = $.trim($("#InputPassword").val());
            var pwdCheck = checkPassword(pwdToCheck, confirmPwdToCheck);
            if (!pwdCheck.valid){
                $(".msg-server").remove();
                $("#error-card").show();
                $("#error-text").text(pwdCheck.message);
            }
        }
    });
    
    $("#formCreateUser").submit(function(){
        var pwdToCheck = $.trim($("#InputPassword").val());
        var confirmPwdToCheck = $.trim($("#InputRepeatPassword").val());
        var pwdCheck = checkPassword(pwdToCheck, confirmPwdToCheck);
        $(".msg-server").remove();
        if (!pwdCheck.valid){
            $("#error-text").text(pwdCheck.message);
            $("#error-card").show();
            return false;
        }else if (!validateForm('formCreateUser')){
            $("#error-text").text('You must fill all the fields.');
            $("#error-card").show();
            return false;
        }else{
            var inputPhoto = $("#InputPhoto")[0].files[0];
            if (typeof inputPhoto !== "undefined"){
                if(inputPhoto.size > 1048576){
                    // the file size is greater than 1MB
                    $(".msg-server").remove();
                    var msg = "The file size must be less than 1MB. The size of this file is ";
                    msg += returnFileSize(inputPhoto.size);
                    $("#error-text").text(msg);
                    $("#error-card").show();
                    return false;
                }
            }
        }    
        return true;
    });
    
});