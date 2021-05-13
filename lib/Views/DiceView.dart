import 'package:eros/Constants/Routes.dart';
import 'package:flutter/material.dart';
import "package:dice_tower/dice_tower.dart";

// void main(List<String> arguments) async {
  // Defining dice pools.
//   Dice d1 = Dice(12);
//   Dice d2 = Dice(12, numberOfDice: 2);
//   Dice d3 = Dice(10, modifier: -2);
//   Dice d4 = Dice(8, modifier: 1, numberOfDice: 3);
//   Dice d5 = Dice(4, modifier: -10, numberOfDice: 20, title: "Lemons & Limes");
//
//   // Rolling a single dice pool.
//   RollResult r1 = Dnd5eRuleset.roll([d1]);
//
//   // Rolling x dice pool.
//   RollResult r2 = Dnd5eRuleset.roll([d1, d2, d3, d4, d5]);
//
//   // Pretty printing results.
//   print(
//       "Title: ${r1.title}\nSum: ${Dnd5eRuleset.prettyPrintResult(r1)}\nRoll Details: ${Dnd5eRuleset.prettyPrintResultDetails(r1)}");
//  }

// class MyCustomFormState{
//   String _dice1;
//   String _dice2;
//   String _dice3;
//   String _dice4;
//   String _dice5;
//   String _dice6;
//   // final _formKey = GlobalKey<FormState>();
//   final GlobalKey <FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget _buildDice1(BuildContext context) {
//     return null;
//   }
//   Widget _buildDice2(BuildContext context) {
//     return null;
//   }
//   Widget _buildDice3(BuildContext context) {
//     return null;
//   }
//   Widget _buildDice4(BuildContext context) {
//     return null;
//   }
// }


class DiceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INPUT DICE SETTING',
      home: DiceForm(),
    );
  }
}
  class DiceForm extends StatefulWidget{
    @override
      _MyFormStateCustom createState() => _MyFormStateCustom();
  }

  class _MyFormStateCustom extends State<DiceForm> {
    // String dice1 = '';
    // String text = "No Value Entered";
    //
    // void _setText() {
    //   setState(() {
    //     text = dice1;
    //   });
    // }
    // final nameEditingController = TextEditingController();
    final myController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myController.dispose();
      super.dispose();
    }



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
            child: SafeArea(
              minimum: const EdgeInsets.only(top: 40.0),
              child: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                            controller: myController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Dice1',
                            ))),
                    // child: TextField(
                    // decoration: InputDecoration(labelText: 'Title', focusColor: Colors.white, border: InputBorder.none),
                    //   onChanged: (value) => dice1 = value,
                    // ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                 ElevatedButton(onPressed: onPressed, child: child),
                  SizedBox(height: 20),
                  Text(myController.text)
                ],
              ),
            ),
          ),
          // Positioned.fill(
          //   child: SafeArea(
          //     minimum: const EdgeInsets.only(top: 100.0, left: 40.0),
          //     child: SizedBox(
          //       width: 100,
          //       child: Text(
          //         dice1??'No value',
          //         style: TextStyle(fontSize: 30, color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),

        ],
      );
    }
  }
  void setState(Null Function() param0) {}

