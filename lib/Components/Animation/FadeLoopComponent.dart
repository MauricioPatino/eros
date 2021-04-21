import 'package:flutter/cupertino.dart';

class FadeLoopComponent extends StatefulWidget{
  final Widget child;
  final double beginOpacity;
  final double endOpacity;
  final Duration duration;
  final Duration reverseDuration;

  FadeLoopComponent({
    key: Key,
    @required this.child,
    this.beginOpacity = 0.0,
    this.endOpacity = 1.0,
    this.duration = const Duration(
      seconds: 1,
    ),
    this.reverseDuration = const Duration(
      seconds: 1,
    ),
  });

  @override
  State<StatefulWidget> createState() => _FadeLoopComponent();
}

class _FadeLoopComponent extends State<FadeLoopComponent> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState(){
    _controller = AnimationController(
      vsync: this,
      reverseDuration: widget.reverseDuration,
      duration: widget.duration,
    )..repeat(
      reverse: true,
    );
    _animation = Tween(
        begin: widget.beginOpacity,
        end: widget.endOpacity
    ).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: _animation,
    child: widget.child,
  );
}