import 'package:flutter_othello_game/model/othello_game.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('turn check', () {
    test('Start since BlackStone.', () {
      final game = new OthelloGame();
      expect(game.isBlackTurn, true);
    });
    test('Change turn when put stone.', () {
      final game = new OthelloGame();
      game.putStone(19);
      expect(game.isBlackTurn, false);
    });
    test('White is passed.', () {
      final game = new OthelloGame();
      minimum_pass(game); // put 8 times. next is black, but black must pass.
      expect(game.isBlackTurn, false); // so, white turn.
    });
  });

  group('getBoard', () {
    final game = new OthelloGame();
    test('in first, return the board who player is black stone.', () {
      final board = game.currentBoard;
      expect(board.toStr(board.playerStones),
          "00000000\n00000000\n00000000\n00001000\n00010000\n00000000\n00000000\n00000000\n");
    });
    test('in second, return the board who player is white stone.', () {
      game.putStone(37);
      final board = game.currentBoard;
      expect(board.toStr(board.playerStones),
          "00000000\n00000000\n00000000\n00010000\n00000000\n00000000\n00000000\n00000000\n");
    });
  });

  group('board state', () {
    final game = new OthelloGame();
    test('at starting', () {
      expect(toListOfBoardState(game), [
        0, 0, 0, 0, 0, 0, 0, 0, // line break stopper for formatter
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 2, 1, 0, 0, 0,
        0, 0, 0, 1, 2, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
      ]);
    });
  });
}

List<int> toListOfBoardState(OthelloGame game) {
  List<int> boardState = new List(64);
  for (int i = 0; i < boardState.length; i++) {
    boardState[i] = game.getState(i);
  }
  return boardState;
}

void minimum_pass(OthelloGame game) {
  game.putStone(37); // F5
  game.putStone(45); // F6
  game.putStone(19); // D3
  game.putStone(38); // G5
  game.putStone(39); // H5
  game.putStone(31); // H4
  game.putStone(53); // F7
  game.putStone(47); // H6
}
