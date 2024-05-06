import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/colors/my_colors.dart';
import 'package:task_timer/styles/custom_dimens.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.color,
    required this.onTapAction,
    this.textColor = MyColors.white,
    this.height = CustomDimens.buttonHeight,
    this.radius = CustomDimens.buttonRadius,
  });

  final String title;
  final Color color;
  final Color textColor;
  final VoidCallback? onTapAction;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          disabledBackgroundColor: MyColors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: onTapAction,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
