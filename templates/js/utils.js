function checkPassword(pwd, confirmPwd){
    var pwdToCheck = $.trim(pwd);
    var confirmPwdToCheck = $.trim(pwd);
    var message = "";
    
    if (pwdToCheck.length >= 8){
        if (pwdToCheck == confirmPwd){
            return {valid: true, message: message};
        }else{
            message = "Passwords don't match.";
        }
    }else{
        message = "Password must contain 8 characters at least.";
    }
    return {valid: false, message: message};
}

