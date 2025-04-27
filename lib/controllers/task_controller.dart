import 'package:get/get.dart';
import 'package:to_do_app/models/task.dart';

class TaskController extends GetxController {
  List<Task> taskList = <Task>[].obs;
  void addTask({
    required String title,
    required String note,
    required String date,
    required String startTime,
    required String endTime,
    required int remind,
    required String repeat,
    required int color,
  }) {}

  void getTasks() {}
}
