import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_api_shared_sqflite/providers/task_provider.dart';
import 'package:test_api_shared_sqflite/utils/db_helper.dart';

import '../utils/db_helper.dart';

class ShowTaskScreen extends StatefulWidget {
  const ShowTaskScreen({super.key});

  @override
  State<ShowTaskScreen> createState() => _ShowTaskScreenState();
}

class _ShowTaskScreenState extends State<ShowTaskScreen> {
  @override
  void initState() {
    Provider.of<TaskProvider>(context,listen: false).getAllTaskProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    var showProvider=Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Task List Screen"),
      ),

      body: ListView.builder(
        itemCount:showProvider.taskData.length,
        itemBuilder: (context, index) {
          var task=showProvider.taskData[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
            child: Container(
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1,color: Colors.grey),

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("${task[DbHelper().COLUMN_NAME]}"),
                    SizedBox(height: 5,),
                    Wrap(
                      children: [
                        Text("${task[DbHelper().COLUMN_DESCRIPITION]}")
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text("${task[DbHelper().COLUMN_STATUS]}")
                  ],
                ),
              ),
            ),
          );
        },),
    );
  }
}
