import 'package:flutter/material.dart';
import 'package:flutter_othello_game/widgets/board/board_cell.dart';

class BoardRow extends StatelessWidget {
  int columnId;
  Function createCell = (int columnId, int rowId) => BoardCell;

  BoardRow({
    Key key,
    @required this.columnId,
    @required this.createCell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = new List<Widget>(8);
    for (int i = 0; i < 8; i++) {
      rows[i] = createCell(columnId, i);
    }
    return Row(textDirection: TextDirection.ltr, children: rows);
  }
}