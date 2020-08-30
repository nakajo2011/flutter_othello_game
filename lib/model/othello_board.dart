enum OthelloStone {
  None,
  Black,
  White

}

extension OthelloStoneEx on OthelloStone {
  OthelloStone turnOver() {
    switch(this) {
      case OthelloStone.Black:
        return OthelloStone.White;
      case OthelloStone.White:
        return OthelloStone.Black;
      default:
        throw StateError('It can not turn over None.');
    }
  }
}
class OthelloBoard {
  final DIRECTIONS = {
    'top'        : {'shift' : (BigInt board) => board << 8, 'loop_guard' : 0x00FFFFFFFFFFFF00 },
    'down'       : {'shift' : (BigInt board) => board >> 8, 'loop_guard' : 0x00FFFFFFFFFFFF00 },
    'left'       : {'shift' : (BigInt board) => board << 1, 'loop_guard' : 0x7e7e7e7e7e7e7e7e },
    'right'      : {'shift' : (BigInt board) => board >> 1, 'loop_guard' : 0x7e7e7e7e7e7e7e7e },
    'top_left'   : {'shift' : (BigInt board) => board << 9, 'loop_guard' : 0x007e7e7e7e7e7e00 },
    'top_right'  : {'shift' : (BigInt board) => board << 7, 'loop_guard' : 0x007e7e7e7e7e7e00 },
    'down_left'  : {'shift' : (BigInt board) => board >> 9, 'loop_guard' : 0x007e7e7e7e7e7e00 },
    'down_right' : {'shift' : (BigInt board) => board >> 7, 'loop_guard' : 0x007e7e7e7e7e7e00 }
  };

  static final BLACK_INIT_STONES = BigInt.from(0x0000000810000000).toUnsigned(64);
  static final WHITE_INIT_STONES = BigInt.from(0x0000001008000000).toUnsigned(64);

  BigInt playerStones;
  BigInt opponentStones;
  OthelloStone playerColor;

  // 初期配置のボードを返す。
  static OthelloBoard initBoard() {
    return new OthelloBoard(blackStones: BLACK_INIT_STONES, whiteStones: WHITE_INIT_STONES,
        currentTurn: OthelloStone.Black);
  }

  OthelloBoard({BigInt blackStones, BigInt whiteStones, OthelloStone currentTurn}) {
    this.playerColor = currentTurn;
    if (currentTurn == OthelloStone.Black) {
      // 着手しようとしてる側の石
      this.playerStones = blackStones;
      // 着手しようとしてる側から見て相手の石
      this.opponentStones = whiteStones;
    } else {
      this.playerStones = whiteStones;
      this.opponentStones = blackStones;
    }
  }

  // 座標をbitに変換する
  // A1～H8
  BigInt pointToBit(String point) {
    int x = point.substring(0, 1).codeUnitAt(0);
    int y = int.parse(point.substring(1, 2));
    return toBit(0x8000000000000000) >> (x - 'A'.codeUnitAt(0)) >> ( (y - 1) * 8);
  }

  // 着手可否の判定
  bool canPut(putPoint) {
    var putStone = pointToBit(putPoint);
    return putStone & canPutCells > BigInt.zero;
  }

  // 着手して石返しする
  void reverse(String putPoint) {
    var putStone = pointToBit(putPoint);
    var reversedStones = this.reversedStones(putStone);
    this.playerStones ^= putStone | reversedStones;
    this.opponentStones ^= reversedStones;
  }

  // パスか？
  isPass() {
    return canPutCells == BigInt.zero;
  }

  // 相手側のボード
  OthelloBoard opponentBoard() {
      return new OthelloBoard(
          blackStones: blackStones, whiteStones: whiteStones, currentTurn: this.playerColor.turnOver());
  }

  String toStr(BigInt bit) {
    return bit.toRadixString(2).padLeft(64, "0").replaceAllMapped(RegExp(r".{8}"), (match) => "${match.group(0)}\n");
  }

  BigInt toBit(int num) {
    return BigInt.from(num).toUnsigned(64);
  }

  // 盤状態をintの配列で返す。
  List<int> toList() {
    final BigInt basePoint = BigInt.from(0x8000000000000000).toUnsigned(64);
    final res = List<int>.filled(64, 0);
    for (int index = 0; index < 64; index++) {
      BigInt point_bit = basePoint >> index;
      if (point_bit & blackStones > BigInt.zero) {
        res[index] = OthelloStone.Black.index;
      } else if (point_bit & whiteStones > BigInt.zero) {
        res[index] = OthelloStone.White.index;
      }
    }
    return res;
  }
  // 着手可能マス
  BigInt get canPutCells {
    return DIRECTIONS.values.map((direction) {
      var adjacentOpponents = this.adjacentOpponents(direction, this.playerStones);
      // 最後が空きマスなら着手可能マスとする
      BigInt Function(BigInt) shift = direction['shift'];
      return this.blankCells & shift(adjacentOpponents);
    }).reduce((current, next) => current | next);
  }

  // 石返し対象
  BigInt reversedStones(putStone) {
    return DIRECTIONS.values.map((direction) {
      var adjacentOpponents = this.adjacentOpponents(direction, putStone);
      // 最後に種石があれば石返し対象とする
      BigInt Function(BigInt) shift = direction['shift'];
      return (this.playerStones & shift(adjacentOpponents)) > BigInt.zero ? adjacentOpponents : BigInt.zero;
    }).reduce((current, next) => current | next);
  }

  // 指定方向に連続して隣接する相手石
  // 初回とその結果を踏まえながらの最大5回分
  BigInt adjacentOpponents(direction, baseStones) {
    return [0,1,2,3,4].fold(
        adjacentOpponent(direction, baseStones), (adjacentOpponents, i) => adjacentOpponents | adjacentOpponent(direction, adjacentOpponents));
  }

  // 指定方向に1マス隣接する相手石
  // ガードを付けることで盤面ループした判定を防ぐ
  BigInt adjacentOpponent(direction, baseStones) {
    BigInt Function(BigInt) shift = direction['shift'];
    return shift(baseStones) & this.opponentStones & toBit(direction['loop_guard']);
  }

  // 空きマス
  BigInt get blankCells {
    return ~(this.playerStones | this.opponentStones);
  }

  // 黒石のbit board
  BigInt get blackStones {
    return playerColor == OthelloStone.Black ? this.playerStones : this.opponentStones;
  }

  // 白石のbit board
  BigInt get whiteStones {
    return playerColor == OthelloStone.White ? this.playerStones : this.opponentStones;
  }
}
