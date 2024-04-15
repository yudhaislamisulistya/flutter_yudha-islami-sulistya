import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/contact_bloc.dart';
import 'package:flutter_bloc_example/models/contact_model.dart';
import 'package:flutter_bloc_example/widgets/empty_screen.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final contact = ContactModel(
                      name: _nameController.text,
                      phone: _phoneController.text,
                    );

                    if (contact.name.isNotEmpty && contact.phone.isNotEmpty) {
                      context.read<ContactBloc>().add(AddContact(contact));
                      _nameController.clear();
                      _phoneController.clear();
                      // SnackBar
                      final snackBar = SnackBar(
                        content: Text('Data ${contact.name} berhasil ditambahkan!'),
                        backgroundColor: Colors.green,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    const snackBar = SnackBar(
                      content: Text('Ada Data yang Kosong!'),
                      backgroundColor: Colors.red,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text('Add Contact'),
                )
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ContactBloc, ContactState>(
              builder: (context, state) {
                if (state.contacts.isEmpty) {
                  return const EmptyScreen();
                }

                return ListView.builder(
                  itemCount: state.contacts.length, // Default 3
                  itemBuilder: (context, index) {
                    final contact = state.contacts[index];
                    return ListTile(
                      title: Text(contact.name),
                      subtitle: Text(contact.phone),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // Alert Dialog
                          showDialog(
                            context: context,
                            builder: (contextDialog) {
                              return AlertDialog(
                                title: const Text('Konfirmasi'),
                                content: Text('Apakah Anda yakin ingin menghapus ${contact.name}?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(contextDialog);
                                    },
                                    child: const Text('Batal'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.read<ContactBloc>().add(DeleteContact(contact));
                                      final snackBar = SnackBar(
                                        content: Text('Data ${contact.name} berhasil dihapus!'),
                                        backgroundColor: Colors.red,
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      Navigator.pop(contextDialog);
                                    },
                                    child: const Text('Hapus'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
