import 'package:flutter/cupertino.dart';

class ScaleLoopComponent extends StatefulWidget{
  final Widget child;
  final double beginScale;
  final double endScale;
  final Duration duration;
  final Duration reverseDuration;


  ScaleLoopComponent({
    key: Key,
    @required this.child,
    this.beginScale = 0.6,
    this.endScale = 1.0,
    this.duration = const Duration(
      milliseconds: 500,
    ),
    this.reverseDuration = const Duration(
      milliseconds: 500,
    ),
  });

  @override
  State<StatefulWidget> createState() => _ScaleLoopComponent();
}

class _ScaleLoopComponent extends State<ScaleLoopComponent> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      reverseDuration: widget.reverseDuration,
      duration: widget.duration,
    )..repeat(
      reverse: true,
    );
    _animation = Tween(
      begin: widget.beginScale,
      end: widget.endScale
    ).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _animation,
    child: widget.child,
    builder: (context, child){
      return Transform.scale(
        scale: _animation.value,
        child: child,
      );
    },
  );

}