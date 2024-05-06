import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_podstawy_utilities/colors/my_colors.dart';
import 'package:flutter_podstawy_utilities/constants/dimens.dart';
import 'package:task_timer/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:task_timer/styles/custom_dimens.dart';
import 'package:task_timer/widgets/primary_button.dart';
import 'package:task_timer/widgets/secondary_button.dart';

class NewTaskActions extends StatelessWidget {
  const NewTaskActions(this.textFieldController, {super.key});

  final TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimaryButton(
          title: "Add",
          color: MyColors.vividCrimson,
          onTapAction: () => _onAddClicked(context),
          height: CustomDimens.buttonSmallHeight,
          radius: CustomDimens.buttonSmallRadius,
        ),
        const SizedBox(
          width: Dimens.normalMargin,
        ),
        SecondaryButton(
          title: "Cancel",
          color: MyColors.vividCrimson,
          onTapAction: () => _onCancelClicked(context),
          height: CustomDimens.buttonSmallHeight,
          radius: CustomDimens.buttonSmallRadius,
        ),
      ],
    );
  }

  void _onAddClicked(BuildContext context) {
    _unfocus();
    BlocProvider.of<DashboardCubit>(context, listen: false)
        .createTask(textFieldController.text);
    textFieldController.clear();
  }

  void _onCancelClicked(BuildContext context) {
    _unfocus();
    textFieldController.clear();
    BlocProvider.of<DashboardCubit>(context, listen: false).cancelAddingTask();
  }

  void _unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
