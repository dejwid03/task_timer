import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/constants/lottie_paths.dart';
import 'package:lottie/lottie.dart';

class LottieView extends StatelessWidget {
  const LottieView({super.key, required this.isTimerEnabled});

  final bool isTimerEnabled;

  @override
  Widget build(BuildContext context) {
    final String lottieFile =
        isTimerEnabled ? LottiePaths.timerWorking : LottiePaths.timerPause;

    return Lottie.asset(lottieFile);
  }
}
