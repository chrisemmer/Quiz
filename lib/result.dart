import 'package:flutter/material.dart';

import './main.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'Sos Genial e inocente';
    } else if (resultScore <= 12) {
      resultText = 'Bastante agradable';
    } else if (resultScore <= 16) {
      resultText = 'Bastante extraño...';
    } else {
      resultText = 'Uff.. bastante malo!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text(
              'Reiniciar',
            ),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
