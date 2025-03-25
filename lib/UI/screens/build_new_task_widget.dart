  import 'package:flutter/material.dart';
import 'package:task_manager/widgets/task_status_summery_counter_widget.dart';

SingleChildScrollView buildNewTaskList() {
    return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                taskStatusSummeryCounter( count: "09", title: "New",),
                taskStatusSummeryCounter( count: "07", title: "Progress",),
                taskStatusSummeryCounter( count: "08", title: "Completer",),
                taskStatusSummeryCounter( count: "02", title: "Cancelled",),
              ],
            ),
          ),
        );
  }
