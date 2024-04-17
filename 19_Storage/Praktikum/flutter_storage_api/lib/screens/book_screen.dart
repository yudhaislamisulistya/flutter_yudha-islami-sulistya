// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_storage_api/controllers/user_controller.dart';
import 'package:flutter_storage_api/screens/login_screen.dart';
import 'package:provider/provider.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _logout() async {
      Provider.of<UserController>(context, listen: false).logoutUser();
      await Future.delayed(const Duration(seconds: 1));
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }), (route) => false);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Dashboard", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _logout,
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
