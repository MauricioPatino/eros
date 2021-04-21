import 'package:flutter/material.dart';
import 'package:eros/bloc/cart_items.dart';

class CartView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Checkout')
      ),
      body: Container(
        child: StreamBuilder(
          stream: bloc.getStream,
          initialData: bloc.allItems,
          builder: (context, snapshot) {
            return snapshot.data['cart items'].length > 0
                ? Column(
              children: <Widget>[
                Expanded(child: checkoutListBuilder(snapshot)),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Checkout"),
                  style: ElevatedButton.styleFrom(primary: Colors.purple),
                ),
                SizedBox(height: 40)
              ],
            )
                : Center(child:Text("You haven't taken any item yet"));
          },
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/brick_wall.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

Widget checkoutListBuilder(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data["cart items"].length,
    itemBuilder: (BuildContext context, i) {
      final cartList = snapshot.data["cart items"];
      return ListTile(
        leading: Image(
          image: AssetImage("${cartList[i]['image']}"),
        ),
        title: Text(cartList[i]['name'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
        subtitle: Text("\$${cartList[i]['price']}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
        trailing: IconButton(
          color: Colors.green,
          icon: Icon(Icons.remove_shopping_cart),
          onPressed: () {
            bloc.removeFromCart(cartList[i]);
          },
        ),
        onTap: () {},
      );
    },
  );
}

