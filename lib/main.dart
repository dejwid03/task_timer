import 'package:flutter/material.dart';
import 'package:task_timer/di/di.dart';
import 'package:task_timer/features/dashboard/page/dashboard_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

void main() async {
  setupServiceLocatorForTimerApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const DashboardPage(),
    );
  }
}
