// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'passwords_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PasswordsEventTearOff {
  const _$PasswordsEventTearOff();

  PasswordsCardAdd cardAdd() {
    return const PasswordsCardAdd();
  }

  PasswordsAllCardsRemoved allCardsRemoved() {
    return const PasswordsAllCardsRemoved();
  }
}

/// @nodoc
const $PasswordsEvent = _$PasswordsEventTearOff();

/// @nodoc
mixin _$PasswordsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cardAdd,
    required TResult Function() allCardsRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cardAdd,
    TResult Function()? allCardsRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cardAdd,
    TResult Function()? allCardsRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordsCardAdd value) cardAdd,
    required TResult Function(PasswordsAllCardsRemoved value) allCardsRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasswordsCardAdd value)? cardAdd,
    TResult Function(PasswordsAllCardsRemoved value)? allCardsRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordsCardAdd value)? cardAdd,
    TResult Function(PasswordsAllCardsRemoved value)? allCardsRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordsEventCopyWith<$Res> {
  factory $PasswordsEventCopyWith(
          PasswordsEvent value, $Res Function(PasswordsEvent) then) =
      _$PasswordsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasswordsEventCopyWithImpl<$Res>
    implements $PasswordsEventCopyWith<$Res> {
  _$PasswordsEventCopyWithImpl(this._value, this._then);

  final PasswordsEvent _value;
  // ignore: unused_field
  final $Res Function(PasswordsEvent) _then;
}

/// @nodoc
abstract class $PasswordsCardAddCopyWith<$Res> {
  factory $PasswordsCardAddCopyWith(
          PasswordsCardAdd value, $Res Function(PasswordsCardAdd) then) =
      _$PasswordsCardAddCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasswordsCardAddCopyWithImpl<$Res>
    extends _$PasswordsEventCopyWithImpl<$Res>
    implements $PasswordsCardAddCopyWith<$Res> {
  _$PasswordsCardAddCopyWithImpl(
      PasswordsCardAdd _value, $Res Function(PasswordsCardAdd) _then)
      : super(_value, (v) => _then(v as PasswordsCardAdd));

  @override
  PasswordsCardAdd get _value => super._value as PasswordsCardAdd;
}

/// @nodoc

class _$PasswordsCardAdd implements PasswordsCardAdd {
  const _$PasswordsCardAdd();

  @override
  String toString() {
    return 'PasswordsEvent.cardAdd()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordsCardAdd);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cardAdd,
    required TResult Function() allCardsRemoved,
  }) {
    return cardAdd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cardAdd,
    TResult Function()? allCardsRemoved,
  }) {
    return cardAdd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cardAdd,
    TResult Function()? allCardsRemoved,
    required TResult orElse(),
  }) {
    if (cardAdd != null) {
      return cardAdd();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordsCardAdd value) cardAdd,
    required TResult Function(PasswordsAllCardsRemoved value) allCardsRemoved,
  }) {
    return cardAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasswordsCardAdd value)? cardAdd,
    TResult Function(PasswordsAllCardsRemoved value)? allCardsRemoved,
  }) {
    return cardAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordsCardAdd value)? cardAdd,
    TResult Function(PasswordsAllCardsRemoved value)? allCardsRemoved,
    required TResult orElse(),
  }) {
    if (cardAdd != null) {
      return cardAdd(this);
    }
    return orElse();
  }
}

abstract class PasswordsCardAdd implements PasswordsEvent {
  const factory PasswordsCardAdd() = _$PasswordsCardAdd;
}

/// @nodoc
abstract class $PasswordsAllCardsRemovedCopyWith<$Res> {
  factory $PasswordsAllCardsRemovedCopyWith(PasswordsAllCardsRemoved value,
          $Res Function(PasswordsAllCardsRemoved) then) =
      _$PasswordsAllCardsRemovedCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasswordsAllCardsRemovedCopyWithImpl<$Res>
    extends _$PasswordsEventCopyWithImpl<$Res>
    implements $PasswordsAllCardsRemovedCopyWith<$Res> {
  _$PasswordsAllCardsRemovedCopyWithImpl(PasswordsAllCardsRemoved _value,
      $Res Function(PasswordsAllCardsRemoved) _then)
      : super(_value, (v) => _then(v as PasswordsAllCardsRemoved));

  @override
  PasswordsAllCardsRemoved get _value =>
      super._value as PasswordsAllCardsRemoved;
}

/// @nodoc

class _$PasswordsAllCardsRemoved implements PasswordsAllCardsRemoved {
  const _$PasswordsAllCardsRemoved();

