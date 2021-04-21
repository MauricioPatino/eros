import 'dart:async';

import 'package:eros/Components/Animation/DDWAnimatedSwitcher.dart';
import 'package:eros/Components/Animation/FadeLoopComponent.dart';
import 'package:eros/Components/Animation/ScaleLoopComponent.dart';
import 'package:flutter/material.dart';

class GameView extends StatelessWidget{
  final AnimatedSwitcherController buttonController = AnimatedSwitcherController();
  bool truth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context),
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details){
          if(details.velocity.pixelsPerSecond.dy > 0)
            Navigator.of(context).pop();
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

  Widget buildAppBar(BuildContext context){
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back,
          size: 40,
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
    );
  }

  Widget buildBody(BuildContext context){
    WidgetsBinding.instance.addPostFrameCallback((_){
      Timer.periodic(Duration(seconds: 10), (Timer t){
        this.truth = !this.truth;
        if(this.truth)
          this.buttonController.changeTo(0);
        else
          this.buttonController.changeTo(1);
      });
    });

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeLoopComponent(
              duration: Duration(
                seconds: 1,
              ),
              beginOpacity: 0.3,
              endOpacity: 1,
              child: Text('Press to Play',
                style: TextStyle(
                  color: Theme.of(context).dialogBackgroundColor,
                  fontSize: 20,
                ),
              ),
            ),
            ScaleLoopComponent(
              beginScale: 0.90,
              endScale: 1,
              duration: Duration(
                seconds: 1,
              ),
              child: Image.asset('assets/img/eros_light.png',width: 0.9 * MediaQuery.of(context).size.width,),
            ),
            DDWAnimatedSwitcher(
              controller: this.buttonController,
              states: <Widget>[
                SizedBox(
                  key: UniqueKey(),
                  width: 0.7 * MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    onPressed: () => print('Truth'),
                    child: Text('Truth',
                      style: TextStyle(
                        color: Theme.of(context).dialogBackgroundColor,
                        fontSize: 24,
                        fontFamily: 'Coolvetica',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  key: UniqueKey(),
                  width: 0.7 * MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    onPressed: () => print('Dare'),
                    child: Text('Dare',
                      style: TextStyle(
                        color: Theme.of(context).dialogBackgroundColor,
                        fontSize: 24,
                        fontFamily: 'Coolvetica',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}