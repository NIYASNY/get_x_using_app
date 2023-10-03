import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:get_x_project/app/model/database.dart';
import 'package:get_x_project/app/model/task.dart';

class HomeController extends GetxController {
  final RxList tasklist = <Task>[].obs;

  Future<void> getTask() async {
    final List<Map<String, dynamic>> tasks = await DbHelper().quaryall();
    tasklist.assignAll(tasks.map((data) => Task.fromMap(data)).toList());
  }

  addTask(Task task) async {
    await DbHelper().insertTask(task);
    tasklist.add(task);
    getTask();
  }

  deleteTask(int? id) async {
    await DbHelper().delete(id!);
    getTask();
  }

  deleteAllTasks() async {
    await DbHelper().deleteAllTasks();
    getTask();
  }

  Update(int? id) async {
    await DbHelper().update(id!);
    getTask();
  }
}
