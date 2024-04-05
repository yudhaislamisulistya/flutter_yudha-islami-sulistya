import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final bool isAdded;
  final Function() onTap;
  const ProductCard({
    super.key,
    required this.productName,
    this.isAdded = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              "https://picsum.photos/id/0/200/200",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      productName,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      onPressed: onTap,
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 24.0,
                        color: isAdded ? Colors.green : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
