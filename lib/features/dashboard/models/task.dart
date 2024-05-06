import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:task_timer/features/dashboard/models/task_list_element.dart';

part 'task.g.dart';

@CopyWith()
class Task extends TaskListElement {
  const Task(
      this.id, this.name, this.sessions, this.totalDuration, this.isSelected)
      : super();

  final int id;
  final String name;
  final int sessions;
  final Duration totalDuration;
  final bool isSelected;

  @override
  List<Object?> get props => [id, name, sessions, totalDuration, isSelected];
}
