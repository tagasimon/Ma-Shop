import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_shop/providers/order_model.dart';

class OrderItemWidget extends StatefulWidget {
  final OrderModel order;

  OrderItemWidget({
    required this.order,
  });

  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "${widget.order.amount}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                "${DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date)}"),
            trailing: IconButton(
              icon: Icon(
                _expanded ? Icons.expand_less : Icons.expand_more,
              ),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: min(widget.order.cartItems.length * 20.0 + 10.0, 180.0),
              child: ListView(
                children: widget.order.cartItems.map((prod) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        prod.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${prod.quantity} X UGX:${prod.price}",
                        style: TextStyle(
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            )
        ],
      ),
    );
  }
}
