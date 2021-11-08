part of 'passwords_bloc.dart';

@freezed
class PasswordsEvent with _$PasswordsEvent {
  const factory PasswordsEvent.cardAdd() = PasswordsCardAdd;
  const factory PasswordsEvent.allCardsRemoved() = PasswordsAllCardsRemoved;
} 
