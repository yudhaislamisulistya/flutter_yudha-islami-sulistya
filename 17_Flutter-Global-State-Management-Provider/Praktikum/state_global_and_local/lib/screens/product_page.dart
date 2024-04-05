import 'package:flutter/material.dart';
import 'package:state_global_and_local/screens/cart_page.dart';
import 'package:state_global_and_local/widgets/product_list.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laptop Shop"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart_checkout,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: const ProductList(),
    );
  }
}
