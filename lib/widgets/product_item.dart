import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart_item_model.dart';
import 'package:my_shop/providers/product_model.dart';
import 'package:my_shop/screens/cart_screen.dart';
import 'package:my_shop/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context);
    final cart = Provider.of<Cart>(context, listen: false);
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
          leading: IconButton(
            icon: Icon(
              product.isFavourite ? Icons.favorite : Icons.favorite_border,
              // color: Theme.of(context).accentColor,
              color: Colors.white,
            ),
            onPressed: () {
              product.toggleFavStatus();
            },
          ),
          trailing: IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                // color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Added to Cart"),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: StadiumBorder(),
                              side: BorderSide(width: 2, color: Colors.white)),
                          onPressed: () {
                            Navigator.pushNamed(context, CartScreen.routeName);
                          },
                          child: Text(
                            'View Cart',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                );
                cart.addItem(product.id, product.title, product.price);
              }),
        ),
      ),
    );
  }
}
