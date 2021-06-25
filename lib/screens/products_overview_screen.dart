import 'package:flutter/material.dart';
import 'package:my_shop/providers/products_provider.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
        centerTitle: true,
        actions: [
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
