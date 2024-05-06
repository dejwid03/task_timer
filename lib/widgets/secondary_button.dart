import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/colors/my_colors.dart';
import 'package:task_timer/styles/custom_dimens.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.title,
    required this.color,
    required this.onTapAction,
    this.height = CustomDimens.buttonHeight,
    this.radius = CustomDimens.buttonRadius,
  });

  final String title;
  final Color color;
  final VoidCallback onTapAction;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          disabledBackgroundColor: MyColors.grey,
          side: BorderSide(
            color: color,
            width: 2,
          ),
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
              ?.copyWith(color: MyColors.white),
        ),
      ),
    );
  }
}
