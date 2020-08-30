import 'package:flutter/material.dart';
import 'package:flutter_othello_game/model/othello_board.dart';
import 'package:flutter_othello_game/widgets/board/board_cell.dart';

class StaticBoardCell extends BoardCell {
  final int stoneIndex;

  const StaticBoardCell({
    Key key,
    @required this.stoneIndex,
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
    if (this.stoneIndex == OthelloStone.Black.index) {
      return BlackStone();
    } else if (this.stoneIndex == OthelloStone.White.index) {
      return WhiteStone();
    } else {
      return Container();
    }
  }
}
