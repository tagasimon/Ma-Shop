import 'package:flutter/material.dart';
import 'package:my_shop/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product-detail";
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)!.settings.arguments
        as String; // Get all Prodcuts based on this ID
    final selectedItem = Provider.of<ProductsProvider>(context, listen: false)
        .selectedItem(productID);

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedItem.title}"),
        // actions: [
        //   IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        // ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(""),
          ],
        ),
      ),
    );
  }
}
