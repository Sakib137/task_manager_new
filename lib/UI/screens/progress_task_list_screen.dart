import 'package:flutter/material.dart';
import 'package:task_manager/widgets/screen_background.dart';
import 'package:task_manager/widgets/task_item_widget.dart';
import 'package:task_manager/widgets/tm_app_bar.dart';

class ProgressTaskListScreen extends StatefulWidget {
  const ProgressTaskListScreen({super.key});

  static const String name = '/new_task_list';

  @override
  State<ProgressTaskListScreen> createState() => _ProgressTaskListScreenState();
}

class _ProgressTaskListScreenState extends State<ProgressTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppbar(),

      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 20,
                  itemBuilder: (context, index){
                    return TaskItemWidget();
                  }
                ),
              )
            ],
          ),
        ),
        
      ),
    );
  }
}




