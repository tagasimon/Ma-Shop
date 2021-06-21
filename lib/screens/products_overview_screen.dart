import 'package:flutter/material.dart';

import 'package:my_shop/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        centerTitle: true,
        // actions: [
        //   IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        // ],
      ),
      body: ProductsGrid(),
    );
  }
}
