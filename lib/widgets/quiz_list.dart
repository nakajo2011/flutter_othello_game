import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_othello_game/widgets/board.dart';

class QuizList extends StatelessWidget {
  QuizList({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          createCard('ブラックスター', 1),
          createCard('絨毯', 1),
          createCard('問題３', 3),
          createCard('問題４', 5),
        ],
      ),
    );
  }

  Card createCard(title, level) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text(levelToStar(level)),
          ),
          Container(
            margin: const EdgeInsets.all(4.0),
            child: Board(width:80, height:80, margin: 3, lineColor: Colors.lightGreen,)
          ),
        ]
      ),
    );
  }

  static int MAX_LEVEL = 5;
  static String BLACK_STAR = '★';
  static String WHITE_STAR = '☆';
  String levelToStar(level) {
    String result = '';
    result += new List.filled(level, BLACK_STAR).join();
    result += new List.filled(MAX_LEVEL - level, WHITE_STAR).join();
    return result;
  }
}