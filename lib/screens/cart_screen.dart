import 'package:bloc_sample/blocs/cart_bloc.dart';
import 'package:bloc_sample/models/cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet"),
      ),
      body: StreamBuilder(
        stream: cartBloc.getStream,
        initialData: cartBloc.getCart(),
        builder: (context, snapshot) {
          List<Cart> cart= snapshot.data as List<Cart>;
          return snapshot.hasData?buildCartItem(cart):Text("Ürün yok");
        },
      ),
    );
  }

 Widget buildCartItem(List<Cart> cart) {
    return ListView.builder(itemCount: cart.length,itemBuilder: (context, index) {
      return ListTile(
        title: Text(cart[index].product.name),
        subtitle: Text(cart[index].product.price.toString()),
        trailing: IconButton(
          icon: Icon(Icons.remove_shopping_cart),
          onPressed: () {
            cartBloc.removeFromCart(cart[index]);
          },
        ),
      );
    },);
 }

}