// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_storage_api/controllers/book_controller.dart';
import 'package:flutter_storage_api/controllers/user_controller.dart';
import 'package:flutter_storage_api/screens/login_screen.dart';
import 'package:provider/provider.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  void _logout() async {
    Provider.of<UserController>(context, listen: false).logoutUser();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {
      return const LoginScreen();
    }), (route) => false);
  }

  void _addBook(context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Book'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Author',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Publish Year',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Tambahkan Fungsi untuk Menyimpan Data
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<BookController>(context, listen: false).getBooks();
  }

  @override
  Widget build(BuildContext context) {
    final bookController = Provider.of<BookController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Dashboard", style: TextStyle(color: Colors.white)),
        actions: [
          // Button Referesh
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              bookController.getBooks();
            },
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              _addBook(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _logout,
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<BookController>(
          builder: (context, value, child) {
            if (bookController.isLoaded) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: bookController.books?.length ?? 0,
              itemBuilder: (context, index) {
                final book = bookController.books?[index];
                return Card(
                  child: ListTile(
                    title: Text(book.title),
                    subtitle: Text(book.author),
                    trailing: Text(book.publishedYear),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
