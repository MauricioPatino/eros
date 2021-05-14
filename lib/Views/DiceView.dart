import 'package:eros/Constants/Routes.dart';
import 'package:flutter/material.dart';
import "package:dice_tower/dice_tower.dart";
import 'package:eros/data/button.dart';
import 'package:eros/data/form_text';
import 'package:eros/data/form_model.dart';

class DiceView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DiceViewState();
  }
}

class DiceViewState extends State<DiceView>{
  // uniquely identifies a Form
  final _formKey = GlobalKey<FormState>();

  // holds the form data for access
   final model = FormModel();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: GestureDetector(
          onVerticalDragEnd: (DragEndDetails details) {
            if (details.velocity.pixelsPerSecond.dy > 0)
              Navigator.of(context).pushNamed(ROUTE_GAME);
            else
              Navigator.of(context).pushNamed(ROUTE_GAME);
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
          Positioned.fill(
              child:Padding(
                padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 10.0),
                child: Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                      MyFormTextField(
                      isObscure: false,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelStyle: TextStyle(color: Colors.blue),
                          hintStyle: TextStyle(color: Colors.black),
                          labelText: "DICE ONE", hintText: "PUT A CHALLENGE"),

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a sexy challenge';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        model.password = value;
                      },
                    ),
                        FormSubmitButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, otherwise false.
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              print(model);

                              ScaffoldMessenger.of(_formKey.currentContext).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                            }
                          },
                        ),
                  ]),
                )),
              ),
          )],
      );
    }
  }


