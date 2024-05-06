import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/colors/my_colors.dart';
import 'package:flutter_podstawy_utilities/constants/dimens.dart';
import 'package:task_timer/styles/custom_dimens.dart';

class TaskTitleField extends StatelessWidget {
  TaskTitleField(this.textFieldController, {super.key});

  final TextEditingController textFieldController;

  final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(CustomDimens.buttonRadius),
      borderSide: const BorderSide(
        color: MyColors.vividCrimson,
        width: 1.0,
      ));

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textFieldController,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(fontWeight: FontWeight.bold, color: MyColors.white),
      cursorColor: MyColors.vividCrimson,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: Dimens.smallMargin,
          horizontal: Dimens.normalMargin,
        ),
        focusColor: MyColors.vividCrimson,
        hoverColor: MyColors.vividCrimson,
        hintStyle: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: MyColors.grey),
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        hintText: 'Enter a task name',
      ),
    );
  }
}
