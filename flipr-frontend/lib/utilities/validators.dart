import 'package:flipr/utilities/utilities_export.dart';

class Validators {
  static String? validateEmailId(String emailId) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailId);
    if (!emailValid) {
      return AppStrings.emailErrorText;
    } else {
      return null;
    }
  }

  static String? validatePassword(String password) {
    if (password.length >= 6) {
      return null;
    } else {
      return AppStrings.passwordInvalidText;
    }
  }
  static String? validateSignUpPassword(String password1,String password2) {
    if (password1.length >= 6 && password2.length >=6) {
      if(password1 == password2){
        return null;
      }
      else{
        return "Password should same";
      }
    } else {
      return AppStrings.passwordInvalidText;
    }
  }
}
