import 'package:flutter/material.dart';
import 'package:flutter_othello_game/model/othello_game.dart';
import 'package:provider/provider.dart';

class Board extends StatelessWidget {
  double width = 320;
  double height = 320;
  double margin = 10;
  Color lineColor = Colors.black;

  Board(
      {this.width = 320,
      this.height = 320,
      this.margin = 10.0,
      this.lineColor = Colors.black,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF206020),
        child: Container(
          margin: EdgeInsets.all(this.margin),
          color: this.lineColor,
          width: this.width,
          height: this.height,
          child: columns(),
        ));
  }

  Widget columns() {
    List<Widget> cols = new List<Widget>(8);
    for (int i = 0; i < 8; i++) {
      cols[i] = BoardColumn(columnId: i);
    }
    return Column(children: cols);
  }
}

class BoardColumn extends StatelessWidget {
  const BoardColumn({
    Key key,
    @required this.columnId,
  }) : super(key: key);

  final int columnId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(child: BoardRow(columnId: columnId)),
    );
  }
}

class BoardRow extends StatelessWidget {
  final int columnId;

  const BoardRow({
    Key key,
    @required this.columnId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = new List<Widget>(8);
    for (int i = 0; i < 8; i++) {
      rows[i] = BoardCell(columnId: columnId, rowId: i);
    }
    return Row(textDirection: TextDirection.ltr, children: rows);
  }
}

class BoardCell extends StatelessWidget {
  final int columnId;
  final int rowId;

  const BoardCell({
    Key key,
    @required this.columnId,
    @required this.rowId,
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

  Widget getStone(BuildContext context) {
    final int stoneIndex =
        context.select((OthelloGame game) => game.getState(getIndex()));
    if (stoneIndex == OthelloGame.BLACK_STONE) {
      return BlackStone();
    } else if (stoneIndex == OthelloGame.WHITE_STONE) {
      return WhiteStone();
    } else {
      return InkWell(
          child: Container(),
          onTap: () {
            context.read<OthelloGame>().putStone(getIndex());
            print("Cell(" +
                columnId.toString() +
                ", " +
                rowId.toString() +
                ") taped.");
          });
    }
  }

  int getIndex() {
    return columnId * 8 + rowId;
  }
}

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
