
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {

  final String _textString;
  final Function _handler;

  AdaptiveFlatButton(this._textString, this._handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoButton(
      onPressed: _handler,
      child: Text(
        _textString,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    ) :
    FlatButton(
      onPressed: _handler,
      child: Text(
        _textString,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
