import 'package:flutter/foundation.dart';

class OthelloGame with ChangeNotifier {
  static const int BLACK_STONE = 1;
  static const int WHITE_STONE = 2;
  static const List<int> START_BOARD_STATE = [
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 1, 2, 0, 0, 0,
    0, 0, 0, 2, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0];

  List<int> _boardState = List.from(START_BOARD_STATE);

  @override
  void dispose() async {
  }

  bool isBlackTurn = false;

  OthelloGame() {
  }

  int getState(int index) {
    return _boardState[index];
  }

  void putStone(int index) {
    if (index == null) return;
    _boardState[index] = getStone();
    toggleTurn();
    notifyListeners();
  }

  void toggleTurn() {
    isBlackTurn = !isBlackTurn;
  }

  int getStone() {
    return isBlackTurn ? WHITE_STONE : BLACK_STONE;
  }

  // reset this game
  void resetGame() {
    _boardState = List.from(START_BOARD_STATE);

    isBlackTurn = false;
    notifyListeners();
  }
}
