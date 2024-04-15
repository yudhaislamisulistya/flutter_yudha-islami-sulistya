import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/contact_bloc.dart';
import 'package:flutter_bloc_example/screens/contact_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ContactBloc()..add(GetContacts()),
          ),
          // BlocProvider(create: (context) => InformationBloc()),
          // BlocProvider(create: (context) => UserBloc()),
        ],
        child: ContactScreen(),
      ),
    );
  }
}
