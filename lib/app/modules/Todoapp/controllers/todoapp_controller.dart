import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TodoappController extends GetxController {
  final taskController = TextEditingController();
  final tasks = <String>[].obs;
  final completedTasks = <int>[].obs;

  void addTask() {
    final task = taskController.text.trim();
    if (task.isNotEmpty) {
      tasks.add(task);
      taskController.clear();
    }
    update();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    completedTasks.remove(index);
    update();
  }

  void toggleTaskCompletion(int index) {
    if (completedTasks.contains(index)) {
      completedTasks.remove(index);
    } else {
      completedTasks.add(index);
    }
    update();
  }

  @override
  void onClose() {
    taskController.dispose();
    super.onClose();
  }
}
