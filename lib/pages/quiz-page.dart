import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class QuizQA extends StatefulWidget {
  @override
  _QuizQAState createState() => _QuizQAState();
}

class _QuizQAState extends State<QuizQA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      );
  }
}


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
   
   List <Widget> scoreKeeper = [];
   
   void checkAnswer(bool userPicked){
       //The user picked true.
                bool correctAnswer = quizBrain.getCorrectAnswer();
                

              setState(() {
                 if(quizBrain.isFinished()==true){
               Alert(context: context,
               title: 'Finished',
               desc: 'You\'ve reached the end of the quiz.',
               ).show();
              quizBrain.reset();
              scoreKeeper=[];
             }else{
               if (userPicked==correctAnswer){
                 scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
                }else{
                 scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
                }
                quizBrain.nextQuestion();
             }  
              });

   }

   QuizBrain quizBrain = QuizBrain();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionNumber(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
            
              checkAnswer(true); 
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
            
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
         SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Row(
             children: scoreKeeper,
           ),
         )
      ],
    );
  }
}

class Question {
  String textQuestions;
  bool answers;
  Question({String q ,bool a}){
    textQuestions=q;
    answers=a;
  }
}



class QuizBrain {
  int _questionNumber = 0;
   List<Question> _questionBank =[
    Question(q: 'Some cats are actually allergic to humans', a: true),
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(q: 'Approximately one quarter of human bones are in the feet.', a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Question(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
    Question(
        q: 'No piece of square dry paper can be folded in half more than 7 times.',
        a: false),
    Question(
        q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a: true),
    Question(
        q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false),
    Question(
        q: 'The total surface area of two human lungs is approximately 70 square metres.',
        a: true),
    Question(q: 'Google was originally called \"Backrub\".', a: true),
    Question(
        q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true),
    Question(
        q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: true),
  ];
  void nextQuestion(){
    if (_questionNumber < _questionBank.length-1){
      _questionNumber++;
    }
  }

  String getQuestionNumber(){
    return _questionBank[_questionNumber].textQuestions;
  }

  bool getCorrectAnswer (){
    return _questionBank[_questionNumber].answers;
  }
   bool isFinished (){
    if(_questionNumber == _questionBank.length-1){
    print('trueee');
     return true;
     
    }else{
      return false;
    }
  }
  void reset(){
      _questionNumber=0;
    
  }
  
  
}