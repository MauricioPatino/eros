import 'package:flutter/material.dart';

class VibratorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/brick_wall.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: buildBody(context),
      ),
    );
  }

  Widget buildAppBar(BuildContext context){
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text("Vibrator"),
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back_ios),
        tooltip: ("Go back"),
      ),

    );
  }

  Widget buildBody(BuildContext context) {}
}
