// import 'dart:async';

import 'package:eros/Constants/Routes.dart';
import 'package:flutter/material.dart';

class SmokeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.velocity.pixelsPerSecond.dy > 0)
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
            top: 20,
            right: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/img/eros_letras.png'), width: 200,),
              ],
            ),
          ),
          Positioned(
            top: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/img/chica.png'), width: 200,),
                Image(
                  image: AssetImage('assets/img/vino.png'), width: 200,),
              ],
            ),
          ),
        ]
    );
  }

}
