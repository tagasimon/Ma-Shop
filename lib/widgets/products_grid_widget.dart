import 'package:flutter/material.dart';
import 'package:my_shop/providers/products_provider.dart';
import 'package:my_shop/widgets/product_item_widget.dart';
import 'package:provider/provider.dart';

class ProductsGridWidget extends StatelessWidget {
  final bool showFavouritesOnly;
  ProductsGridWidget({required this.showFavouritesOnly});
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products =
        showFavouritesOnly ? productsData.favItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        // create: (_) => products[i],
        value: products[i],
        child: ProductItemWidget(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0),
    );
  }
}
