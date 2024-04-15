import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_global_and_local/controllers/cart_controller.dart';
import 'package:state_global_and_local/screens/cart_page.dart';
import 'package:state_global_and_local/widgets/product_list.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartList = Provider.of<CartController>(context, listen: true).cartList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laptop Shop"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
              ),
              if (cartList.isNotEmpty)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cartList.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
      body: const ProductList(),
    );
  }
}
