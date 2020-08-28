// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'othello_game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
OthelloGameState _$OthelloGameStateFromJson(Map<String, dynamic> json) {
  return _OthelloGameState.fromJson(json);
}

class _$OthelloGameStateTearOff {
  const _$OthelloGameStateTearOff();

// ignore: unused_element
  _OthelloGameState call(
      {List<int> boardState = const [], bool isBlackTurn = true}) {
    return _OthelloGameState(
      boardState: boardState,
      isBlackTurn: isBlackTurn,
    );
  }
}

// ignore: unused_element
const $OthelloGameState = _$OthelloGameStateTearOff();

mixin _$OthelloGameState {
  List<int> get boardState;
  bool get isBlackTurn;

  Map<String, dynamic> toJson();
  $OthelloGameStateCopyWith<OthelloGameState> get copyWith;
}

abstract class $OthelloGameStateCopyWith<$Res> {
  factory $OthelloGameStateCopyWith(
          OthelloGameState value, $Res Function(OthelloGameState) then) =
      _$OthelloGameStateCopyWithImpl<$Res>;
  $Res call({List<int> boardState, bool isBlackTurn});
}

class _$OthelloGameStateCopyWithImpl<$Res>
    implements $OthelloGameStateCopyWith<$Res> {
  _$OthelloGameStateCopyWithImpl(this._value, this._then);

  final OthelloGameState _value;
  // ignore: unused_field
  final $Res Function(OthelloGameState) _then;

  @override
  $Res call({
    Object boardState = freezed,
    Object isBlackTurn = freezed,
  }) {
    return _then(_value.copyWith(
      boardState:
          boardState == freezed ? _value.boardState : boardState as List<int>,
      isBlackTurn:
          isBlackTurn == freezed ? _value.isBlackTurn : isBlackTurn as bool,
    ));
  }
}

abstract class _$OthelloGameStateCopyWith<$Res>
    implements $OthelloGameStateCopyWith<$Res> {
  factory _$OthelloGameStateCopyWith(
          _OthelloGameState value, $Res Function(_OthelloGameState) then) =
      __$OthelloGameStateCopyWithImpl<$Res>;
  @override
  $Res call({List<int> boardState, bool isBlackTurn});
}

class __$OthelloGameStateCopyWithImpl<$Res>
    extends _$OthelloGameStateCopyWithImpl<$Res>
    implements _$OthelloGameStateCopyWith<$Res> {
  __$OthelloGameStateCopyWithImpl(
      _OthelloGameState _value, $Res Function(_OthelloGameState) _then)
      : super(_value, (v) => _then(v as _OthelloGameState));

  @override
  _OthelloGameState get _value => super._value as _OthelloGameState;

  @override
  $Res call({
    Object boardState = freezed,
    Object isBlackTurn = freezed,
  }) {
    return _then(_OthelloGameState(
      boardState:
          boardState == freezed ? _value.boardState : boardState as List<int>,
      isBlackTurn:
          isBlackTurn == freezed ? _value.isBlackTurn : isBlackTurn as bool,
    ));
  }
}

@JsonSerializable()
class _$_OthelloGameState
    with DiagnosticableTreeMixin
    implements _OthelloGameState {
  const _$_OthelloGameState(
      {this.boardState = const [], this.isBlackTurn = true})
      : assert(boardState != null),
        assert(isBlackTurn != null);

  factory _$_OthelloGameState.fromJson(Map<String, dynamic> json) =>
      _$_$_OthelloGameStateFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<int> boardState;
  @JsonKey(defaultValue: true)
  @override
  final bool isBlackTurn;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OthelloGameState(boardState: $boardState, isBlackTurn: $isBlackTurn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OthelloGameState'))
      ..add(DiagnosticsProperty('boardState', boardState))
      ..add(DiagnosticsProperty('isBlackTurn', isBlackTurn));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OthelloGameState &&
            (identical(other.boardState, boardState) ||
                const DeepCollectionEquality()
                    .equals(other.boardState, boardState)) &&
            (identical(other.isBlackTurn, isBlackTurn) ||
                const DeepCollectionEquality()
                    .equals(other.isBlackTurn, isBlackTurn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(boardState) ^
      const DeepCollectionEquality().hash(isBlackTurn);

  @override
  _$OthelloGameStateCopyWith<_OthelloGameState> get copyWith =>
      __$OthelloGameStateCopyWithImpl<_OthelloGameState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OthelloGameStateToJson(this);
  }
}

abstract class _OthelloGameState implements OthelloGameState {
  const factory _OthelloGameState({List<int> boardState, bool isBlackTurn}) =
      _$_OthelloGameState;

  factory _OthelloGameState.fromJson(Map<String, dynamic> json) =
      _$_OthelloGameState.fromJson;

  @override
  List<int> get boardState;
  @override
  bool get isBlackTurn;
  @override
  _$OthelloGameStateCopyWith<_OthelloGameState> get copyWith;
}
