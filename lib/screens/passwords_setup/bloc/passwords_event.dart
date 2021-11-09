//Set this file as part of bloc.dart
part of 'passwords_bloc.dart';

//RUN THIS for developing with freezed: 
//! flutter pub run build_runner watch --delete-conflicting-outputs

//Freeze the class to make development easier
@freezed
class PasswordsEvent with _$PasswordsEvent {

  //Set events to be called:
  const factory PasswordsEvent.cardAdd() = PasswordsCardAdd;                  //Passwords Card added event
  const factory PasswordsEvent.allCardsRemoved() = PasswordsAllCardsRemoved;  //Passwords All cards removed event
} 
