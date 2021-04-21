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
              Image.asset('assets/img/eros_light.png',
                width: 0.8 * MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 30,
                ),
                child: Container(
                  height: 300,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Theme.of(context).backgroundColor.withOpacity(0.2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            style: Theme.of(context).textTheme.headline6,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.6),
                              prefixIcon: Icon(Icons.person),
                              hintText: 'Correo Electrónico',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            style: Theme.of(context).textTheme.title,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.6),
                              prefixIcon: Icon(Icons.vpn_key),
                              hintText: 'Contraseña',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              icon: Icon(Icons.lock),
                              onPressed: () => this.logInClick(context),
                              label: Text('Ingresar',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Coolvetica',
                                ),
                              ),
                            ),
                          ),
                        ),
                        CheckboxListTile(
                          title: Text('Recuerdame',
                            style: TextStyle(
                              color: Theme.of(context).dialogBackgroundColor,
                            ),
                          ),
                          onChanged: (value) => print('CHANGED'),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: Text('REGISTRARME',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 4,
                  color: Theme.of(context).dialogBackgroundColor,
                )
              ),
            ),
            bottom: 10,
            right: 10,
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