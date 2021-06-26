import 'package:flutter/material.dart';
import 'package:my_shop/constants.dart';
import 'package:my_shop/providers/cart_item_model.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final productId;
  final String title;
  final int quantity;
  final double price;
  const CartItemWidget({
    required this.productId,
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Constants.kErrorColor,
        padding: EdgeInsets.only(right: 15.0),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
      ),
      onDismissed: (direction) {
        cart.removeItem(productId);
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$title"),
                  Spacer(),
                  Chip(
                    label: Text(
                      "X $quantity",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  Chip(
                    label: Text("UGX $price"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
