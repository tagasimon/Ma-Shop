import 'package:flutter/cupertino.dart';
import 'package:my_shop/providers/product_model.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModel> _items = [
    ProductModel(
        id: 'id1',
        title: 'RED Shirt',
        description: "description",
        price: 2000,
        imageUrl:
            "https://images.unsplash.com/photo-1623137695111-697d0b907f57?ixid="
            "MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ProductModel(
        id: 'id2',
        title: 'BLACK Shirt',
        description: "description",
        price: 2000,
        imageUrl:
            "https://images.unsplash.com/photo-1623137695111-697d0b907f57?ixid="
            "MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ProductModel(
        id: 'id3',
        title: 'GREEN Shirt',
        description: "description",
        price: 2000,
        imageUrl:
            "https://images.unsplash.com/photo-1623137695111-697d0b907f57?ixid="
            "MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ProductModel(
        id: 'id4',
        title: 'PURPLE Shirt',
        description: "description",
        price: 2000,
        imageUrl:
            "https://images.unsplash.com/photo-1623133106725-1e3d77acb7f9?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ];

  List<ProductModel> get items {
    // return _items.toList();
    return [..._items];
  }

  List<ProductModel> get favItems {
    return _items.where((product) => product.isFavourite).toList();
  }

  ProductModel selectedItem(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void addProducts() {
    notifyListeners();
  }
}
