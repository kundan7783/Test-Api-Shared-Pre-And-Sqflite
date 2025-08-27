import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_api_shared_sqflite/screens/add_task_screen.dart';
import 'package:test_api_shared_sqflite/screens/cart_show_screen.dart';
import 'package:test_api_shared_sqflite/screens/login_screen.dart';
import 'package:test_api_shared_sqflite/screens/show_task_screen.dart';

import '../providers/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _pages=[
    AddTaskScreen(),
    ShowTaskScreen(),
    CartShowScreen()
  ];
  int cIndex = 0;
  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: _pages[cIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cIndex,
        onTap: (value) {
          setState(() {
            cIndex = value;
          });
        },
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.black,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Add Task",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.line_style_rounded),
            label: "Task List",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: "Cart"),
        ],
      ),
    );
  }
}
