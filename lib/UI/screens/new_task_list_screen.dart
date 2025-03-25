import 'package:flutter/material.dart';
import 'package:task_manager/UI/screens/build_new_task_widget.dart';
import 'package:task_manager/widgets/screen_background.dart';
import 'package:task_manager/widgets/task_item_widget.dart';
import 'package:task_manager/widgets/tm_app_bar.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  static const String name = '/new_task_list';

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: TMAppbar(),

      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildNewTaskList(),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 20,
                itemBuilder: (context, index){
                  return taskItemWidget();
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}




