import 'package:eros/Constants/Routes.dart';
import 'package:eros/data/challenges.dart';
import 'package:eros/data/form_text.dart';
import 'package:flutter/material.dart';
import 'package:eros/data/button.dart';
import 'package:eros/data/form_text.dart';
import 'package:provider/provider.dart';

class DiceView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DiceViewState();
  }
}

class DiceViewState extends State<DiceView>{
  // uniquely identifies a Form
  final _formKey = GlobalKey<FormState>();

  final diceNums = [1,2,3,4,5,6];
  final diceStr = ['ONE', 'TWO', 'THREE', 'FOUR', 'FIVE', 'SIX'];

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
                        ...diceNums.map((diceNum) => ChallengeTextField (
                          index: diceNum,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(color: Colors.blue),
                              hintStyle: TextStyle(color: Colors.black),
                              labelText: "DICE ${diceStr[diceNum-1]}", hintText: "PUT A CHALLENGE"),
                        )).toList(),
                      FormSubmitButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();

                            ScaffoldMessenger.of(_formKey.currentContext).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                        },
                    ),
                        // Consumer<ChallengesModel>(builder: (context, challenges, child) =>
                        //     Text("password = '${challenges.getChallenge(1)}'", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), ))
                  ]),
                )),
              ),
          )],
      );
    }
  }


