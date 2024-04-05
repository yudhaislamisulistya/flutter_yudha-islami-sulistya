import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_simple_app/models/task_manager.dart';
import 'package:task_management_simple_app/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskManager()),
        // ChangeNotifierProvider(create: (context) => UserManager()),
        // ChangeNotifierProvider(create: (context) => ProductManager()),
        // ChangeNotifierProvider(create: (context) => TranscationManager()),
        // ChangeNotifierProvider(create: (context) => OrderManager()),
        // ChangeNotifierProvider(create: (context) => ProfileManager()),
        // ChangeNotifierProvider(create: (context) => AboutManager()),
      ],
      child: MaterialApp(
        title: 'Task Management App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TaskScreen(),
      ),
    );
  }
}
