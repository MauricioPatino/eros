// import 'dart:async';

import 'package:eros/Components/Animation/DDWAnimatedSwitcher.dart';
import 'package:eros/Components/Animation/FadeLoopComponent.dart';
import 'package:eros/Components/Animation/ScaleLoopComponent.dart';
import 'package:eros/Constants/Routes.dart';
import 'package:flutter/material.dart';
import "package:dice_tower/dice_tower.dart";
import 'dart:math' as math;

void main(List<String> arguments) async {
  // Defining dice pools.
  Dice d1 = Dice(12);
  Dice d2 = Dice(12, numberOfDice: 2);
  Dice d3 = Dice(10, modifier: -2);
  Dice d4 = Dice(8, modifier: 1, numberOfDice: 3);
  Dice d5 = Dice(4, modifier: -10, numberOfDice: 20, title: "Lemons & Limes");

  // Rolling a single dice pool.
  RollResult r1 = Dnd5eRuleset.roll([d1]);

  // Rolling x dice pool.
  RollResult r2 = Dnd5eRuleset.roll([d1, d2, d3, d4, d5]);

  // Pretty printing results.
  print(
      "Title: ${r1.title}\nSum: ${Dnd5eRuleset.prettyPrintResult(r1)}\nRoll Details: ${Dnd5eRuleset.prettyPrintResultDetails(r1)}");
}

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
              top: 160,
              right: 100,
              child: InkWell(
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/img/logo_sin_text.png'), width: 200,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Positioned(
                  top: 310,
                  left: 10,
                    child: Transform.rotate(
                      angle: -math.pi/4,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pushNamed(ROUTE_DICE),
                            child: Image(
                                image: AssetImage('assets/img/joystick.png'), width: 400),
                          ),

                        ],
                      ),
                    ),
              ),
            ),
            Positioned(
              top: 450,
              left: 150,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.bottom,
                children: [
                  Image(
                    image: AssetImage('assets/img/JUEGOS.png'), width: 200),
                ],

              )
              ),
          ]
      );
    }
}