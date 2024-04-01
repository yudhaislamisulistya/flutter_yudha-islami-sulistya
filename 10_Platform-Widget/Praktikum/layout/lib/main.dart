// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Alta - Flutter Layout'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // body: Center(
      //   child: Container(
      //     padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      //     width: 400.0,
      //     height: 200.0,
      //     color: Colors.amber,
      //     child: const Center(
      //       child: Text("Kelas Flutter B"),
      //     ),
      //   ),
      // ),
      // body: Container(
      //   color: Colors.red,
      //   child: Center(
      //     child: Text("Flutter"),
      //   ),
      // ),
      // body: Column(
      //   children: [
      //     Container(
      //       height: 100,
      //       width: 100,
      //       decoration: const BoxDecoration(
      //         color: Colors.blue,
      //       ),
      //     ),
      //     Container(
      //       height: 100,
      //       width: 100,
      //       decoration: const BoxDecoration(
      //         color: Colors.red,
      //       ),
      //     ),
      //     Container(
      //       height: 100,
      //       width: 100,
      //       decoration: const BoxDecoration(
      //         color: Colors.green,
      //       ),
      //     ),
      //     const Text("Halo"),
      //     Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: Container(
      //         height: 100,
      //         width: 100,
      //         decoration: const BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // body: Container(
      //   color: Colors.black12,
      //   width: double.infinity,
      //   child: ListView(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Container(
      //           height: 50,
      //           width: 50,
      //           decoration: const BoxDecoration(
      //             color: Colors.green,
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Container(
      //           height: 50,
      //           width: 50,
      //           decoration: const BoxDecoration(
      //             color: Colors.blue,
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Container(
      //           height: 50,
      //           width: 50,
      //           decoration: const BoxDecoration(
      //             color: Colors.orangeAccent,
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Container(
      //           height: 50,
      //           width: 50,
      //           decoration: const BoxDecoration(
      //             color: Colors.amber,
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Container(
      //           height: 50,
      //           width: 50,
      //           decoration: const BoxDecoration(
      //             color: Colors.black,
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Container(
      //           height: 50,
      //           width: 50,
      //           decoration: const BoxDecoration(
      //             color: Colors.pink,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // child: const Column(
      //   crossAxisAlignment: CrossAxisAlignment.start, // Horizonal
      //   mainAxisAlignment: MainAxisAlignment.spaceAround, // Vertical
      //   children: [
      //     Text("Halo"),
      //     Text("Alterra"),
      //     Text("Academy"),
      //     Text("Flutter"),
      //     Text("B"),
      //   ],
      // ),
      // child: const Row(
      //   crossAxisAlignment: CrossAxisAlignment.center, // Vertical
      //   mainAxisAlignment: MainAxisAlignment.end, // Horizonal
      //   children: [
      //     Text("Halo"),
      //     Text("Alterra"),
      //     Text("Academy"),
      //     Text("Flutter"),
      //     Text("B"),
      //   ],
      // ),
      // ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20.0, // Spasi Vertical (Gap)
        crossAxisSpacing: 40.0, // Spasi Horizonal (Gap)
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
