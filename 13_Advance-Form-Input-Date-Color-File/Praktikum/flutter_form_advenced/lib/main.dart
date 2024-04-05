import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Advanced Input',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Alta - Flutter Form Advanced'),
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
  DateTime _dueDate = DateTime.now();
  final _currentDate = DateTime.now();
  Color _currentColor = Colors.deepPurple;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    debugPrint(result.toString());
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  void _openFile(PlatformFile file) {
    // [PlatformFile(path /Volumes/ML 1 APFS/Download/_MG_3071.JPG, name: _MG_3071.JPG, bytes: null, readStream: null, size: 7971362)]
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildDatePicker(context),
            _buildColorPicker(context),
            _buildFilePicker(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Date"),
            TextButton.icon(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: _currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(_currentDate.year + 10),
                );

                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
              icon: const Icon(Icons.date_range),
              label: const Text("Select"),
            ),
          ],
        ),
        Text(
          DateFormat("dd-MM-yyyy").format(_dueDate),
          style: const TextStyle(
            fontSize: 20,
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget _buildColorPicker(BuildContext context) {
    return Column(
      children: [
        const Text("Color"),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: OutlinedButton.icon(
            icon: const Icon(Icons.color_lens),
            label: const Text("Pick Color"),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.deepPurple,
              side: const BorderSide(
                color: Colors.deepPurple,
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Pick Your Color"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ColorPicker(
                          pickerColor: _currentColor,
                          onColorChanged: (value) {
                            _currentColor = value;
                          },
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          setState(() {}); // Tujuan Rebuild UI (User Interface)
                          Navigator.pop(context);
                        },
                        child: const Text("Save color"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pick Files"),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: OutlinedButton.icon(
            icon: const Icon(Icons.file_copy_sharp),
            label: const Text("Pick and Open File"),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.deepPurple,
              side: const BorderSide(
                color: Colors.deepPurple,
              ),
            ),
            onPressed: () {
              _pickFile();
            },
          ),
        )
      ],
    );
  }
}

// Jangan Disini
