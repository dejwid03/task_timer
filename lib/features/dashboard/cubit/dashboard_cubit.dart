import 'package:task_timer/domain/repositories/tasks_repository.dart';
import 'package:task_timer/features/base/cubit_base.dart';
import 'package:task_timer/features/dashboard/cubit/dashboard_state.dart';
import 'package:task_timer/features/dashboard/models/task.dart';
import 'package:task_timer/features/dashboard/models/task_list_element.dart';
import 'package:task_timer/features/task_timer/page/nav_params/task_timer_nav_parameter.dart';
import 'package:task_timer/features/task_timer/page/task_timer_page.dart';

class DashboardCubit extends CubitBase<DashboardState> {
  DashboardCubit(this._tasksRepository) : super(DashboardInitial());

  final TasksRepository _tasksRepository;
  final List<TaskListElement> _tasks = [];

  bool _isAddTaskEntryVisible = false;

  Future<void> initialize() async {
    await _refreshTasks();
    _emitTasksLoadedState();
  }

  void selectTask(Task selectedTask) {
    for (int i = 0; i < _tasks.length; i++) {
      var element = _tasks[i];
      if (element is Task) {
        _tasks[i] = element.copyWith(isSelected: element.id == selectedTask.id);
      }
    }
    _emitTasksLoadedState();
  }

  Future<void> createTask(String taskName) async {
    bool isExists =
        _tasks.whereType<Task>().any((task) => task.name == taskName);
    if (isExists || taskName.isEmpty) {
      return;
    }
    _tasksRepository.addTask(taskName);
    await _refreshTasks();

    _isAddTaskEntryVisible = !_isAddTaskEntryVisible;
    _emitTasksLoadedState();
  }

  void cancelAddingTask() {
    _isAddTaskEntryVisible = !_isAddTaskEntryVisible;
    _emitTasksLoadedState();
  }

  void showAddTaskEntry() {
    _isAddTaskEntryVisible = !_isAddTaskEntryVisible;
    _emitTasksLoadedState();
  }

  Future<void> startTask() async {
    if (state is DashboardLoaded) {
      var dashboardLoadedState = state as DashboardLoaded;

      await navigationService.navigateToPage(TaskTimerPage(
          TaskTimerNavParameter(taskId: dashboardLoadedState.selectedTask.id)));
      await _refreshTasks();

      _emitTasksLoadedState();
    }
  }

  Future<void> _refreshTasks() async {
    var tasks = await _tasksRepository.getTasks();

    _tasks.clear();
    _tasks.addAll(
      tasks.map(
        (task) => Task(task.id, task.name, task.sessions,
            Duration(seconds: task.totalSeconds), task == tasks.first),
      ),
    );
    _addCreateTaskAction();
  }

  void _addCreateTaskAction() {
    if (_tasks.any((element) => element is AddTaskItem)) {
      return;
    }
    var addTaskItem = AddTaskItem();
    _tasks.add(addTaskItem);
  }

  void _emitTasksLoadedState() {
    emit(DashboardLoaded([..._tasks], _isAddTaskEntryVisible));
  }
}
