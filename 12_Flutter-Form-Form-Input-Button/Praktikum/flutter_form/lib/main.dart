import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Alta - Flutter Form'),
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
  final _formKey = GlobalKey<FormState>();
  TextEditingController inputEmailController = TextEditingController();
  bool isValid = false;
  String radioGenderValue = "";
  List<bool> checkProgrammingLanguageValue = [false, false, false, false];
  int roleValue = 0;

  Map<int, String> roleMap = {0: 'Not Selected', 1: 'Member', 2: 'Reseller', 3: 'Admin'};

  List<String> programmingLanguages = ['Dart', 'Java', 'C++', 'Python'];

  List<String> getProgrammingLanguages(List<bool> values) {
    List<String> selectedLanguages = [];
    for (int i = 0; i < values.length; i++) {
      if (values[i]) {
        selectedLanguages.add(programmingLanguages[i]);
      }
    }
    return selectedLanguages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Masukkan Nama Anda",
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        prefixIconColor: Colors.deepPurple,
                      ),
                      validator: (value) {
                        String patternNumber = r'[0-9!@#\$%^&*(),.?":{}|<>]';
                        RegExp regexNumbers = RegExp(patternNumber);
                        String patternLetter = r"^[A-Z][a-z]*(?:\s[A-Z][a-z]*)*$";
                        RegExp regexLetters = RegExp(patternLetter);
                        if (value == null || value.isEmpty) {
                          return "Data is empty";
                        }
                        if (regexNumbers.hasMatch(value)) {
                          return "Data is contain number and symbol";
                        }
                        if (value.trim() != value) {
                          return "Blank Letter detected";
                        }
                        if (!regexLetters.hasMatch(value)) {
                          return "Each word must start with a capital later";
                        }
                        debugPrint("Data Nama : $value");
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text("Add"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          debugPrint("Data Berhasil Diinputkan");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: inputEmailController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Masukkan Email",
                  prefixIcon: const Icon(
                    Icons.email,
                  ),
                  prefixIconColor: Colors.deepPurple,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isValid ? Colors.green : Colors.red,
                      width: 0.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isValid ? Colors.green : Colors.red,
                      width: 0.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  if (!EmailValidator.validate(inputEmailController.text)) {
                    setState(() {
                      isValid = false;
                    });
                    return;
                  }
                  setState(() {
                    isValid = true;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: "Laki-Laki",
                        groupValue: radioGenderValue,
                        onChanged: (value) {
                          debugPrint("Ini Data $value");
                          radioGenderValue = value ?? "";
                          setState(() {}); // Rebuild UI
                        },
                      ),
                      const Text("Laki-Laki"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: "Perempuan",
                        groupValue: radioGenderValue,
                        onChanged: (value) {
                          debugPrint("Ini Data $value");
                          radioGenderValue = value ?? "";
                          setState(() {});
                        },
                      ),
                      const Text("Perempuan"),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: checkProgrammingLanguageValue[0],
                        onChanged: (value) {
                          setState(() {
                            checkProgrammingLanguageValue[0] = value ?? false;
                          });
                        },
                      ),
                      const Text("Dart"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: checkProgrammingLanguageValue[1],
                        onChanged: (value) {
                          setState(() {
                            checkProgrammingLanguageValue[1] = value ?? false;
                          });
                        },
                      ),
                      const Text("Java"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: checkProgrammingLanguageValue[2],
                        onChanged: (value) {
                          setState(() {
                            checkProgrammingLanguageValue[2] = value ?? false;
                          });
                        },
                      ),
                      const Text("C++"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: checkProgrammingLanguageValue[3],
                        onChanged: (value) {
                          setState(() {
                            checkProgrammingLanguageValue[3] = value ?? false;
                          });
                        },
                      ),
                      const Text("Python"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Center(
                child: DropdownButton(
                  value: roleValue,
                  onChanged: (value) {
                    setState(() {
                      roleValue = value ?? 0;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 0,
                      child: Text("Silahkan Pilih"),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text("Member"),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text("Reseller"),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text("Admin"),
                    ),
                  ],
                ),
              ),
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("Submit"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.deepPurple,
                side: const BorderSide(
                  color: Colors.deepPurple,
                ),
              ),
              onPressed: () {
                if (!EmailValidator.validate(inputEmailController.text)) {
                  debugPrint("Data Sebelum Dihapus : ${inputEmailController.text}");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Email Gak Valid!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  setState(() {
                    isValid = false;
                  });
                  inputEmailController.clear();
                  debugPrint("Data Setelah Dihapus : ${inputEmailController.text}");
                  return;
                }
                debugPrint(inputEmailController.text.toString());
                debugPrint(radioGenderValue.toString());
                debugPrint(getProgrammingLanguages(checkProgrammingLanguageValue).toString());
                debugPrint(roleMap[roleValue].toString()); // Menggunakan mapping untuk menampilkan nama role
                setState(() {
                  inputEmailController.clear();
                  radioGenderValue = "";
                  checkProgrammingLanguageValue = [false, false, false, false];
                  roleValue = 0;
                  isValid = false;
                });

                // [false, false, true, true] -> [C++, Python]
                // 3 -> Admin

                // flutter: yduha@gmail.com
                // flutter: Laki-Laki
                // flutter: [false, false, true, true]
                // flutter: 3

                // Harusnya Seperti
                // flutter: yduha@gmail.com
                // flutter: Laki-Laki
                // flutter: [C++, Python]
                // flutter: Admin
              },
            ),
          ],
        ),
      ),
    );
  }
}
