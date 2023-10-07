//import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => [..._items];

  void addItem(Product product) {
  for (var item in _items) {
    if (item.product.id == product.id) {
      item.quantity++;
      notifyListeners();
      return;
    }
  }
  
  // If the item isn't already in the cart, add it with quantity 1
  _items.add(CartItem(product: product, id: null, title: null, price: null, quantity: 1));
  notifyListeners();
}




  void removeItem(int productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

}