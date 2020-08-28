import 'package:flutter/material.dart';
import 'package:flutter_othello_game/model/othello_game.dart';
import 'package:flutter_othello_game/state/othello_game_state.dart';
import 'package:flutter_othello_game/widgets/board.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Create and provide the bloc.
    MultiProvider(
      providers: [
        StateNotifierProvider<OthelloGame, OthelloGameState>(
          create: (_) => OthelloGame(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
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
              child: Board(),
            ),
            Center(
              child: Text('Othello Board'),
            ),
            RestButton(context)
          ])),
    );
  }

  Widget RestButton(BuildContext context) {
    return RaisedButton(
      child: Text("Reset"),
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: () => context.read<OthelloGame>().resetGame(),
    );
  }
}
