import 'dart:async';

import 'package:task_timer/domain/models/task.dart';
import 'package:task_timer/domain/repositories/tasks_repository.dart';
import 'package:task_timer/features/base/cubit_base.dart';
import 'package:task_timer/features/task_timer/cubit/task_timer_state.dart';

class TaskTimerCubit extends CubitBase<TaskTimerState> {
  TaskTimerCubit(this.tasksRepository) : super(const TaskTimerInitial());

  late Task _task;
  late Timer _timer;
  int _secondsPassed = 0;
  bool _isTimerEnabled = true;

  final TasksRepository tasksRepository;

  Future<void> initialize(int taskId) async {
    _task = await tasksRepository.getTask(taskId);

    _isTimerEnabled = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isTimerEnabled) {
        _onTimerTick();
      }
    });
  }

  void stopTimer() {
    int totalSessions = _task.sessions + 1;
    int totalSeconds = _secondsPassed + _task.totalSeconds;

    tasksRepository
        .updateTask(Task(_task.id, _task.name, totalSessions, totalSeconds));
    navigationService.pop();
  }

  void toggleTimer() {
    _isTimerEnabled = !_isTimerEnabled;
    var duration = Duration(seconds: _secondsPassed);
    emit(TaskTimerUpdate(_task, duration, _isTimerEnabled));
  }

  void _onTimerTick() {
    _secondsPassed++;
    var duration = Duration(seconds: _secondsPassed);
    emit(TaskTimerUpdate(_task, duration, _isTimerEnabled));
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
