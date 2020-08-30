import 'package:flutter/foundation.dart';
import 'package:flutter_othello_game/main.dart';
import 'package:flutter_othello_game/model/othello_board.dart';
import 'package:flutter_othello_game/models.dart';

class OthelloGame with ChangeNotifier {
  static const int BLACK_STONE = 1;
  static const int WHITE_STONE = 2;

  List<int> _boardState = new List<int>(64);
  BigInt basePoint = BigInt.from(0x8000000000000000).toUnsigned(64);
  BigInt blackStones = BigInt.from(0x0000000810000000).toUnsigned(64);
  BigInt whiteStones = BigInt.from(0x0000001008000000).toUnsigned(64);

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
    OthelloBoard board = getBoard();
    String point = indexToPoint(index);
    if (!board.canPut(point)) return;

    putAndChangeStones(board, point);
    updateBoard();
    notifyListeners();
  }

  String indexToPoint(index) {
    int x = index % 8;
    int y = (index / 8).floor() + 1;
    return String.fromCharCode("A".codeUnitAt(0) + x) + y.toString();
  }

  void putAndChangeStones(OthelloBoard board, String point) {
    board.reverse(point);
    blackStones = isBlackTurn ? board.playerStones : board.opponentStones;
    whiteStones = isBlackTurn ? board.opponentStones : board.playerStones;
    if (!board.opponentBoard().isPass()) isBlackTurn = !isBlackTurn;
  }

  void updateBoard() {
    _boardState = new List<int>(64);
    for (int index = 0; index < 64; index++) {
      BigInt point_bit = basePoint >> index;
      if (point_bit & blackStones > BigInt.zero) {
        _boardState[index] = BLACK_STONE;
      } else if (point_bit & whiteStones > BigInt.zero) {
        _boardState[index] = WHITE_STONE;
      }
    }
  }

  OthelloBoard getBoard() {
    if (isBlackTurn) {
      return new OthelloBoard(playerStones: blackStones, opponentStones: whiteStones);
    } else {
      return new OthelloBoard(playerStones: whiteStones, opponentStones: blackStones);
    }
  }

  int getStone() {
    return isBlackTurn ? WHITE_STONE : BLACK_STONE;
  }

  // reset this game
  void resetGame() {
    blackStones = BigInt.from(0x0000000810000000).toUnsigned(64);
    whiteStones = BigInt.from(0x0000001008000000).toUnsigned(64);
    updateBoard();

    isBlackTurn = true;
    notifyListeners();
  }

  void registerQuiz(String title) async {
    OthelloBoard board = getBoard();
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
    blackStones = BigInt.parse(quiz.black_stones).toUnsigned(64);
    whiteStones = BigInt.parse(quiz.white_stones).toUnsigned(64);
    updateBoard();

    isBlackTurn = true;
    notifyListeners();
  }
}
