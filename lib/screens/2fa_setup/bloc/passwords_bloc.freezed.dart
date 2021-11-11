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
