// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'othello_game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OthelloGameState _$_$_OthelloGameStateFromJson(Map<String, dynamic> json) {
  return _$_OthelloGameState(
    boardState:
        (json['boardState'] as List)?.map((e) => e as int)?.toList() ?? [],
    isBlackTurn: json['isBlackTurn'] as bool ?? true,
  );
}

Map<String, dynamic> _$_$_OthelloGameStateToJson(
        _$_OthelloGameState instance) =>
    <String, dynamic>{
      'boardState': instance.boardState,
      'isBlackTurn': instance.isBlackTurn,
    };
