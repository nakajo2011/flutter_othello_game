import 'package:flutter/material.dart';
import 'package:flutter_othello_game/widgets/board/board_column.dart';
import 'package:flutter_othello_game/widgets/board/board_row.dart';
import 'package:flutter_othello_game/widgets/board/static_board_cell.dart';

class ViewBoard extends StatelessWidget {
  double width = 320;
  double height = 320;
  double margin = 10;
  Color lineColor = Colors.black;
  List<int> state;

  ViewBoard(
      {this.width = 320,
      this.height = 320,
      this.margin = 10.0,
      this.lineColor = Colors.black,
      @required this.state,
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
      cols[i] = BoardColumn(
          columnId: i,
          createRow: (id) => BoardRow(
                columnId: id,
                // TODO: extract util functions.
                createCell: (columnId, rowId) => StaticBoardCell(stoneIndex: state[columnId * 8 + rowId]),
              ));
    }
    return Column(children: cols);
  }
}
