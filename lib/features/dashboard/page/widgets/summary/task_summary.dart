import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/widgets/margins.dart';
import 'package:task_timer/features/dashboard/models/task.dart';
import 'package:task_timer/features/dashboard/page/widgets/summary/sessions_summary.dart';
import 'package:task_timer/features/dashboard/page/widgets/summary/time_summary.dart';

class TaskSummary extends StatelessWidget {
  const TaskSummary({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SessionsSummary(task),
        const VerticalNormalMargin(),
        TimeSummary(task),
      ],
    );
  }
}