  @override
  String toString() {
    return 'PasswordsEvent.allCardsRemoved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordsAllCardsRemoved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cardAdd,
    required TResult Function() allCardsRemoved,
  }) {
    return allCardsRemoved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cardAdd,
    TResult Function()? allCardsRemoved,
  }) {
    return allCardsRemoved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cardAdd,
    TResult Function()? allCardsRemoved,
    required TResult orElse(),
  }) {
    if (allCardsRemoved != null) {
      return allCardsRemoved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordsCardAdd value) cardAdd,
    required TResult Function(PasswordsAllCardsRemoved value) allCardsRemoved,
  }) {
    return allCardsRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasswordsCardAdd value)? cardAdd,
    TResult Function(PasswordsAllCardsRemoved value)? allCardsRemoved,
  }) {
    return allCardsRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordsCardAdd value)? cardAdd,
    TResult Function(PasswordsAllCardsRemoved value)? allCardsRemoved,
    required TResult orElse(),
  }) {
    if (allCardsRemoved != null) {
      return allCardsRemoved(this);
    }
    return orElse();
  }
}

abstract class PasswordsAllCardsRemoved implements PasswordsEvent {
  const factory PasswordsAllCardsRemoved() = _$PasswordsAllCardsRemoved;
}

/// @nodoc
class _$SpeedDialEventTearOff {
  const _$SpeedDialEventTearOff();

  SpeedDialClose close() {
    return const SpeedDialClose();
  }

  SpeedDialOpen open() {
    return const SpeedDialOpen();
  }
}

/// @nodoc
const $SpeedDialEvent = _$SpeedDialEventTearOff();

/// @nodoc
mixin _$SpeedDialEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() close,
    required TResult Function() open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? close,
    TResult Function()? open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? close,
    TResult Function()? open,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeedDialClose value) close,
    required TResult Function(SpeedDialOpen value) open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SpeedDialClose value)? close,
    TResult Function(SpeedDialOpen value)? open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeedDialClose value)? close,
    TResult Function(SpeedDialOpen value)? open,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeedDialEventCopyWith<$Res> {
  factory $SpeedDialEventCopyWith(
          SpeedDialEvent value, $Res Function(SpeedDialEvent) then) =
      _$SpeedDialEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpeedDialEventCopyWithImpl<$Res>
    implements $SpeedDialEventCopyWith<$Res> {
  _$SpeedDialEventCopyWithImpl(this._value, this._then);

  final SpeedDialEvent _value;
  // ignore: unused_field
  final $Res Function(SpeedDialEvent) _then;
}

/// @nodoc
abstract class $SpeedDialCloseCopyWith<$Res> {
  factory $SpeedDialCloseCopyWith(
          SpeedDialClose value, $Res Function(SpeedDialClose) then) =
      _$SpeedDialCloseCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpeedDialCloseCopyWithImpl<$Res>
    extends _$SpeedDialEventCopyWithImpl<$Res>
    implements $SpeedDialCloseCopyWith<$Res> {
  _$SpeedDialCloseCopyWithImpl(
      SpeedDialClose _value, $Res Function(SpeedDialClose) _then)
      : super(_value, (v) => _then(v as SpeedDialClose));

  @override
  SpeedDialClose get _value => super._value as SpeedDialClose;
}

/// @nodoc

class _$SpeedDialClose implements SpeedDialClose {
  const _$SpeedDialClose();

  @override
  String toString() {
    return 'SpeedDialEvent.close()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SpeedDialClose);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() close,
    required TResult Function() open,
  }) {
    return close();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? close,
    TResult Function()? open,
  }) {
    return close?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? close,
    TResult Function()? open,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeedDialClose value) close,
    required TResult Function(SpeedDialOpen value) open,
  }) {
    return close(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SpeedDialClose value)? close,
    TResult Function(SpeedDialOpen value)? open,
  }) {
    return close?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeedDialClose value)? close,
    TResult Function(SpeedDialOpen value)? open,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(this);
    }
    return orElse();
  }
}

