import 'package:equatable/equatable.dart';
import 'package:task_timer/domain/models/task.dart';

abstract class TaskTimerState extends Equatable {
  const TaskTimerState();
}

class TaskTimerInitial extends TaskTimerState {
  const TaskTimerInitial() : super();

  @override
  List<Object?> get props => [];
}

class TaskTimerUpdate extends TaskTimerState {
  const TaskTimerUpdate(this.task, this.duration, this.isTimerEnabled);

  final Task task;
  final Duration duration;
  final bool isTimerEnabled;

  @override
  List<Object?> get props => [task, duration, isTimerEnabled];
}
