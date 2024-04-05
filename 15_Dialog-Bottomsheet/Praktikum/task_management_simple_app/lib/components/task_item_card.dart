import 'package:flutter/material.dart';

class TaskItemCard extends StatelessWidget {
  final String task;
  final Function() onTap;
  const TaskItemCard({super.key, required this.task, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Update"),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Colors.deepPurple,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: ListTile(
          title: Text(task),
          trailing: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: const Text("Apakah anda ingin menghapus data ini?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("No"),
                      ),
                      TextButton(
                        onPressed: onTap,
                        child: const Text("Yes"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(
              Icons.delete_forever,
              size: 24.0,
              color: Colors.deepPurple,
            ),
          ),
        ),
      ),
    );
  }
}
