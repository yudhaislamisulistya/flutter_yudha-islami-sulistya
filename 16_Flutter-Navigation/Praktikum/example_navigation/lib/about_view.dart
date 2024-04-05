// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:example_navigation/about_arguments.dart';
import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  String? name;
  String? classRoom;
  AboutView({
    Key? key,
    this.name,
    this.classRoom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as AboutArguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Halaman About"),
            Image.network(
              data.image ?? "https://via.placeholder.com/200",
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            Text("Nama: ${data.name ?? '-'}"),
            Text("Kelas: ${data.classRoom ?? '-'}"),
            OutlinedButton.icon(
              icon: const Icon(Icons.arrow_left),
              label: const Text("Back to Home Page"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.deepPurple,
                side: const BorderSide(
                  color: Colors.deepPurple,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
