import 'package:flutter/cupertino.dart';

class CartItemModel {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItemModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItemModel> _items = {};

  Map<String, CartItemModel> get items {
    return {..._items};
  }

  int get cartLength {
    return _items.isEmpty ? 0 : _items.length;
  }

  double get cartTotal {
    double total = 0.0;
    _items.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  void addItem(String id, String title, double price) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (existingItem) => CartItemModel(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          quantity: existingItem.quantity + 1,
        ),
      );
      print("Item Updated.....");
    } else {
      _items.putIfAbsent(
        id,
        () => CartItemModel(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
      print("Item Added.....");
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }
}
