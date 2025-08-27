import 'package:flutter/material.dart';
import 'package:test_api_shared_sqflite/screens/home_screen.dart';
import 'package:test_api_shared_sqflite/screens/login_screen.dart';
import 'package:test_api_shared_sqflite/utils/shared_pre.dart';

class AuthProvider with ChangeNotifier {
  String name = "";
  String email = "";
  String password = "";

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  var loginGlobalKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var globalKey = GlobalKey<FormState>();

  addUserAuthProvider() async {
    await SharedPre.addUserFromSharedPre(
      nameController.text,
      contactController.text,
      pinCodeController.text,
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    await getUserAuthProvider();
    notifyListeners();
  }

  getUserAuthProvider() async {
    var getUser = await SharedPre.getUserFromSharedPre();
    name = getUser["getName"] ?? "";
    email = getUser["getEmail"] ?? "";
    password = getUser["getPassword"] ?? "";
    notifyListeners();
  }

  logOutUserAuthProvider(BuildContext context) {
    SharedPre.checkLoginAndLogoutFromSharedPre(false);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    notifyListeners();
  }

  loginUserAuthProvider(BuildContext context) async {
    await getUserAuthProvider();
    if (loginEmailController.text.trim() == email &&
        loginPasswordController.text.trim() == password) {
      SharedPre.checkLoginAndLogoutFromSharedPre(true);
      notifyListeners();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (loginEmailController.text != email) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Email invalid")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Password invalid")));
    }
  }

  loginAndLogOutUser(BuildContext context) async {
    await getUserAuthProvider();
    bool response =
        await SharedPre.checkApplicationLoginAndLogoutFromSharedPre();
    if (response) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }
}
