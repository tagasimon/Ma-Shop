import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart_model.dart';
import 'package:my_shop/providers/products_provider.dart';
import 'package:my_shop/screens/cart_screen.dart';
import 'package:my_shop/widgets/badge.dart';
import 'package:my_shop/widgets/products_grid.dart';
import 'package:provider/provider.dart';

enum FilterValues { All, Favourites }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var showFavouritesOnly = false;

  @override
  Widget build(BuildContext context) {
    // var cart = Provider.of<Cart>(context);
    // int cartLength = cart.cartLength;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
        centerTitle: true,
        actions: [
          Consumer<Cart>(
            builder: (context, data, ch) {
              return Badge(
                child: ch!,
                value: "${data.cartLength}",
                color: Colors.red,
              );
            },
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterValues val) {
              setState(() {
                if (val == FilterValues.Favourites) {
                  showFavouritesOnly = true;
                } else {
                  showFavouritesOnly = false;
                }
              });
            },
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  child: Text("All"),
                  value: FilterValues.All,
                ),
                PopupMenuItem(
                  child: Text("Favourites"),
                  value: FilterValues.Favourites,
                ),
              ];
            },
          )
        ],
      ),
      body: ProductsGrid(showFavouritesOnly: showFavouritesOnly),
    );
  }
}
