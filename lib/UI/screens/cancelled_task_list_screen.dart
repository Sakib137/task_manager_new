import 'package:flutter/material.dart';
import 'package:task_manager/widgets/screen_background.dart';
import 'package:task_manager/widgets/task_item_widget.dart';
import 'package:task_manager/widgets/tm_app_bar.dart';

class CancelledTaskListScreen extends StatefulWidget {
  const CancelledTaskListScreen({super.key});

  static const String name = '/new_task_list';

  @override
  State<CancelledTaskListScreen> createState() => _CancelledTaskListScreenState();
}

class _CancelledTaskListScreenState extends State<CancelledTaskListScreen> {
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
                    return taskItemWidget();
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




