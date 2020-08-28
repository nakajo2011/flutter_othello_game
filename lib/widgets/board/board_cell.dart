import 'package:flutter/material.dart';

abstract class BoardCell extends StatelessWidget {
  const BoardCell({
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the bloc with O(1) computation complexity.
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(1.0),
        color: Colors.green,
        child: getStone(context),
      ),
    );
  }

  Widget getStone(BuildContext context);

  Widget BlackStone() {
    return Container(
      margin: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.black,
      ),
    );
  }

  Widget WhiteStone() {
    return Container(
      margin: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
    );
  }
}
