import 'package:flutter/material.dart';
import 'package:flutter_othello_game/constants.dart';
import 'package:flutter_othello_game/model/othello_game.dart';
import 'package:flutter_othello_game/models.dart';
import 'package:flutter_othello_game/pages/top_page.dart';
import 'package:provider/provider.dart';

void main() {
  setup();
  runApp(
    // Create and provide the bloc.
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => OthelloGame())],
      child: MyApp(),
    ),
  );
}

void setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DrawingOthelloDbModel().initializeDB();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: TopPage());
  }
}
