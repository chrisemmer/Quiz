import 'package:Quiz/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

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
      'questionText': ' Cual es tu color preferido?',
      'answers': [
        {'text': 'Negro', 'score': 10},
        {'text': 'Rojo', 'score': 7},
        {'text': 'Verde', 'score': 5},
        {'text': 'Blanco', 'score': 1}
      ],
    },
    {
      'questionText': 'Cual es tu animal favorito?',
      'answers': [
        {'text': 'Conejo', 'score': 1},
        {'text': 'Vivora', 'score': 10},
        {'text': 'Elefante', 'score': 5},
        {'text': 'Leon', 'score': 7}
      ],
    },
    {
      'questionText': 'Cual es tu Programa Favorito?',
      'answers': [
        {'text': 'PS', 'score': 1},
        {'text': 'Cs', 'score': 3},
        {'text': 'Dart', 'score': 7},
        {'text': 'Flutter', 'score': 10}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score; // totalscore += score; //-> es lo mismo
    setState(
      () {
        _questionIndex = _questionIndex + 1;
      },
    );
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('Tenemos mas preguntas!');
    } else {
      print('No hay mas preguntas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Primer Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
