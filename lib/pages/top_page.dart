import 'package:flutter/material.dart';
import 'package:flutter_othello_game/constants.dart';
import 'package:flutter_othello_game/pages/create_quiz_page.dart';
import 'package:flutter_othello_game/widgets/quiz_list.dart';

//
// @description TopPage
class TopPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(appTitle),
      ),
      body: QuizList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WillPopScope(
                  child: CreateQuizPage()
              ),
            )
        )),
    );
  }
}
