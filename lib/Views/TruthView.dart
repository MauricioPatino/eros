// import 'dart:async';

import 'package:eros/Constants/Routes.dart';
import 'package:flutter/material.dart';

class TruthView extends StatelessWidget {


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
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/img/logo_sin_text.png', fit: BoxFit.cover)
          ],
        ),
      ),
    );
  }

}