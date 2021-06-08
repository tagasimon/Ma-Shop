import 'package:flutter/material.dart';
import 'package:my_shop/models/product.dart';
import 'package:my_shop/widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
        id: 'id1',
        title: 'Red Shirt',
        description: "description",
        price: 2000,
        imageUrl:
            "https://images.unsplash.com/photo-1623137695111-697d0b907f57?ixid="
            "MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Product(
        id: 'id2',
        title: 'Black Shirt',
        description: "description",
        price: 2000,
        imageUrl:
            "https://images.unsplash.com/photo-1623137695111-697d0b907f57?ixid="
            "MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Product(
        id: 'id3',
        title: 'Green Shirt',
        description: "description",
        price: 2000,
        imageUrl:
            "https://images.unsplash.com/photo-1623137695111-697d0b907f57?ixid="
            "MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Product(
        id: 'id3',
        title: 'New Shirt',
        description: "description",
        price: 2000,
        imageUrl:
            "https://images.unsplash.com/photo-1623133106725-1e3d77acb7f9?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        // actions: [
        //   IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        // ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (context, i) => ProductItem(loadedProducts[i].id,
            loadedProducts[i].title, loadedProducts[i].imageUrl),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0),
      ),
    );
  }
}
