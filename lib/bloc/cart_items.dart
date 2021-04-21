/// The [dart:async] is neccessary for using streams
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class CartItemsBloc {
  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  final cartStreamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => cartStreamController.stream;

  final Map allItems = {
    'shop items': [
      {'name': 'Condom 1', 'price': 10, 'id': 1, 'image':'assets/img/condones.png'},
      {'name': 'Lubricant', 'price': 15, 'id': 2, 'image':'assets/img/LUBRICANTE.png'},
      {'name': 'Popper', 'price': 20, 'id': 3, 'image':'assets/img/POPERS.png'},
      {'name': 'Dice', 'price': 5, 'id': 4, 'image':'assets/img/JUEGOS.png'},
      // {'name': 'Toy 1', 'price': 35, 'id': 5, 'image':'assets/img/toys/celeste.png'},
    ],
    'cart items': []
  };

  void addToCart(item) {
    allItems['shop items'].remove(item);
    allItems['cart items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  void removeFromCart(item) {
    allItems['cart items'].remove(item);
    allItems['shop items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  // void getImage(item) {
  //   allItems['shop items'].add(Image);
  // }

  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    cartStreamController.close();
  }
}
final bloc = CartItemsBloc();
