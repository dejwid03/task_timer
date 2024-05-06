import 'package:flutter_podstawy_utilities/services/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:task_timer/domain/repositories/tasks_repository.dart';
import 'package:task_timer/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:task_timer/features/task_timer/cubit/task_timer_cubit.dart';
import 'package:task_timer/main.dart';

GetIt sl = GetIt.instance;

void setupServiceLocatorForTimerApp() {
  sl.registerLazySingleton<NavigationService>(
    () => NavigationService(navigatorKey),
  );
  sl.registerFactory<DashboardCubit>(
    () => DashboardCubit(sl()),
  );

  sl.registerLazySingleton<TasksRepository>(
    () => TasksRepository(),
  );

  sl.registerFactory<TaskTimerCubit>(
    () => TaskTimerCubit(sl()),
  );
}
