import 'package:flutter/material.dart';
import 'package:flutter_storage_api/controllers/book_controller.dart';
import 'package:flutter_storage_api/controllers/user_controller.dart';
import 'package:flutter_storage_api/preferences/user_preferences.dart';
import 'package:flutter_storage_api/screens/book_screen.dart';
import 'package:flutter_storage_api/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserController()),
        ChangeNotifierProvider(create: (context) => BookController()),
      ],
      child: MaterialApp(
        title: 'Flutter Storage and API',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: UserPreferences.getUserLoggedIn() == true ? const BookScreen() : const LoginScreen(),
      ),
    );
  }
}
