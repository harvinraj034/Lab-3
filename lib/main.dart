import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
   final _questions = const [
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 20},
        {'text': 'Green', 'score' : 30},
        {'text': 'White', 'score' : 40},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 20},
        {'text': 'Elephant', 'score' : 30},
        {'text': 'Lion', 'score' : 40},
   ],
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': [
          {'text': 'Ryan', 'score': 10},
          {'text': 'Toast', 'score': 20},
          {'text': 'Rae', 'score' : 30},
          {'text': 'Tina', 'score' : 40},
    ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

   void _resetQuiz(){
     setState(() {
       _questionIndex=0;
       _totalScore=0;
     });
   }

  void _answerQuestion(int score){
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Third Lab'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}