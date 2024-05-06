import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/constants/dimens.dart';
import 'package:task_timer/features/dashboard/models/task.dart';

class SessionsSummary extends StatelessWidget {
  const SessionsSummary(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sessions",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: Dimens.normalMargin,
          ),
          child: Text(
            task.sessions.toString(),
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
