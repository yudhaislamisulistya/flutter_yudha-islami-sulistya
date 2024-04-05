import 'package:example_navigation/about_arguments.dart';
import 'package:example_navigation/about_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowMaterialGrid: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const MyHomePage(title: "Alta - Flutter Navigation"),
        '/about_page': (_) => AboutView(),
      },
      // home: const MyHomePage(title: 'Alta - Flutter Navigation'),
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
  TextEditingController inputNameController = TextEditingController();
  TextEditingController inputClassRoomController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: inputNameController,
                decoration: const InputDecoration(
                  hintText: "Masukkan Nama Anda",
                ),
              ),
              TextField(
                controller: inputClassRoomController,
                decoration: const InputDecoration(
                  hintText: "Masukkan Kelas Anda",
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('Pindah Halaman'),
              OutlinedButton.icon(
                icon: const Icon(Icons.arrow_right),
                label: const Text("About Screen"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                  side: const BorderSide(
                    color: Colors.deepPurple,
                  ),
                ),
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (_) {
                  //       return AboutView(
                  //         name: inputNameController.text,
                  //         classRoom: inputClassRoomController.text,
                  //       );
                  //     },
                  //   ),
                  // );
                  Navigator.of(context).pushNamed(
                    "/about_page",
                    arguments: AboutArguments(
                      name: inputNameController.text,
                      classRoom: inputClassRoomController.text,
                      image: 'https://thumbs.dreamstime.com/z/tech-bg-apr-technology-background-neon-effect-circuit-board-concept-gear-wheel-mechanism-button-hi-digital-engineering-180616137.jpg?w=992',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
