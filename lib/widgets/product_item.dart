import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_shop/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  String id;
  String title;
  String imgUrl;

  ProductItem(this.id, this.title, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: GridTile(
        header: GridTileBar(
          title: Text(title),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductDetailScreen.routeName,
                arguments: id);
          },
          child: Image.network(
            imgUrl,
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
              Icons.favorite,
              color: Theme.of(context).accentColor,
            ),
            onPressed: null,
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
