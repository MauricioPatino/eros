import 'package:flutter/foundation.dart';
import 'dart:math';

class ChallengesModel extends ChangeNotifier {
  final Map<int, String> _items = {1 : '', 2: '', 3: '', 4: '', 5: '', 6: ''};
  final _random = new Random();
  var diceNumber;

  void setChallenge(int key, String text) {
    _items[key] = text;
    notifyListeners();
  }

  String getChallenge(int key) {
    return _items[key];
  }

  Map<int, String> get challenges => _items;

  void rollDice() {
    /**
     * Generates a positive random integer uniformly distributed on the range
     * from [min], inclusive, to [max], exclusive.
     */
    int min = 1;
    int max = 7;
    diceNumber = min + _random.nextInt(max - min);
    notifyListeners();
  }

  String getSelectedChallenge() {
    if (diceNumber == null) {
      return '';
    } else {
      return _items[diceNumber];
    }

  }

}