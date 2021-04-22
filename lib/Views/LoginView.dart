import 'package:eros/Constants/Routes.dart';
import 'package:eros/Interfaces/LoginViewInterface.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> implements LoginViewInterface{
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
                    color: Theme.of(context).backgroundColor.withOpacity(0.111),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(1),
                          child:
                            ListTile(
                              leading: Image( image: AssetImage('assets/img/PERSONITA.png')),
                              title:
                                TextField(
                                  style: Theme.of(context).textTheme.headline6,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.6),
                                    hintText: 'Username or email',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
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
                                TextField(
                                  style: Theme.of(context).textTheme.title,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.6),
                                    hintText: 'Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
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
                leading: Image(image: AssetImage('assets/img/PERSONITA.png')),
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