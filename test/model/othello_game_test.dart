import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_othello_game/model/othello_game.dart';

void main() {
  group('OthelloGame', () {
    OthelloGame model;

    setUp(() {
      model = OthelloGame();
    });

    int getIndex(int x, int y) => x + y * 8;

    test('getState', () {
      // expect(model.getState(getIndex(0, 0)), 0);
      expect(model.getState(getIndex(3, 3)), 2);
      expect(model.getState(getIndex(4, 3)), 1);
      expect(model.getState(getIndex(3, 4)), 1);
      expect(model.getState(getIndex(4, 4)), 2);
      // expect(model.getState(getIndex(7, 7)), 0);
    });

    test('putStone', () {
      int subject;
      subject = model.getState(getIndex(5, 4));
      expect(subject, null);
      // put black stone neighbor white stone
      model.putStone(getIndex(5, 4));
      subject = model.getState(getIndex(5, 4));
      expect(subject, 1);
      // put white stone neighbor black stone
      model.putStone(getIndex(5, 3));
      subject = model.getState(getIndex(5, 3));
      expect(subject, 2);
    });

    test('indexToPoint', () {
      expect(model.indexToPoint(0), 'A1');
    });

    test('putAndChangeStones', () {
      expect(model.getState(getIndex(3, 3)), 2);
      model.putAndChangeStones(model.getBoard(), 'D4'); // this method do not change _boardState
      expect(model.getState(getIndex(3, 3)), 2);
    });

    test('updateBoard', () {
      model.putAndChangeStones(model.getBoard(), 'D4');
      model.updateBoard();
      expect(model.getState(getIndex(3, 3)), 1);
    });

    test('getStone', () {
      expect(model.getStone(), 2);
    });
  });
}
