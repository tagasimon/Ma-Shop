import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product-detail";
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        // actions: [
        //   IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        // ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(""),
          ],
        ),
      ),
    );
  }
}
