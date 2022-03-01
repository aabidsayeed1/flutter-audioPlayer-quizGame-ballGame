import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
class AudioPlayer extends StatefulWidget {
  
  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  final player = AudioCache();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AudioPlayer')),
        body: Container(
          width: double.infinity,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,  
            children: [
              buildKey(noteNumber: 1,color: Colors.red),
               buildKey(noteNumber: 2,color: Colors.green),
                buildKey(noteNumber: 3,color: Colors.purple),
                 buildKey(noteNumber: 4,color: Colors.yellow),
                  buildKey(noteNumber: 5,color: Colors.orange),
                   buildKey(noteNumber: 6,color: Colors.blueAccent),
                    buildKey(noteNumber: 7,color: Colors.brown),
             
           
            
           
            ],
          ),
        ),
      
    );
  }

  Expanded buildKey({int noteNumber,Color color}) {
    
    return Expanded(
              
              child: Container(
                
                decoration: BoxDecoration(
                  color: color
                ),
                child: MaterialButton(onPressed: (){
                  
                  player.play('note$noteNumber.wav');
                },
              
              ),
            ));
  }
}