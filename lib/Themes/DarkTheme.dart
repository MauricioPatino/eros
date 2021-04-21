import 'package:flutter/material.dart';

Color primaryColor = Colors.deepPurple;
Color backgroundColor = Colors.black;
Color accentColor = Color.fromARGB(255, 232, 191, 243);

ThemeData darkTheme = ThemeData(
  primaryColor: primaryColor,
  accentColor: accentColor,
  backgroundColor: backgroundColor,
  dialogBackgroundColor: Colors.white,
  scaffoldBackgroundColor: primaryColor,
  secondaryHeaderColor: Colors.blueGrey,
  buttonTheme: ButtonThemeData(
    buttonColor: primaryColor,
    height: 60,
    textTheme: ButtonTextTheme.accent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'Coolvetica',
      color: Colors.black,
    ),
    headline6: TextStyle(
      fontFamily: 'Coolvetica',
      color: Colors.black,
    ),
    overline: TextStyle(
      fontFamily: 'Coolvetica',
      color: Colors.grey,
    ),
    subtitle2: TextStyle(
      fontFamily: 'Coolvetica',
      color: Colors.black,
    ),
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: primaryColor,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: backgroundColor,
    foregroundColor: primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      side: BorderSide(
        color: primaryColor,
        width: 4,
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    color: primaryColor,
  ),
);