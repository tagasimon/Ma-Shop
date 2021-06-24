import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_shop/providers/product_model.dart';
import 'package:my_shop/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imgUrl;
  //
  // ProductItem(this.id, this.title, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: GridTile(
        header: GridTileBar(
          title: Text(product.title),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          // title: Text(
          //   title,
          //   textAlign: TextAlign.left,
          // ),
          leading: IconButton(
            icon: Icon(
              product.isFavourite ? Icons.favorite : Icons.favorite_border,
              // color: Theme.of(context).accentColor,
              color: Colors.white,
            ),
            onPressed: product.toggleFavStatus,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Theme.of(context).accentColor,
            ),
            onPressed: null,
          ),
        ),
      ),
    );
  }
}
