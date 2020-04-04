import 'package:flutter/material.dart';

import './answer.dart';
import './quastion.dart';


class Quiz extends StatelessWidget {

  final List<Map<String , Object>> questionArray;
  final int qInd;
  final Function qFunction;

  Quiz({@required this.questionArray,@required this.qInd,@required this.qFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Quastion(questionArray[qInd]['questionText']),
        ...(questionArray[qInd]['answer'] as List<Map<String , Object>>).map((answer) {
          return Answer(answer['text'], ()=> qFunction(answer['score']));
        }).toList()

      ],
    );

  }
}
