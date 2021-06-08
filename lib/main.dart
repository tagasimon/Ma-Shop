import 'package:flutter/material.dart';
import 'package:my_shop/screens/home_screen.dart';
import 'package:my_shop/screens/product_detail_screen.dart';
import 'package:my_shop/screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shop',
      theme: ThemeData(primarySwatch: Colors.teal, accentColor: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: ProductsOverviewScreen(),
      routes: {
        ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
      },
    );
  }
}
