import 'package:eros/Constants/Routes.dart';
import 'package:eros/Interfaces/LoginViewInterface.dart';
import 'package:flutter/material.dart';
import 'package:neon/neon.dart';


class LoginView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> with SingleTickerProviderStateMixin implements LoginViewInterface{

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync:this, duration: Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation =  Tween(begin: 2.0,end: 15.0).animate(_animationController)..addListener((){
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/brick_wall.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/img/logo_sin_text.png',
                width: 0.55 * MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 30,
                  top: 50,
                ),
                child: Container(
                  height: 300,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Theme.of(context).backgroundColor.withOpacity(0.01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(1),
                          child:
                            ListTile(
                              leading: Image( image: AssetImage('assets/img/PERSONITA.png')),
                              title:
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blueAccent,
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                     boxShadow: [BoxShadow(
                                       color: Colors.blue.withAlpha(225),
                                         blurRadius: 90.0,
                                         offset: const Offset(0.0, 0.0,),
                                         spreadRadius: _animation.value,
                                    )]
                                  ),
                                  child: TextField(
                                    style: Theme.of(context).textTheme.headline6,
                                    // decoration: InputDecoration(
                                    //   enabledBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.all(Radius.circular(30)),
                                    //     borderSide: new BorderSide(color: Colors.blueAccent),
                                    //   ),
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child:
                          ListTile(
                            leading: Image(image: AssetImage('assets/img/llave.png')),
                            title:
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                      style: BorderStyle.solid,
                                      width: 2.0,
                                    ),
                                      borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: TextField(
                                    style: Theme.of(context).textTheme.headline6,
                                    // decoration: InputDecoration(
                                    //   border: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.all(Radius.circular(30)),
                                    //     borderSide: new BorderSide(color: Colors.blueAccent),
                                    //   ),
                                    // ),
                                  ),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
                width: 100,
                left: 50,
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: ListTile(
                    leading: Image(image: AssetImage('assets/img/PERSONITA.png')),
                    onTap: () => Navigator.of(context).pushNamed(ROUTE_HOME),
                  ),
                ),
            ),
          Positioned(
            bottom: 10,
            width: 100,
            right: 50,
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: ListTile(
                leading: Image(image: AssetImage('assets/img/question.png')),
                onTap: () => Navigator.of(context).pushNamed(ROUTE_HOME),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void logInClick(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}

// @override
// void dispose() {
//   controller.dispose();
//   super.dispose();
// }
