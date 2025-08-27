import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_api_shared_sqflite/providers/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var addTaskProvider=Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Add Task Screen")),
      body: Form(
        key: addTaskProvider.globalKey,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 15,
                ),
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          controller: addTaskProvider.nameController,
                          decoration: InputDecoration(
                            labelText: "Task name",
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
                          controller:addTaskProvider.descriptionController,
                          decoration: InputDecoration(
                            labelText: "Task description",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "description is required";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          controller: addTaskProvider.statusController,
                          decoration: InputDecoration(
                            labelText: "Task status",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "status is required";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: screenWidth,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(width: 1),
                              ),
                            ),
                            onPressed: () async {
                              if (addTaskProvider.globalKey.currentState!.validate()) {
                                 var success= await addTaskProvider.addTaskProvider();
                                 if(success){
                                   ScaffoldMessenger.of(
                                     context,
                                   ).showSnackBar(SnackBar(content: Text("Add Task Successfully")));
                                   FocusScope.of(context).unfocus();
                                 }else{
                                   ScaffoldMessenger.of(
                                     context,
                                   ).showSnackBar(SnackBar(content: Text("Error invalid")));
                                 }
                              }
                            },
                            child: Text("Add Task"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
