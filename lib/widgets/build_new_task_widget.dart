  import 'package:flutter/material.dart';
import 'package:task_manager/widgets/task_status_summery_counter_widget.dart';

SingleChildScrollView buildNewTaskList() {
    return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TaskStatusSummeryCounter( count: "09", title: "New",),
                TaskStatusSummeryCounter( count: "07", title: "Progress",),
                TaskStatusSummeryCounter( count: "08", title: "Completer",),
                TaskStatusSummeryCounter( count: "02", title: "Cancelled",),
              ],
            ),
          ),
        );
  }
