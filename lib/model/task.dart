import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  bool _check = false;

  @HiveField(3)
  List<Task> tasks = <Task>[];

  Task({this.title, this.description, this.tasks});

  bool get isCompleted {
    if(tasks?.isEmpty ?? true) return _check;
    return tasks.any((task) => task.isCompleted);
  }

  set complete(bool value){
    if(tasks?.isEmpty ?? true) _check = value;
    else tasks.forEach((task) => task.complete = value);
  }
}