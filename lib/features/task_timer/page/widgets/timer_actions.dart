import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_podstawy_utilities/colors/my_colors.dart';
import 'package:flutter_podstawy_utilities/widgets/margins.dart';
import 'package:task_timer/features/task_timer/cubit/task_timer_cubit.dart';
import 'package:task_timer/features/task_timer/cubit/task_timer_state.dart';
import 'package:task_timer/widgets/primary_button.dart';

class TimerActions extends StatelessWidget {
  const TimerActions({super.key, required this.state});

  final TaskTimerUpdate state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _buildStopButton(context),
        ),
        const HorizontalHugeMargin(),
        Expanded(
          child: _buildToggleButton(context),
        ),
      ],
    );
  }

  Widget _buildToggleButton(BuildContext context) {
    return PrimaryButton(
      title: state.isTimerEnabled ? "Pause" : "Continue",
      color: state.isTimerEnabled ? MyColors.vividCrimson : MyColors.upMaroon,
      onTapAction: () {
        BlocProvider.of<TaskTimerCubit>(context, listen: false).toggleTimer();
      },
    );
  }

  Widget _buildStopButton(BuildContext context) {
    return PrimaryButton(
      title: "Stop",
      color: MyColors.vividCrimson,
      onTapAction: () {
        BlocProvider.of<TaskTimerCubit>(context, listen: false).stopTimer();
      },
    );
  }
}
