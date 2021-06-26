import 'package:flutter/cupertino.dart';
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
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Image.network(
                  "${selectedItem.imageUrl}",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                child: Text(
                  "${selectedItem.price}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Text(
                  "${selectedItem.description}",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
