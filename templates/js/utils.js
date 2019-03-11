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

function validateForm(formId) {
  var isValid = true;
  $('#'+formId+' .form-control').each(function() {
    if ( $(this).val() === '' )
        isValid = false;
  });
  return isValid;
}

function returnFileSize(number) {
  if(number < 1024) {
    return number + 'bytes';
  } else if(number >= 1024 && number < 1048576) {
    return (number/1024).toFixed(1) + 'KB';
  } else if(number >= 1048576) {
    return (number/1048576).toFixed(1) + 'MB';
  }
}

