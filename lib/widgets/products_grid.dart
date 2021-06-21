import 'package:flutter/material.dart';
import 'package:my_shop/models/product.dart';
import 'package:my_shop/widgets/product_item.dart';
import 'package:my_shop/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductsData = Provider.of<ProductsProvider>(context);
    final products = ProductsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, i) => ProductItem(
        products[i].id,
        products[i].title,
        products[i].imageUrl,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0),
    );
  }
}