abstract class SpeedDialClose implements SpeedDialEvent {
  const factory SpeedDialClose() = _$SpeedDialClose;
}

/// @nodoc
abstract class $SpeedDialOpenCopyWith<$Res> {
  factory $SpeedDialOpenCopyWith(
          SpeedDialOpen value, $Res Function(SpeedDialOpen) then) =
      _$SpeedDialOpenCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpeedDialOpenCopyWithImpl<$Res>
    extends _$SpeedDialEventCopyWithImpl<$Res>
    implements $SpeedDialOpenCopyWith<$Res> {
  _$SpeedDialOpenCopyWithImpl(
      SpeedDialOpen _value, $Res Function(SpeedDialOpen) _then)
      : super(_value, (v) => _then(v as SpeedDialOpen));

  @override
  SpeedDialOpen get _value => super._value as SpeedDialOpen;
}

/// @nodoc

class _$SpeedDialOpen implements SpeedDialOpen {
  const _$SpeedDialOpen();

  @override
  String toString() {
    return 'SpeedDialEvent.open()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SpeedDialOpen);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() close,
    required TResult Function() open,
  }) {
    return open();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? close,
    TResult Function()? open,
  }) {
    return open?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? close,
    TResult Function()? open,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeedDialClose value) close,
    required TResult Function(SpeedDialOpen value) open,
  }) {
    return open(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SpeedDialClose value)? close,
    TResult Function(SpeedDialOpen value)? open,
  }) {
    return open?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeedDialClose value)? close,
    TResult Function(SpeedDialOpen value)? open,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(this);
    }
    return orElse();
  }
}

abstract class SpeedDialOpen implements SpeedDialEvent {
  const factory SpeedDialOpen() = _$SpeedDialOpen;
}

/// @nodoc
class _$PasswordsStateTearOff {
  const _$PasswordsStateTearOff();

  _PasswordsInitial initial() {
    return const _PasswordsInitial();
  }

  _PasswordsLoading loading() {
    return const _PasswordsLoading();
  }

  _PasswordsLoaded loaded() {
    return const _PasswordsLoaded();
  }
}

/// @nodoc
const $PasswordsState = _$PasswordsStateTearOff();

