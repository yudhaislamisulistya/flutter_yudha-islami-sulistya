// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_simple_app/components/profile_sheet.dart';
import 'package:task_management_simple_app/models/task_manager.dart';
import 'package:task_management_simple_app/screens/empty_task_screen.dart';
import 'package:task_management_simple_app/screens/task_create_screen.dart';
import 'package:task_management_simple_app/screens/task_list_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<TaskManager>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Management"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const ProfileSheet();
                },
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.account_circle,
              size: 24.0,
              color: Colors.deepPurple,
            ),
          ),
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.only(
              right: 10.0,
            ),
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            child: Center(
              child: Text(
                manager.taskModels.length.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: _buildTaskScreen(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return TaskCreateScreen(
                  onCreate: (task) {
                    manager.addTask(task);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildTaskScreen() {
    return Consumer<TaskManager>(
      builder: (context, value, child) {
        if (value.taskModels.isNotEmpty) {
          return TaskListScreen(manager: value);
        } else {
          return const EmptyTaskScreen();
        }
      },
    );
  }
}
