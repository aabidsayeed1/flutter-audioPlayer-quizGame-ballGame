import 'dart:math';

import 'package:flutter/material.dart';

class BallPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ball')),
      body: Ball(),
    );
  }
}
class Ball extends StatefulWidget {
 

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber=1;
  @override
  Widget build(BuildContext context) {
    return Center(
     child: Row(
      children: [
         Expanded(
           child: FlatButton(
              child: Image.asset('images/ball$ballNumber.png'),
             onPressed: (){
              setState(() {
                 ballNumber=Random().nextInt(5)+1;
              });
               
             },
            
             ),
             ),
      ],
     ),
      
    );
  }
}