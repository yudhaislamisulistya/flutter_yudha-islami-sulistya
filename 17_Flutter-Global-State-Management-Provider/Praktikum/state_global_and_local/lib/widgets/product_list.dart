import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_global_and_local/controllers/cart_controller.dart';
import 'package:state_global_and_local/models/product_model.dart';
import 'package:state_global_and_local/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> productList = ProductModel().productList;
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: Colors.grey[100],
      child: GridView.builder(
        itemCount: productList.length, // 10 Data
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
          return Consumer<CartController>(
            builder: (context, cartController, child) {
              return ProductCard(
                productName: productList[index],
                isAdded: cartController.cartList.contains(productList[index]),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Add to Cart"),
                        content: Text("Apakah kamu ingin menambahkan ${productList[index]} kedalam keranjang belanja?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("No"),
                          ),
                          TextButton(
                            onPressed: () {
                              cartController.addToCart(productList[index]);
                              Navigator.of(context).pop();
                            },
                            child: const Text("Yes"),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
