import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/todoapp_controller.dart';

class TodoappView extends GetView<TodoappController> {
  const TodoappView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Todo App'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to the previous screen
          },
        ),
      ),
      body: GetBuilder<TodoappController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: controller.taskController,
                  decoration: InputDecoration(
                    hintText: 'What do you want to accomplish?',
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    labelText: 'New Task',
                    labelStyle:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2),
                    ),
                    suffixIcon: InkWell(
                      onTap: controller.addTask,
                      child: Container(
                        margin:
                            const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                  style: const TextStyle(fontSize: 16),
                  onSubmitted: (_) => controller.addTask(),
                ),
                const SizedBox(height: 20),
                Obx(() => Expanded(
                      child: ListView.builder(
                        itemCount: controller.tasks.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              title: Text(
                                controller.tasks[index],
                                style: TextStyle(
                                  decoration:
                                      controller.completedTasks.contains(index)
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                ),
                              ),
                              leading: Checkbox(
                                value: controller.completedTasks.contains(index),
                                onChanged: (_) =>
                                    controller.toggleTaskCompletion(index),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => controller.deleteTask(index),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
              ],
            ),
          );
        }
      ),
    );
  }
}
