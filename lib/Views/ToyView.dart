// import 'dart:async';

import 'package:eros/Constants/Routes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ToyView extends StatelessWidget {
  final List toys = [
    {"name": "Celeste", "toy": "assets/img/toys/celeste.png"},
    {"name": "Celeste2", "toy": "assets/img/toys/celeste2.png"},
    {"name": "Celeste3", "toy": "assets/img/toys/celeste3.png"},
    {"name": "Celeste4", "toy": "assets/img/toys/rosa.png"},
    {"name": "Celeste5", "toy": "assets/img/toys/rosa2.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details){
          if(details.velocity.pixelsPerSecond.dy > 0)
            Navigator.of(context).pushNamed(ROUTE_HOME);
          else
            Navigator.of(context).pushNamed(ROUTE_HOME);
        },
          child: buildBody(context),
        ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image(
              image: AssetImage('assets/img/brick_wall.png'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Image(
                    image: AssetImage('assets/img/JUGUETES.png'), width: 150, height: 100,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Image(
                    image: AssetImage('assets/img/POPERS.png'), width: 150, height: 100,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Image(
                    image: AssetImage('assets/img/LUBRICANTE.png'), width: 150, height: 100,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Image(
                    image: AssetImage('assets/img/condones.png'), width: 150, height: 100,),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 180,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 400),
                    height: 100,

                  ),
                  items: toys.map((i) {
                    return GridTile(
                      child: Image(image: AssetImage(i["toy"])),
                      // footer: Container(
                      //     padding: EdgeInsets.all(10),
                      //     color: Colors.transparent,
                      //     child: Text(
                      //       i["name"],
                      //       style: TextStyle(color: Colors.white, fontSize: 20),
                      //       textAlign: TextAlign.right,
                      //     )), THIS IS FOR TEXT FOR EACH ITEM
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ]
    );
  }

  }

