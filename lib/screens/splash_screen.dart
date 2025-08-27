import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_api_shared_sqflite/providers/auth_provider.dart';
import 'package:test_api_shared_sqflite/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero,() {
     Provider.of<AuthProvider>(context,listen: false).loginAndLogOutUser(context);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Expanded(child: CircleAvatar(radius: 70,backgroundColor: Colors.green,)),
             CircularProgressIndicator(),
             SizedBox(height: 30,)
           ],
         ),
       ),
    );
  }
}
