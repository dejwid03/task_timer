import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_timer/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:task_timer/features/dashboard/page/widgets/task_view_content.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskViewContent(
      text: "+",
      onTap: () => onClickAction(context),
    );
  }

  void onClickAction(BuildContext context) {
    BlocProvider.of<DashboardCubit>(context, listen: false).showAddTaskEntry();
  }
}
