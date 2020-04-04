import 'package:flutter/material.dart';

class Results extends StatelessWidget {

  final  int score;
  final Function startGame;
  Results(this.score,this.startGame);

  String get resultsPhrase{

  String textMassage;
  if (score<=8 ){
    textMassage = 'You are awsome and very nice';
  }else if (score<=12 ){
    textMassage = 'You are normal';
  }else if (score<=16 ){
    textMassage = 'You are weird';
  }else{
    textMassage = 'You are so bad';
  }

  return textMassage;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
          'your score is '+ score.toString() ,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
          Text(
            resultsPhrase,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(child: Text('Restart', style: TextStyle(fontSize: 30),),textColor: Colors.purple,onPressed: startGame,)
        ],
      ),
    );
  }
}
