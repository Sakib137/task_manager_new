import 'package:flutter/material.dart';
import 'package:task_manager/widgets/screen_background.dart';
import 'package:task_manager/widgets/tm_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  static const String name = '/add_new_task';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {

  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskDescriptionController = TextEditingController();
  final TextEditingController _taskDateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: TMAppbar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80),
                  Text("Add New Task", style: textTheme.titleLarge,),
                  SizedBox(height: 24),
                  TextField(
                    controller: _taskNameController,
                    decoration: InputDecoration(
                      hintText: "Task Name",
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _taskDescriptionController,
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: "Task Description",
                      
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _taskDateController,
                    decoration: InputDecoration(
                      hintText: "Task Date",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24),
              
                  ElevatedButton(
                    onPressed: (){},
                    child: Text("Add Task"),
                  )
                ],
              ),
            ),
          ),
        ),
    ),
    );
  }
  @override
  void dispose() {
    _taskNameController.dispose();
    _taskDescriptionController.dispose();
    _taskDateController.dispose();
    super.dispose();
  }
}