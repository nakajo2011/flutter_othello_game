import 'package:flutter_othello_game/model/othello_board.dart';
import 'package:flutter_othello_game/state/othello_game_state.dart';
import 'package:state_notifier/state_notifier.dart';

class OthelloGame extends StateNotifier<OthelloGameState> with LocatorMixin {
  OthelloGame() : super(const OthelloGameState());

  static const int BLACK_STONE = 1;
  static const int WHITE_STONE = 2;

  List<int> _boardState = new List<int>(64);
  BigInt basePoint = BigInt.from(0x8000000000000000).toUnsigned(64);
  BigInt blackStones = BigInt.from(0x0000000810000000).toUnsigned(64);
  BigInt whiteStones = BigInt.from(0x0000001008000000).toUnsigned(64);

  bool isBlackTurn = true;

  @override
  void initState() {
    super.initState();
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
    state = state.copyWith(boardState: _boardState);
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
    state = state.copyWith(isBlackTurn: isBlackTurn, boardState: _boardState);
  }
}
