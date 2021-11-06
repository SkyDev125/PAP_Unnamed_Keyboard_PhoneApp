part of 'passwords_bloc.dart';

@freezed
class PasswordsState with _$PasswordsState{
  const factory PasswordsState.initial() = _PasswordsInitial;
  const factory PasswordsState.loading() = _PasswordsLoading;
  const factory PasswordsState.loaded() = _PasswordsLoaded;
}
