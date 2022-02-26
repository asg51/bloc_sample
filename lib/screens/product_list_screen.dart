import 'package:bloc_sample/blocs/cart_bloc.dart';
import 'package:bloc_sample/blocs/product_bloc.dart';
import 'package:bloc_sample/models/cart.dart';
import 'package:bloc_sample/models/product.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cart");
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: buildProductList(),
    );
  }

  Widget buildProductList() {
    return StreamBuilder(
      builder: (context, snapshot) {
        List<Product> products = snapshot.data as List<Product>;
        return products.length > 0
            ? buildProductListItem(products)
            : Center(
                child: Text("Data Yok"),
              );
      },
      initialData: productBloc.getAll(),
      stream: productBloc.getStream,
    );
  }

  buildProductListItem(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final list = products;
        return ListTile(
          title: Text(list[index].name),
          subtitle: Text(list[index].price.toString()),
          leading: IconButton(
            onPressed: () {
              cartBloc.addToCart(Cart(list[index], 1));
            },
            icon: Icon(Icons.add_shopping_cart),
          ),
        );
      },
    );
  }
}
