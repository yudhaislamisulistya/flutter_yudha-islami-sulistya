import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_global_and_local/controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartList = Provider.of<CartController>(context, listen: true).cartList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Cart"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        color: Colors.grey[100],
        child: ListView.builder(
          itemCount: cartList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              title: Text(cartList[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Remove from Cart"),
                        content: Text("Apakah kamu ingin menghapus ${cartList[index]} dari keranjang belanja?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("No"),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<CartController>(context, listen: false).removeFromCart(cartList[index]);
                              Navigator.of(context).pop();
                            },
                            child: const Text("Yes"),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
