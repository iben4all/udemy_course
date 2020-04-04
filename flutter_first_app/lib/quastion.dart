import 'package:flutter/material.dart';

class Quastion extends StatelessWidget {
  final String quastionString;

  Quastion(this.quastionString);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        quastionString,
        style: TextStyle(
          fontSize: 28,color: Colors.pink),
          textAlign: TextAlign.center,
      ),
    );
  }
}
