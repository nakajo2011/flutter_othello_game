import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'othello_game_state.freezed.dart';

part 'othello_game_state.g.dart';

@freezed
abstract class OthelloGameState with _$OthelloGameState {
  const factory OthelloGameState({
    @Default([]) List<int> boardState,
    @Default(true) bool isBlackTurn,
  }) = _OthelloGameState;

  factory OthelloGameState.fromJson(Map<String, dynamic> json) => _$OthelloGameStateFromJson(json);
}
