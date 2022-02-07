import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Duel'),
    Task(name: 'Duel'),
  ];

  void addTask(String newTask) {
    tasks.add(Task(name: newTask));
    notifyListeners();
  }
}