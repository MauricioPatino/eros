import 'package:flutter/material.dart';

class FadeRouteTransition<T> extends PageRouteBuilder<T> {

  final Widget widget;
  FadeRouteTransition({this.widget})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return new FadeTransition(
        opacity: Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(animation),
        child: child,
      );
    },
  );
}