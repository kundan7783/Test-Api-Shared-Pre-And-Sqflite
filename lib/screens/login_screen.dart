import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_api_shared_sqflite/providers/auth_provider.dart';
import 'package:test_api_shared_sqflite/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
        double widthScreen=MediaQuery.of(context).size.width;
        var loginProvider= Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: loginProvider.loginGlobalKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: Column(
            children: [
              TextFormField( controller: loginProvider.loginEmailController,  decoration: InputDecoration( labelText: "Enter email..", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),validator: (value) {
                if(value== null || value.isEmpty){
                  return "email is required";
                }
                else  if (!value.contains("@")) {
                  return "Enter a valid email";
                }
                return null;
              },),
              SizedBox(height: 20,),
              TextFormField( controller: loginProvider.loginPasswordController,  decoration: InputDecoration( labelText: "Enter password..", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),validator: (value) {
                if(value== null || value.isEmpty){
                  return "password is required";
                }
                return null;
              },),
              SizedBox(height: 20,),
              SizedBox(
                width: widthScreen,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1))),
                    onPressed: (){
                      if(loginProvider.loginGlobalKey.currentState!.validate()){
                        loginProvider.loginUserAuthProvider(context);
                      }
                    }, child: Text("Login")),

              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't have an account ? "),
                  GestureDetector( onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
                  }, child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
