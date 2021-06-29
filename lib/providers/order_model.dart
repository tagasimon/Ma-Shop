import 'package:flutter/cupertino.dart';
import 'package:my_shop/providers/cart_item_model.dart';

class OrderModel {
  final String id;
  final double amount;
  final List<CartItemModel> cartItems;
  final DateTime date;

  OrderModel({
    required this.id,
    required this.amount,
    required this.cartItems,
    required this.date,
  });
}

class Orders with ChangeNotifier {
  List<OrderModel> _orders = [];

  List<OrderModel> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItemModel> cartItems, double total) {
    _orders.insert(
        0,
        OrderModel(
            id: DateTime.now().toString(),
            amount: total,
            cartItems: cartItems,
            date: DateTime.now()));
    notifyListeners();
  }
}
