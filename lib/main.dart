import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_othello_game/bloc/othello_game_bloc.dart';
import 'package:flutter_othello_game/widgets/board.dart';

void main() {
  runApp(
    // Create and provide the bloc.
    BlocProvider<OthelloGameBloc>(
      creator: (_context, _bag) => OthelloGameBloc(),
      child: MyApp(),
    ),
  );
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
              child: Board(),),
            Center(
              child: Text('Othello Board'),
            ),
            RestButton(BlocProvider.of<OthelloGameBloc>(context))
          ])
      ),
    );
  }

  Widget RestButton(OthelloGameBloc bloc) {
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
