import 'package:flutter/material.dart';
import '../models/item_model.dart';

class CartProvider extends ChangeNotifier {
  final List<ItemModel> _items = [];

  List<ItemModel> get items => _items;

  void addItem(ItemModel item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(ItemModel item) {
    _items.remove(item);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item.precio;
    }
    return total;
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
