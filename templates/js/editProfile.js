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
    
});

