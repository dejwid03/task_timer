import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_podstawy_utilities/colors/my_colors.dart';
import 'package:flutter_podstawy_utilities/constants/dimens.dart';
import 'package:flutter_podstawy_utilities/widgets/margins.dart';
import 'package:task_timer/di/di.dart';
import 'package:task_timer/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:task_timer/features/dashboard/cubit/dashboard_state.dart';
import 'package:task_timer/features/dashboard/page/widgets/entry/new_task_entry.dart';
import 'package:task_timer/features/dashboard/page/widgets/summary/task_summary.dart';
import 'package:task_timer/features/dashboard/page/widgets/tasks_list.dart';
import 'package:task_timer/widgets/primary_button.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashboardCubit? _cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.eerieBlack,
      body: SafeArea(
        child: _buildPageContent(),
      ),
    );
  }

  Widget _buildPageContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimens.hugeMargin,
        horizontal: Dimens.hugeMargin,
      ),
      child: BlocProvider<DashboardCubit>(
        create: (context) {
          _cubit = sl<DashboardCubit>();
          _cubit!.initialize();
          return _cubit!;
        },
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoaded) {
              return _buildDashboardLoaded(state);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDashboardLoaded(DashboardLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: _buildTasksSection(state),
        ),
        const VerticalHugeMargin(),
        NewTaskEntry(isVisible: state.isAddTaskEntryVisible),
        const VerticalHugeMargin(),
        _buildActionButton(state),
      ],
    );
  }

  Widget _buildActionButton(DashboardLoaded state) {
    return PrimaryButton(
      title: "Start",
      color: MyColors.vividCrimson,
      onTapAction: _cubit?.startTask,
    );
  }

  Widget _buildTasksSection(DashboardLoaded state) {
    return Column(
      children: [
        const VerticalBigMargin(),
        TaskSummary(task: state.selectedTask),
        const VerticalBigMargin(),
        Expanded(
          child: TasksList(
            tasks: state.tasks,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _cubit?.close();
    super.dispose();
  }
}
