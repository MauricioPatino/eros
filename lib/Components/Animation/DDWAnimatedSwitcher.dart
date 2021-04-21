import 'package:flutter/cupertino.dart';

class DDWAnimatedSwitcher extends StatefulWidget{
  final List<Widget> states;
  final AnimatedSwitcherController controller;
  final int initialIndex;
  DDWAnimatedSwitcher({ key: Key, @required this.states, @required this.controller, this.initialIndex = 0 });

  @override
  State<StatefulWidget> createState() => DDWAnimatedSwitcherState();
}

class DDWAnimatedSwitcherState extends State<DDWAnimatedSwitcher>{
  Widget _actualState;
  int _actualIndex = 0;
  VoidCallback _listener;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      child: _actualState,
      transitionBuilder: (Widget child, Animation<double> animation){
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }


  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _listener = (){
      if(this._actualIndex != widget.controller.index){
        this._actualIndex = widget.controller.index;
        setState(() {
          this._actualState = widget.states[widget.controller.index];
        });
      }
    };
    _actualIndex = widget.initialIndex;
    this._actualState = widget.states[_actualIndex];
    widget.controller.addListener(_listener);
  }
}

class AnimatedSwitcherController extends ChangeNotifier{
  int index = 0;

  void changeTo(int index){
    this.index = index;
    notifyListeners();
  }
}