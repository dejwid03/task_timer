import 'package:bloc/bloc.dart';
import 'package:flutter_podstawy_utilities/services/navigation_service.dart';
import 'package:task_timer/di/di.dart';

abstract class CubitBase<State> extends Cubit<State> {
  CubitBase(super.initialState);

  final NavigationService navigationService = sl();
}
