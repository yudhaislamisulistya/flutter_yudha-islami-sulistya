import 'package:flutter/material.dart';
import 'package:task_management_simple_app/models/task_model.dart';

class TaskManager extends ChangeNotifier {
  final List<TaskModel> _taskModels = [];
  List<TaskModel> get taskModels => List.unmodifiable(_taskModels);

  void deleteTask(int index) {
    _taskModels.removeAt(index);
    notifyListeners(); // -> setState
  }

  void addTask(TaskModel task) {
    _taskModels.add(task);
    notifyListeners();
  }
}
