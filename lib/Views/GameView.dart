// import 'dart:async';

import 'package:eros/Constants/Routes.dart';
import 'package:flutter/material.dart';

class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: GestureDetector(
          onVerticalDragEnd: (DragEndDetails details){
            if(details.velocity.pixelsPerSecond.dy > 0)
              Navigator.of(context).pushNamed(ROUTE_HOME);
            else
              Navigator.of(context).pushNamed(ROUTE_HOME);
          },
          child: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/img/brick_wall.png'),
            fit: BoxFit.cover,
              ),
            ),
            child: buildBody(context),
          ),
        ),
      );
  }

  Widget buildBody(BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/img/eros_light.png')
        ],
    );
  }

}