import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart_model.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const routeName = "/cart";
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("TOTAL"),
                  Spacer(),
                  Chip(
                    label: Text("${cart.cartTotal}"),
                  ),
                  TextButton(onPressed: () {}, child: Text("Order Now"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
