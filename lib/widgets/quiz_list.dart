import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_othello_game/model/drawing_othello_app.dart';
import 'package:flutter_othello_game/pages/create_quiz_page.dart';
import 'package:flutter_othello_game/widgets/board/view_board.dart';

class QuizList extends StatelessWidget {
  QuizList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = new List();
    DrawingOthelloApp quizApp = new DrawingOthelloApp();
    List<Quiz> quizList = quizApp.findQuiz();
    for (int i = 0; i < quizList.length; i++) {
      cards.add(createCard(quizList[i], context));
    }
    return Container(
      color: Colors.white,
      child: ListView(
        children: cards,
      ),
    );
  }

  Card createCard(Quiz quiz, BuildContext context) {
    return Card(
      child: Column(children: [
        ListTile(
          title: Text(quiz.title),
          subtitle: Text(levelToStar(quiz.level)),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          buildViewBoard(quiz.state),
          buildSolveButton(context),
        ]),
      ]),
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

  Widget buildViewBoard(List<int> state) {
    return Container(
        margin: const EdgeInsets.all(4.0),
        child: ViewBoard(
            width: 80,
            height: 80,
            margin: 3,
            lineColor: Colors.lightGreen,
            state: state));
  }

  Widget buildSolveButton(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(4.0),
        child: RaisedButton(
          child: Text("Challenge!"),
          color: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateQuizPage(),
          )),
        ));
  }
}
