import 'package:flutter/material.dart';
import 'package:flutter_othello_game/widgets/board/board_row.dart';

class BoardColumn extends StatelessWidget {
  int columnId;
  Function createRow = (int) => BoardRow;

  BoardColumn({
    Key key,
    @required this.columnId,
    @required this.createRow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: createRow(columnId),
      ),
    );
  }
}
