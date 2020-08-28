import 'package:flutter/material.dart';
import 'package:flutter_othello_game/constants.dart';
import 'package:flutter_othello_game/model/othello_game.dart';
import 'package:flutter_othello_game/widgets/board.dart';
import 'package:provider/provider.dart';

class CreateQuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("クイズ作成"),
      ),
      body: Column(children: <Widget>[
      Container(
        color: Color(0xFF206020),
        child: Board(),
      ),
      Center(
        child: Text('Othello Board'),
      ),
      RestButton(context),
      RegisterButton(context)
    ],
    ));
  }

  Widget RestButton(BuildContext context) {
    return RaisedButton(
      child: Text("Reset"),
      color: Colors.deepOrange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: () => context.read<OthelloGame>().resetGame(),
    );
  }

  Widget RegisterButton(BuildContext context) {
    return RaisedButton(
      child: Text("登録"),
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: () => {}, // not implemented yet.
    );
  }
}