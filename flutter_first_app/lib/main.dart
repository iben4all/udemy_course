import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _totScore = 0;
  static const _questionArray = [
    {
      'questionText': 'What\'s your favurite color?',
      'answer': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Green', 'score': 4},
        {'text': 'red', 'score': 7},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favurite animal?',
      'answer':
      [
        {'text': 'Cat', 'score': 6},
        {'text': 'Dog', 'score': 3},
        {'text': 'Snake', 'score': 10},
        {'text': 'Rabbit', 'score': 1},
      ],
    },
    {
      'questionText': 'Who iss your favurite instructor?',
      'answer':
      [
        {'text': 'Max', 'score': 6},
        {'text': 'Ben', 'score': 3},
        {'text': 'David', 'score': 10},
        {'text': 'Greg', 'score': 1},
      ],
    },
  ];

  var _qInd = 0;

  void _startGame(){
    setState(() {
      _qInd = 0;
      _totScore = 0;
    });
  }

  void _answerQuestion(int curScore) {

    setState(() {
      _qInd++;
      _totScore = _totScore+ curScore;
    });
    print('Answer chosen' + _qInd.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _qInd < _questionArray.length
            ? Quiz(
                questionArray: _questionArray,
                qInd: _qInd,
                qFunction: _answerQuestion,
              )
            : Results(_totScore, _startGame),
      ),
    );
  }
}
