import 'package:flutter/material.dart';
import 'package:flutter_othello_game/constants.dart';
import 'package:flutter_othello_game/pages/create_quiz.dart';

//
// @description TopPage
class TopPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Widget> _pageList = [

      CreateQuizPage(),
    ];

    return Scaffold(
      appBar: AppBar(
          title: Text(appTitle),
      ),
      body: CustomPage(panelColor: Colors.green, title: 'クイズの一覧ページ'),
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

class CustomPage extends StatelessWidget {
  Color panelColor = Colors.white;
  String title = "";

  CustomPage({this.panelColor, this.title,
    Key key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.panelColor,
      child: Text(title),
    );
  }

}