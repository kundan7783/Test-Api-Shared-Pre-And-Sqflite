import 'package:flutter/material.dart';
import 'package:test_api_shared_sqflite/utils/db_helper.dart';

class TaskProvider with ChangeNotifier {
  final TextEditingController nameController=TextEditingController();
  final TextEditingController descriptionController=TextEditingController();
  final TextEditingController statusController=TextEditingController();
  var globalKey=GlobalKey<FormState>();

  final DbHelper dbHelper=DbHelper();


  List<Map<String,dynamic>> taskData=[];

  Future<bool>  addTaskProvider(){
    var data={
     dbHelper.COLUMN_NAME:nameController.text,
     dbHelper.COLUMN_DESCRIPITION:descriptionController.text,
     dbHelper.COLUMN_STATUS:statusController.text,
    };
    getAllTaskProvider();
   return dbHelper.addTaskFromDataBase(data);
  }
   Future<void> getAllTaskProvider() async {
    taskData = await dbHelper.getAllTaskFromDatabase();
    notifyListeners();
  }
}