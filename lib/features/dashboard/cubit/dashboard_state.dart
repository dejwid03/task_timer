import 'package:equatable/equatable.dart';
import 'package:task_timer/features/dashboard/models/task.dart';
import 'package:task_timer/features/dashboard/models/task_list_element.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {
  const DashboardInitial() : super();
}

class DashboardLoaded extends DashboardState {
  const DashboardLoaded(this.tasks, this.isAddTaskEntryVisible) : super();

  final List<TaskListElement> tasks;
  final bool isAddTaskEntryVisible;

  Task get selectedTask =>
      tasks.whereType<Task>().firstWhere((task) => task.isSelected);

  @override
  List<Object?> get props => [tasks];
}
