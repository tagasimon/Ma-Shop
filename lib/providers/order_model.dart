import 'package:flutter/cupertino.dart';
import 'package:my_shop/providers/cart_item_model.dart';

class OrderModel {
  final String id;
  final double amount;
  final CartItemModel items;
  final DateTime date;

  OrderModel({
    required this.id,
    required this.amount,
    required this.items,
    required this.date,
  });
}

class Order with ChangeNotifier {
  Map<String, OrderModel> _order = {};

  Map get getOrders {
    return {..._order};
  }

  void addOrder(String id, double amount, CartItemModel items, DateTime date) {
    _order.putIfAbsent(
        id, () => OrderModel(id: id, amount: amount, items: items, date: date));
    notifyListeners();
  }
}
