import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/othello_game_bloc.dart';
import 'package:flutter_app/widgets/board.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final OthelloGameBloc bloc = OthelloGameBloc();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to Flutter'),
          ),
          body: Column(children: <Widget>[
            Container(
              color: Color(0xFF206020),
              child: Board(bloc: bloc),),
            Center(
              child: Text('Othello Board'),
            ),
            RestButton()
          ])
      ),
    );
  }

  Widget RestButton() {
    return RaisedButton(
      child: Text("Reset"),
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: () => bloc.resetGame.add(null),
    );
  }
}
