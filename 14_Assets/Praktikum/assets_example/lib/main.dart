import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assset',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Alta - Flutter Assset'),
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
      body: Center(
        child: Column(
          children: [
            const Text(
              "Selamat Datang di Flutter Kelas B",
              style: TextStyle(
                fontSize: 32.0,
                fontFamily: "Rowdies",
              ),
            ),
            Text(
              "Hari ini kita belajar Assets dan Form",
              style: GoogleFonts.montserrat(
                fontSize: 32,
                color: Colors.deepPurple,
              ),
            ),
            const Image(
              image: AssetImage("assets/images/bg.jpg"),
              height: 100.0,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Image.asset("assets/images/icon.png"),
            SvgPicture.asset(
              "assets/svg/sensor-alert.svg",
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
