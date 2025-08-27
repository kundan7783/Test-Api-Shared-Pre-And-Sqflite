import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_api_shared_sqflite/screens/home_screen.dart';

import '../providers/auth_provider.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    var signupProvider= Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Screen"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: signupProvider.globalKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              children: [
                TextFormField(
                  controller:signupProvider.nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Enter name..",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "name is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller:signupProvider.contactController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                    labelText: "Enter contact..",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "contact is required";
                    }
                    else if (!RegExp(r'^[0-9]{10}$').hasMatch(value.trim())) {
                      return "Enter a valid 10-digit number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller:signupProvider.pinCodeController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    labelText: "Enter pin code..",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "pinCode is required";
                    }
                    if (!RegExp(r'^[0-9]{6}$').hasMatch(value.trim())) {
                      return "Enter a valid 6-digit pinCode";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller:signupProvider.emailController,
                  decoration: InputDecoration(
                    labelText: "Enter email..",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "email is required";
                    }else  if (!value.contains("@")) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: signupProvider.passwordController,
                  decoration: InputDecoration(
                    labelText: "Enter password..",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "password is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: widthScreen,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(width: 1),
                      ),
                    ),
                    onPressed: () {
                      if (signupProvider.globalKey.currentState!.validate()) {
                           signupProvider.addUserAuthProvider();

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signup Successfully")));
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));

                      }
                    },
                    child: Text("Register"),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("You have an account ? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
