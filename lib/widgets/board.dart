import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/othello_game_bloc.dart';

class Board extends StatelessWidget {
  final OthelloGameBloc bloc;
  const Board({
    Key key,
    @required this.bloc,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      color: Colors.black,
      width: 320,
      height: 320,
      child: columns(bloc),
    );
  }

  Widget columns(OthelloGameBloc bloc) {
    List<Widget> cols = new List<Widget>(8);
    for (int i = 0; i < 8; i++) {
      cols[i] = BoardColumn(columnId: i, bloc: bloc);
    }
    return Column(children: cols);
  }
}

class BoardColumn extends StatelessWidget {
  const BoardColumn({
    Key key,
    this.columnId,
    @required this.bloc,
  }): super(key: key);

  final int columnId;
  final OthelloGameBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: BoardRow(columnId: columnId, bloc: bloc)
      ),
    );
  }
}

class BoardRow extends StatelessWidget {
  final int columnId;
  final OthelloGameBloc bloc;

  const BoardRow({
    Key key,
    this.columnId,
    @required this.bloc,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = new List<Widget>(8);
    for (int i = 0; i < 8; i++) {
      rows[i] = BoardCell(columnId: columnId, rowId: i, bloc: bloc);
    }
    return Row(textDirection: TextDirection.ltr, children: rows);
  }
}

class BoardCell extends StatelessWidget {
  final OthelloGameBloc bloc;
  final int columnId;
  final int rowId;

  const BoardCell({
    Key key,
    @required this.bloc,
    this.columnId,
    this.rowId,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        // 指定したstreamにデータが流れてくると再描画される
        stream: this.bloc.board,
        builder: (contex, snap) => Container(
            margin: EdgeInsets.all(1.0),
            color: Colors.green,
            child: getStone(),
          ),
      ),
    );
  }

  getStone() {
    int stoneIndex = 0;
    List<int> boardState = bloc.board.value;
    Sink<int> putStone = bloc.putStone;
    if(boardState != null) {
      stoneIndex = boardState[getIndex()];
    }
    if(stoneIndex == OthelloGameBloc.BLACK_STONE) {
      return BlackStone();
    } else if(stoneIndex == OthelloGameBloc.WHITE_STONE) {
      return WhiteStone();
    } else {
      return InkWell(
          child:Container(),
          onTap: () {
            putStone.add(getIndex());
            print("Cell("+columnId.toString()+", "+rowId.toString()+") taped.");
          }
      );
    }
  }

  int getIndex() {
    return columnId*8+rowId;
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