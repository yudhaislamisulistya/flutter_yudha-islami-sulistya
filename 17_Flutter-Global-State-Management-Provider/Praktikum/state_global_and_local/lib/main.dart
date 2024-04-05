import 'package:flutter/material.dart';
import 'package:state_global_and_local/controllers/cart_controller.dart';
import 'package:state_global_and_local/screens/product_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartController()),
      ],
      child: MaterialApp(
        title: 'Provider Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductPage(),
      ),
    );
  }
}
