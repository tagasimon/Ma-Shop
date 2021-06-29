import 'package:flutter/material.dart';
import 'package:my_shop/providers/order_model.dart';
import 'package:my_shop/widgets/app_drawer_widget.dart';
import 'package:my_shop/widgets/order_item_widget.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders_screen";
  @override
  Widget build(BuildContext context) {
    var ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: ListView.builder(
          itemCount: ordersData.orders.length,
          itemBuilder: (context, i) {
            return OrderItemWidget(order: ordersData.orders[i]);
          }),
      drawer: AppDrawerWidget(),
    );
  }
}
