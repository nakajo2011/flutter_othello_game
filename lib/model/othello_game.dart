import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_othello_game/model/othello_board.dart';
import 'package:flutter_othello_game/models.dart';

class OthelloGame with ChangeNotifier {
  List<int> _boardState = new List<int>(64);
  OthelloBoard currentBoard;

  @override
  void dispose() async {
  }

  bool isBlackTurn = true;

  OthelloGame() {
    resetGame();
  }

  int getState(int index) {
    return _boardState[index];
  }

  void putStone(int index) {
    if (index == null) return;
    String point = indexToPoint(index);
    if (!this.currentBoard.canPut(point)) return;

    putAndChangeStones(point);
    updateBoard();
    notifyListeners();
  }

  String indexToPoint(index) {
    int x = index % 8;
    int y = (index / 8).floor() + 1;
    return String.fromCharCode("A".codeUnitAt(0) + x) + y.toString();
  }

  void putAndChangeStones(String point) {
    currentBoard.reverse(point);
    final opponentBoard = currentBoard.opponentBoard();
    if (!opponentBoard.isPass()) {
      currentBoard = opponentBoard;
      isBlackTurn = !isBlackTurn;
    }
  }

  void updateBoard() {
    _boardState =  currentBoard.toList();
  }

  // reset this game
  void resetGame() {
    currentBoard =  OthelloBoard.initBoard();
    updateBoard();

    isBlackTurn = true;
    notifyListeners();
  }

  void registerQuiz(String title) async {
    OthelloBoard board = currentBoard;
    if (isBlackTurn) {
      await Quiz(title: title, black_stones: board.playerStones.toString(), white_stones: board.opponentStones.toString()).save();
    } else {
      await Quiz(title: title, black_stones: board.opponentStones.toString(), white_stones: board.playerStones.toString()).save();
    }
  }

  // クイズデータをロードしたついでにOthelloGameの盤上も書き換える
  // ゲームにするには正解の絵を別に持つかもしれない
  void loadQuiz(int id) async {
    Quiz quiz;
    await Quiz().select().id.equals(id).toSingle().then((entity) => quiz = entity);
    BigInt blackStones = BigInt.parse(quiz.black_stones).toUnsigned(64);
    BigInt whiteStones = BigInt.parse(quiz.white_stones).toUnsigned(64);

    currentBoard = new OthelloBoard(blackStones: blackStones, whiteStones: whiteStones, currentTurn: OthelloStone.Black);
    updateBoard();

    isBlackTurn = true;
    notifyListeners();
  }
}
