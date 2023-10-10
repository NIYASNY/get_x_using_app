import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:get_x_project/app/model/database.dart';
import 'package:get_x_project/app/model/task.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    getTasks();
    super.onReady();
  }

  var tasklist = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DbHelper.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DbHelper.query();
    tasklist.assignAll(tasks.map((data) => new Task.fromMap(data)).toList());
  }

  void delete(Task task) {
    DbHelper.delete(task);
  }

  // final DbHelper dbHelper = DbHelper();
}
