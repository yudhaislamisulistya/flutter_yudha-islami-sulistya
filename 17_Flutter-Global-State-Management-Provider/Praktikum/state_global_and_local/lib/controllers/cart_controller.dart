import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  final List<String> _cartList = [];
  List<String> get cartList => _cartList;

  void addToCart(String productName) {
    _cartList.add(productName);
    notifyListeners();
  }

  void removeFromCart(String productName) {
    _cartList.remove(productName);
    notifyListeners();
  }
}
