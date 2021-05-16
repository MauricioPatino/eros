import 'package:eros/data/challenges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChallengeTextField extends StatelessWidget {
  final Function(String) onSaved;
  final InputDecoration decoration;
  final Function(String) validator;
  final int index;

  ChallengeTextField(
      {this.decoration, this.validator, this.onSaved, this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChallengesModel>(
      builder: (context, challenges, child) => TextFormField(
        obscureText: false,
        decoration: decoration,
        // validator: validator,
        // onSaved: onSaved,
        initialValue: challenges.getChallenge(index),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter a sexy challenge';
          }
          return null;
        },
        onSaved: (value) {
          var challenges = context.read<ChallengesModel>();
          challenges.setChallenge(index, value);
        },
      ),
    );
  }
}