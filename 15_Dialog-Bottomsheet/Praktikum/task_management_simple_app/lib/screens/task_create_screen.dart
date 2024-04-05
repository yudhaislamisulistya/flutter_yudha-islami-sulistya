// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:task_management_simple_app/models/task_model.dart';
import 'package:uuid/uuid.dart';

class TaskCreateScreen extends StatefulWidget {
  final Function(TaskModel) onCreate;
  const TaskCreateScreen({
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  TextEditingController _inputTaskNameController = TextEditingController();

  @override
  void dispose() {
    _inputTaskNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Craete Task"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            _buildTaskNameField(),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Task Title"),
        const SizedBox(
          height: 10.0,
        ),
        TextField(
          controller: _inputTaskNameController,
          decoration: const InputDecoration(
            hintText: "Task Name",
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  Widget _buildButton() {
    return OutlinedButton.icon(
      icon: const Icon(Icons.add),
      label: const Text("Create Task"),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.deepPurple,
        side: const BorderSide(
          color: Colors.deepPurple,
        ),
      ),
      onPressed: () {
        final taskItem = TaskModel(
          id: const Uuid().v1(),
          taskName: _inputTaskNameController.text,
        );

        widget.onCreate(taskItem);
      },
    );
  }
}
