import 'package:flutter/material.dart';
import 'package:task_timer/features/dashboard/models/task.dart';
import 'package:task_timer/features/dashboard/models/task_list_element.dart';
import 'package:task_timer/features/dashboard/page/widgets/add_task_view.dart';
import 'package:task_timer/features/dashboard/page/widgets/task_view.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key, required this.tasks});

  final List<TaskListElement> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        var task = tasks[index];
        if (task is Task) {
          return TaskView(task: task);
        }
        return const AddTaskView();
      },
    );
  }
}
