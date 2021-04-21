import 'package:eros/Components/Animation/FadeLoopComponent.dart';
import 'package:eros/Components/Animation/ScaleLoopComponent.dart';
import 'package:eros/Constants/Routes.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget{
  final games = [
    { 'icon': Icons.people_rounded, 'name': 'TRUTH OR DARE', 'path': ROUTE_GAME},
    { 'icon': Icons.vibration, 'name': 'VIBRATOR', 'path': ROUTE_VIBRATOR },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details){
          if(details.velocity.pixelsPerSecond.dx > 0)
            Navigator.of(context).pushNamed(ROUTE_SETTINGS);
          else
            Navigator.of(context).pushNamed(ROUTE_SHOP);
        },
        // onVerticalDragEnd: (DragEndDetails details){
        //   if(details.velocity.pixelsPerSecond.dy > 0)
        //     print('DRAG DOWN');
        //   else
        //     Navigator.of(context).pushNamed(ROUTE_GAME);
        // },
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

  Widget buildAppBar(BuildContext context){
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: EdgeInsets.only(
          left: 20,
        ),
        child: IconButton(
          onPressed: () => Navigator.of(context).pushNamed(ROUTE_SETTINGS),
          icon: Icon(Icons.menu,
            size: 30,
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            right: 20,
          ),
          child: IconButton(
            onPressed: () => Navigator.of(context).pushNamed(ROUTE_SHOP),
            icon: Icon(Icons.store,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

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
                    top: 90,
                  ),
                  child: Container(
                    child: Image.asset('assets/img/eros_light.png',width: 1.0 * MediaQuery.of(context).size.width),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 0.8 * MediaQuery.of(context).size.width),
                itemCount: 2,
                itemBuilder: (BuildContext context, int i){
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    color: Theme.of(context).dialogBackgroundColor.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ListTile(
                      onTap: () => Navigator.of(context).pushNamed(this.games[i]['path']),
                      leading: Icon(this.games[i]['icon'],
                        size: 50,
                        color: Theme.of(context).dialogBackgroundColor,
                      ),
                      title: Text(this.games[i]['name'],
                        style: TextStyle(color: Theme.of(context).dialogBackgroundColor),
                      ),
                    ),
                  );
                },
              )
          ),
          // Positioned(
          //   bottom: 10,
          //   left: MediaQuery.of(context).size.width / 4,
          //   child: Column(
          //     children: <Widget>[
          //       FadeLoopComponent(
          //         beginOpacity: 0,
          //         endOpacity: 1,
          //         duration: Duration(
          //           seconds: 2,
          //         ),
          //         child: Text('Desliza para Jugar',
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 16
          //           ),
          //         ),
          //       ),
          //       Container(
          //         height: 12,
          //         width: MediaQuery.of(context).size.width / 2,
          //         child: Card(),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}