/// @nodoc
mixin _$PasswordsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordsInitial value) initial,
    required TResult Function(_PasswordsLoading value) loading,
    required TResult Function(_PasswordsLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PasswordsInitial value)? initial,
    TResult Function(_PasswordsLoading value)? loading,
    TResult Function(_PasswordsLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordsInitial value)? initial,
    TResult Function(_PasswordsLoading value)? loading,
    TResult Function(_PasswordsLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordsStateCopyWith<$Res> {
  factory $PasswordsStateCopyWith(
          PasswordsState value, $Res Function(PasswordsState) then) =
      _$PasswordsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasswordsStateCopyWithImpl<$Res>
    implements $PasswordsStateCopyWith<$Res> {
  _$PasswordsStateCopyWithImpl(this._value, this._then);

  final PasswordsState _value;
  // ignore: unused_field
  final $Res Function(PasswordsState) _then;
}

/// @nodoc
abstract class _$PasswordsInitialCopyWith<$Res> {
  factory _$PasswordsInitialCopyWith(
          _PasswordsInitial value, $Res Function(_PasswordsInitial) then) =
      __$PasswordsInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$PasswordsInitialCopyWithImpl<$Res>
    extends _$PasswordsStateCopyWithImpl<$Res>
    implements _$PasswordsInitialCopyWith<$Res> {
  __$PasswordsInitialCopyWithImpl(
      _PasswordsInitial _value, $Res Function(_PasswordsInitial) _then)
      : super(_value, (v) => _then(v as _PasswordsInitial));

  @override
  _PasswordsInitial get _value => super._value as _PasswordsInitial;
}

/// @nodoc

class _$_PasswordsInitial implements _PasswordsInitial {
  const _$_PasswordsInitial();

  @override
  String toString() {
    return 'PasswordsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PasswordsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordsInitial value) initial,
    required TResult Function(_PasswordsLoading value) loading,
    required TResult Function(_PasswordsLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PasswordsInitial value)? initial,
    TResult Function(_PasswordsLoading value)? loading,
    TResult Function(_PasswordsLoaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordsInitial value)? initial,
    TResult Function(_PasswordsLoading value)? loading,
    TResult Function(_PasswordsLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _PasswordsInitial implements PasswordsState {
  const factory _PasswordsInitial() = _$_PasswordsInitial;
}

/// @nodoc
abstract class _$PasswordsLoadingCopyWith<$Res> {
  factory _$PasswordsLoadingCopyWith(
          _PasswordsLoading value, $Res Function(_PasswordsLoading) then) =
      __$PasswordsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$PasswordsLoadingCopyWithImpl<$Res>
    extends _$PasswordsStateCopyWithImpl<$Res>
    implements _$PasswordsLoadingCopyWith<$Res> {
  __$PasswordsLoadingCopyWithImpl(
      _PasswordsLoading _value, $Res Function(_PasswordsLoading) _then)
      : super(_value, (v) => _then(v as _PasswordsLoading));

  @override
  _PasswordsLoading get _value => super._value as _PasswordsLoading;
}

/// @nodoc

class _$_PasswordsLoading implements _PasswordsLoading {
  const _$_PasswordsLoading();

  @override
  String toString() {
    return 'PasswordsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PasswordsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordsInitial value) initial,
    required TResult Function(_PasswordsLoading value) loading,
    required TResult Function(_PasswordsLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PasswordsInitial value)? initial,
    TResult Function(_PasswordsLoading value)? loading,
    TResult Function(_PasswordsLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordsInitial value)? initial,
    TResult Function(_PasswordsLoading value)? loading,
    TResult Function(_PasswordsLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _PasswordsLoading implements PasswordsState {
  const factory _PasswordsLoading() = _$_PasswordsLoading;
}

/// @nodoc
abstract class _$PasswordsLoadedCopyWith<$Res> {
  factory _$PasswordsLoadedCopyWith(
          _PasswordsLoaded value, $Res Function(_PasswordsLoaded) then) =
      __$PasswordsLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$PasswordsLoadedCopyWithImpl<$Res>
    extends _$PasswordsStateCopyWithImpl<$Res>
    implements _$PasswordsLoadedCopyWith<$Res> {
  __$PasswordsLoadedCopyWithImpl(
      _PasswordsLoaded _value, $Res Function(_PasswordsLoaded) _then)
      : super(_value, (v) => _then(v as _PasswordsLoaded));

  @override
  _PasswordsLoaded get _value => super._value as _PasswordsLoaded;
}

/// @nodoc

class _$_PasswordsLoaded implements _PasswordsLoaded {
  const _$_PasswordsLoaded();

  @override
  String toString() {
    return 'PasswordsState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PasswordsLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordsInitial value) initial,
    required TResult Function(_PasswordsLoading value) loading,
    required TResult Function(_PasswordsLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PasswordsInitial value)? initial,
    TResult Function(_PasswordsLoading value)? loading,
    TResult Function(_PasswordsLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordsInitial value)? initial,
    TResult Function(_PasswordsLoading value)? loading,
    TResult Function(_PasswordsLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _PasswordsLoaded implements PasswordsState {
  const factory _PasswordsLoaded() = _$_PasswordsLoaded;
}

/// @nodoc
class _$SpeedDialStateTearOff {
  const _$SpeedDialStateTearOff();

  _SpeedDialClosed closed() {
    return const _SpeedDialClosed();
  }

  _SpeedDialOpened opened() {
    return const _SpeedDialOpened();
  }
}

/// @nodoc
const $SpeedDialState = _$SpeedDialStateTearOff();

/// @nodoc
mixin _$SpeedDialState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() closed,
    required TResult Function() opened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? closed,
    TResult Function()? opened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? closed,
    TResult Function()? opened,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SpeedDialClosed value) closed,
    required TResult Function(_SpeedDialOpened value) opened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SpeedDialClosed value)? closed,
    TResult Function(_SpeedDialOpened value)? opened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SpeedDialClosed value)? closed,
    TResult Function(_SpeedDialOpened value)? opened,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeedDialStateCopyWith<$Res> {
  factory $SpeedDialStateCopyWith(
          SpeedDialState value, $Res Function(SpeedDialState) then) =
      _$SpeedDialStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpeedDialStateCopyWithImpl<$Res>
    implements $SpeedDialStateCopyWith<$Res> {
  _$SpeedDialStateCopyWithImpl(this._value, this._then);

  final SpeedDialState _value;
  // ignore: unused_field
  final $Res Function(SpeedDialState) _then;
}

/// @nodoc
abstract class _$SpeedDialClosedCopyWith<$Res> {
  factory _$SpeedDialClosedCopyWith(
          _SpeedDialClosed value, $Res Function(_SpeedDialClosed) then) =
      __$SpeedDialClosedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SpeedDialClosedCopyWithImpl<$Res>
    extends _$SpeedDialStateCopyWithImpl<$Res>
    implements _$SpeedDialClosedCopyWith<$Res> {
  __$SpeedDialClosedCopyWithImpl(
      _SpeedDialClosed _value, $Res Function(_SpeedDialClosed) _then)
      : super(_value, (v) => _then(v as _SpeedDialClosed));

  @override
  _SpeedDialClosed get _value => super._value as _SpeedDialClosed;
}

/// @nodoc

class _$_SpeedDialClosed implements _SpeedDialClosed {
  const _$_SpeedDialClosed();

  @override
  String toString() {
    return 'SpeedDialState.closed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SpeedDialClosed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() closed,
    required TResult Function() opened,
  }) {
    return closed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? closed,
    TResult Function()? opened,
  }) {
    return closed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? closed,
    TResult Function()? opened,
    required TResult orElse(),
  }) {
    if (closed != null) {
      return closed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SpeedDialClosed value) closed,
    required TResult Function(_SpeedDialOpened value) opened,
  }) {
    return closed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SpeedDialClosed value)? closed,
    TResult Function(_SpeedDialOpened value)? opened,
  }) {
    return closed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SpeedDialClosed value)? closed,
    TResult Function(_SpeedDialOpened value)? opened,
    required TResult orElse(),
  }) {
    if (closed != null) {
      return closed(this);
    }
    return orElse();
  }
}

abstract class _SpeedDialClosed implements SpeedDialState {
  const factory _SpeedDialClosed() = _$_SpeedDialClosed;
}

/// @nodoc
abstract class _$SpeedDialOpenedCopyWith<$Res> {
  factory _$SpeedDialOpenedCopyWith(
          _SpeedDialOpened value, $Res Function(_SpeedDialOpened) then) =
      __$SpeedDialOpenedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SpeedDialOpenedCopyWithImpl<$Res>
    extends _$SpeedDialStateCopyWithImpl<$Res>
    implements _$SpeedDialOpenedCopyWith<$Res> {
  __$SpeedDialOpenedCopyWithImpl(
      _SpeedDialOpened _value, $Res Function(_SpeedDialOpened) _then)
      : super(_value, (v) => _then(v as _SpeedDialOpened));

  @override
  _SpeedDialOpened get _value => super._value as _SpeedDialOpened;
}

/// @nodoc

class _$_SpeedDialOpened implements _SpeedDialOpened {
  const _$_SpeedDialOpened();

  @override
  String toString() {
    return 'SpeedDialState.opened()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SpeedDialOpened);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() closed,
    required TResult Function() opened,
  }) {
    return opened();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? closed,
    TResult Function()? opened,
  }) {
    return opened?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? closed,
    TResult Function()? opened,
    required TResult orElse(),
  }) {
    if (opened != null) {
      return opened();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SpeedDialClosed value) closed,
    required TResult Function(_SpeedDialOpened value) opened,
  }) {
    return opened(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SpeedDialClosed value)? closed,
    TResult Function(_SpeedDialOpened value)? opened,
  }) {
    return opened?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SpeedDialClosed value)? closed,
    TResult Function(_SpeedDialOpened value)? opened,
    required TResult orElse(),
  }) {
    if (opened != null) {
      return opened(this);
    }
    return orElse();
  }
}

abstract class _SpeedDialOpened implements SpeedDialState {
  const factory _SpeedDialOpened() = _$_SpeedDialOpened;
}
