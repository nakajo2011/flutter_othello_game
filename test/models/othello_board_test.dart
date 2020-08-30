import 'package:flutter_othello_game/model/othello_board.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final blackStoneFirst = BigInt.from(0x0000000810000000).toUnsigned(64);
  final whiteStoneFirst = BigInt.from(0x0000001008000000).toUnsigned(64);

  group('put stone', () {
    test('can reverse if put valid position', () {
      var board = new OthelloBoard(
          blackStones: blackStoneFirst,
          whiteStones: whiteStoneFirst,
          currentTurn: OthelloStone.Black);
      board.reverse('D3');
      expect(board.toStr(board.playerStones),
          "00000000\n00000000\n00010000\n00011000\n00010000\n00000000\n00000000\n00000000\n");
    });
    test('can not reverse if put invalid position', () {
      var board = new OthelloBoard(
          blackStones: blackStoneFirst,
          whiteStones: whiteStoneFirst,
          currentTurn: OthelloStone.Black);
      board.reverse('A1');
      expect(board.toStr(board.playerStones),
          "10000000\n00000000\n00000000\n00001000\n00010000\n00000000\n00000000\n00000000\n");
    });
  });

  group('check canPut', () {
    test('can put D3 in first at BlackStone.', () {
      var board = new OthelloBoard(
          blackStones: blackStoneFirst,
          whiteStones: whiteStoneFirst,
          currentTurn: OthelloStone.Black);
      expect(board.canPut(('D3')), true);
    });
    test('can not put A1 in first at BlackStone.', () {
      var board = new OthelloBoard(
          blackStones: blackStoneFirst,
          whiteStones: whiteStoneFirst,
          currentTurn: OthelloStone.Black);
      expect(board.canPut(('A1')), false);
    });
  });

  group('toListState', () {
    test('at stating state.', () {
      var board = new OthelloBoard(
          blackStones: blackStoneFirst,
          whiteStones: whiteStoneFirst,
          currentTurn: OthelloStone.Black);
      expect(board.toList(), [
        0, 0, 0, 0, 0, 0, 0, 0, // stopper line break
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 2, 1, 0, 0, 0,
        0, 0, 0, 1, 2, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
      ]);
    });

    test('reflect put stone.', () {
      var board = new OthelloBoard(
          blackStones: blackStoneFirst,
          whiteStones: whiteStoneFirst,
          currentTurn: OthelloStone.Black);
      board.reverse("A1");

      expect(board.toList(), [
        1, 0, 0, 0, 0, 0, 0, 0, // stopper line break
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 2, 1, 0, 0, 0,
        0, 0, 0, 1, 2, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
      ]);
    });

    test('reflect turn over stones.', () {
      var board = new OthelloBoard(
          blackStones: blackStoneFirst,
          whiteStones: whiteStoneFirst,
          currentTurn: OthelloStone.Black);
      board.reverse("D3");

      expect(board.toList(), [
        0, 0, 0, 0, 0, 0, 0, 0, // stopper line break
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 1, 0, 0, 0, 0,
        0, 0, 0, 1, 1, 0, 0, 0,
        0, 0, 0, 1, 2, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
      ]);
    });
  });
}
