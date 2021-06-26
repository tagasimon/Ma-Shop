import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart_item_model.dart';
import 'package:my_shop/widgets/cart_item_widget.dart';
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
          Expanded(
            child: ListView.builder(
                itemCount: cart.cartLength,
                itemBuilder: (context, i) {
                  return CartItemWidget(
                    id: cart.items.values.toList()[i].id,
                    productId: cart.items.keys.toList()[i],
                    title: cart.items.values.toList()[i].title,
                    quantity: cart.items.values.toList()[i].quantity,
                    price: cart.items.values.toList()[i].price,
                  );
                }),
          ),
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
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Order Now",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
