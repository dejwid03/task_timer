import 'package:equatable/equatable.dart';

abstract class TaskListElement extends Equatable {
  const TaskListElement();

  @override
  List<Object?> get props => [];
}

class AddTaskItem extends TaskListElement {
  @override
  List<Object?> get props => [];
}
