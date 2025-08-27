import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_api_shared_sqflite/providers/auth_provider.dart';
import 'package:test_api_shared_sqflite/providers/carts_api_provider.dart';
import 'package:test_api_shared_sqflite/providers/task_provider.dart';
import 'package:test_api_shared_sqflite/screens/splash_screen.dart';

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthProvider(),),
    ChangeNotifierProvider(create: (context) => TaskProvider(),),
    ChangeNotifierProvider(create: (context) => CartsApiProvider(),),
  ],child: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
