//Set this file as part of bloc.dart
part of 'passwords_bloc.dart';

//RUN THIS for developing with freezed:
//! flutter pub run build_runner watch --delete-conflicting-outputs

//Freeze the class to make development easier
@freezed
class PasswordsState with _$PasswordsState {
  //Set states to be called:
  const factory PasswordsState.initial() = _PasswordsInitial; //Initial state
  const factory PasswordsState.loading() = _PasswordsLoading; //Loading state
  const factory PasswordsState.loaded() = _PasswordsLoaded; //Loaded state
  const factory PasswordsState.cardEdited() = _PasswordsCardEdited; //Loaded state
  const factory PasswordsState.cardsLoaded() = _PasswordsCardsLoaded; //Cards
}

@freezed
class SpeedDialState with _$SpeedDialState {
  //Set states to be called:
  const factory SpeedDialState.closed() = _SpeedDialClosed;
  const factory SpeedDialState.opened() = _SpeedDialOpened;
}
