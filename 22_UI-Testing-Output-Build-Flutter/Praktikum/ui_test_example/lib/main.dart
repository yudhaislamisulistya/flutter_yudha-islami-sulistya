import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alta - Flutter Test Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Home Page",
            key: Key("titleMyHomePage"),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            const TextField(
              key: Key("nameTextField"),
              decoration: InputDecoration(
                hintText: "Enter your name",
              ),
            ),
            const TextField(
              key: Key("addressTextField"),
              decoration: InputDecoration(
                hintText: "Enter your Address",
              ),
            ),
            ElevatedButton(
              key: const Key("addButton"),
              onPressed: () {
                // Add your code here
              },
              child: const Text("Add"),
            ),
          ],
        ));
  }
}
