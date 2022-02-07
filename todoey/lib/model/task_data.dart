import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'task.dart';

class taskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Duel'),
    Task(name: 'Duel'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTask) {
    _tasks.add(Task(name: newTask));
    notifyListeners();
  }

  int getCount() {
    return _tasks.length;
  }
}
