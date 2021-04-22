import 'package:eros/Components/Animation/FadeLoopComponent.dart';
import 'package:eros/Components/Animation/ScaleLoopComponent.dart';
import 'package:eros/Constants/Routes.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(context),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details){
          if(details.velocity.pixelsPerSecond.dx > 0)
            Navigator.of(context).pushNamed(ROUTE_SMOKE);
          else
            Navigator.of(context).pushNamed(ROUTE_TOY);
        },
        onVerticalDragEnd: (DragEndDetails details){
          if(details.velocity.pixelsPerSecond.dy > 0)
            Navigator.of(context).pushNamed(ROUTE_GAME);
          else
            Navigator.of(context).pushNamed(ROUTE_TRUTH);
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/brick_wall.png'),
              fit: BoxFit.cover,
            ),
          ),
          child:buildBody(context),
      ),
      ),
    );
  }

  // Widget buildAppBar(BuildContext context){
  //   return AppBar(
  //     elevation: 0,
  //     backgroundColor: Colors.transparent,
  //     leading: Padding(
  //       padding: EdgeInsets.only(
  //         left: 20,
  //       ),
  //       child: IconButton(
  //         onPressed: () => Navigator.of(context).pushNamed(ROUTE_SETTINGS),
  //         icon: Icon(Icons.menu,
  //           size: 30,
  //         ),
  //       ),
  //     ),
  //     actions: <Widget>[
  //       Padding(
  //         padding: EdgeInsets.only(
  //           right: 20,
  //         ),
  //         child: IconButton(
  //           onPressed: () => Navigator.of(context).pushNamed(ROUTE_SHOP),
  //           icon: Icon(Icons.store,
  //             size: 30,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget buildBody(BuildContext context){
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 200,
                  ),
                  child: Container(
                    child: Image.asset('assets/img/eros_light.png',
                        width: 1.0 * MediaQuery.of(context).size.width,
                        height: 0.5 * MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: MediaQuery.of(context).size.width / 4,
            child: Column(
              children: <Widget>[
                FadeLoopComponent(
                  beginOpacity: 0,
                  endOpacity: 1,
                  duration: Duration(
                    seconds: 2,
                  ),
                  child: Text('Truth or Dare',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),
                  ),
                ),
                Container(
                  height: 12,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Card(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}