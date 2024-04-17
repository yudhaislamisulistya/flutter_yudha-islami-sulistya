// ignore_for_file: unused_element, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_storage_api/controllers/user_controller.dart';
import 'package:flutter_storage_api/screens/book_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login() async {
    if (usernameController.text == '' || passwordController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username and Password cannot be empty'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Provider.of<UserController>(context, listen: false).loginUser(usernameController.text, passwordController.text);

    await Future.delayed(const Duration(seconds: 1));

    if (Provider.of<UserController>(context, listen: false).isLoggedIn) {
      // isLoggedIn = True -> Pindah ke Halaman Book
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const BookScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else {
      // isLoggedIn  = False -> Tampilkan Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid Username or Password'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<UserController>(
                builder: (context, userController, _) {
                  return ElevatedButton(
                    onPressed: _login,
                    child: userController.isLoggedIn
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text('Login'),
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
