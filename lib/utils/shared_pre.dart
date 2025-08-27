import 'package:shared_preferences/shared_preferences.dart';

class SharedPre {
  static String contactKey = "contact";
  static String nameKey = "name";
  static String pinCodeKey = "pinCode";
  static String emailKey = "email";
  static String passwordKey = "password";
  static String checkLogAndOut = "loginAndLogout";

 static Future<void> addUserFromSharedPre(String name, String contact, String pinCode,String email,String password) async {
    final SharedPreferences pref= await SharedPreferences.getInstance();
    pref.setString(nameKey, name);
    pref.setString(contactKey, contact);
    pref.setString(pinCodeKey, pinCode);
    pref.setString(emailKey, email);
    pref.setString(passwordKey, password);
    pref.setBool(checkLogAndOut, true);
  }

 static Future<Map<String,dynamic>> getUserFromSharedPre() async {
    final SharedPreferences pref= await SharedPreferences.getInstance();
    return{
      "getName":pref.getString(nameKey),
      "getEmail":pref.getString(emailKey),
      "getPassword":pref.getString(passwordKey),
    };
  }
  static Future<bool> checkLoginAndLogoutFromSharedPre(bool status) async {
    final SharedPreferences pref= await SharedPreferences.getInstance();
    return pref.setBool(checkLogAndOut, status);
  }

 static Future<bool> checkApplicationLoginAndLogoutFromSharedPre() async {
    final SharedPreferences pref= await SharedPreferences.getInstance();
     return pref.getBool(checkLogAndOut) ?? false ;
  }

}