import 'package:ac_network/Model/task.dart';
import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier{
  Task task;

  set update(Task singleTask) => task = singleTask;

  bool get isCompleted => task.isCompleted;

  void checkbox(bool check){
    if(task.isCompleted == check) return;
    task.complete = check;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}