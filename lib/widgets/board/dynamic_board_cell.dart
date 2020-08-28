import 'package:flutter/material.dart';
import 'package:flutter_othello_game/model/othello_game.dart';
import 'package:flutter_othello_game/widgets/board/board_cell.dart';
import 'package:provider/provider.dart';

class DynamicBoardCell extends BoardCell {
  final int columnId;
  final int rowId;
  const DynamicBoardCell({
    Key key,
    @required this.columnId,
    @required this.rowId,
  }) : super(key: key);

  int getIndex() {
    return columnId * 8 + rowId;
  }

  @override
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
}
