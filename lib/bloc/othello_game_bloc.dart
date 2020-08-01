import 'package:rxdart/rxdart.dart';

class OthelloGameBloc {
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

  List<int> boardState = List.from(START_BOARD_STATE);

  final _boardSubject = BehaviorSubject<List<int>>.seeded(List<int>.filled(64, 0));
  final _putStoneSubject = PublishSubject<int>();
  final _resetSubject = PublishSubject<void>();

  ValueStream<List<int>> get board => _boardSubject;
  Sink<int> get putStone => _putStoneSubject.sink;
  Sink<void> get resetGame => _resetSubject.sink;

  bool isBlackTurn = false;

  OthelloGameBloc() {
    _boardSubject.add(boardState);
    _putStoneSubject.stream.listen((event) => _putStone(event));
    _resetSubject.stream.listen((_) => _resetGame());
  }

  void _putStone(int index) {
    if(index == null) return;
    print("turn: "+isBlackTurn.toString());
    boardState[index] = getStone();
    toggleTurn();
    broadcast();
  }

  void toggleTurn() {
    isBlackTurn = !isBlackTurn;
  }

  int getStone() {
    return isBlackTurn ? WHITE_STONE : BLACK_STONE;
  }

  // reset this game
  void _resetGame() {
    boardState = List.from(START_BOARD_STATE);

    isBlackTurn = false;
    broadcast();
  }

  // broadcast state to subscriber
  void broadcast() {
    _boardSubject.add(boardState);
  }

  void dispose() async {
    await _boardSubject.close();
  }
}
