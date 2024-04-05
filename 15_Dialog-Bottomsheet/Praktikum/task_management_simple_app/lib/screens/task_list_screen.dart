import 'package:flutter/material.dart';
import 'package:task_management_simple_app/components/task_item_card.dart';
import 'package:task_management_simple_app/models/task_manager.dart';

class TaskListScreen extends StatelessWidget {
  final TaskManager manager;
  const TaskListScreen({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    final taskItems = manager.taskModels;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
        itemCount: taskItems.length,
        itemBuilder: (context, index) {
          final item = taskItems[index];
          return TaskItemCard(
            key: Key(item.id),
            task: item.taskName,
            onTap: () {
              manager.deleteTask(index);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Item delete adalah ${item.taskName}"),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20.0,
          );
        },
      ),
    );
  }
}
