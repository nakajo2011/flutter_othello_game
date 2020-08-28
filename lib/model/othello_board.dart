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

  BigInt playerStones;
  BigInt opponentStones;

  OthelloBoard({BigInt playerStones, BigInt opponentStones}) {
    // 着手しようとしてる側の石
    this.playerStones = playerStones;
    // 着手しようとしてる側から見て相手の石
    this.opponentStones = opponentStones;
  }

  // 座標をbitに変換する
  // A1～H8
  BigInt pointToBit(String point) {
    int x = point.substring(0, 1).codeUnitAt(0);
    int y = int.parse(point.substring(1, 2));
    return toBit(0x8000000000000000) >> (x - 'A'.codeUnitAt(0)) >> ( (y - 1) * 8);
  }

  // 着手可否の判定
  canPut(putPoint) {
    var putStone = pointToBit(putPoint);
    return putStone & canPutCells() > BigInt.zero;
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
    return canPutCells() == BigInt.zero;
  }

  // 相手側のボード
  OthelloBoard opponentBoard() {
    return new OthelloBoard(playerStones: this.opponentStones, opponentStones: this.playerStones);
  }

  String toStr(BigInt bit) {
    return bit.toRadixString(2).padLeft(64, "0").replaceAllMapped(RegExp(r".{8}"), (match) => "${match.group(0)}\n");;
  }

  BigInt toBit(int num) {
    return BigInt.from(num).toUnsigned(64);
  }

  // 着手可能マス
  BigInt canPutCells() {
    return DIRECTIONS.values.map((direction) {
      var adjacentOpponents = this.adjacentOpponents(direction, this.playerStones);
      // 最後が空きマスなら着手可能マスとする
      BigInt Function(BigInt) shift = direction['shift'];
      return this.blankCells() & shift(adjacentOpponents);
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
  BigInt blankCells() {
    return ~(this.playerStones | this.opponentStones);
  }
}
