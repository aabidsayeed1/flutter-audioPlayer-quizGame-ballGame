import 'package:flutter/material.dart';
import 'dart:math';

import 'pages/audio-player.dart';
import 'pages/ball-page.dart';
import 'pages/quiz-page.dart';
// dice setstate by aabid
//instagram @codewithkashmir
void main() {
  return runApp(
    MaterialApp(
      home: QuizQA()
      
      
      // Scaffold(
      //   backgroundColor: Colors.red,
      //   appBar: AppBar(
      //     title: Text('Dicee'),
      //     backgroundColor: Colors.red,
      //   ),
      //   body: DicePage(),
      // ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceLeft = 1;
  int diceRight = 1;
  void changeDice(){
    setState(() {
            diceLeft = Random().nextInt(6)+1;
            diceRight= Random().nextInt(6)+1;
          });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: [
        Expanded(
          child: FlatButton(
        onPressed: (){
          setState(() {
            changeDice();
          });
        },
        child: Image.asset('images/dice$diceLeft.png'),
        ),),
           Expanded(
          child: FlatButton(
        onPressed: (){
          setState(() {
            changeDice();
          });
        },
        child: Image.asset('images/dice$diceRight.png'),
        ),),
      ]),
    );
  }
}
