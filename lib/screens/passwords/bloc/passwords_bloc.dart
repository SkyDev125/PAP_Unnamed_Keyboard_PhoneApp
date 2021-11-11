//Import files necessary for Bloc (event/state manager) and freezed (easier development with bloc)
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

//Import files that are part of this one
part 'passwords_bloc.freezed.dart';
part 'passwords_event.dart';
part 'passwords_state.dart';

//React to events and emit states
class PasswordsBloc extends Bloc<PasswordsEvent, PasswordsState> {
  PasswordsBloc() : super(const PasswordsState.initial()) {
    //Run on Passwords Card Add event
    on<PasswordsCardAdd>((event, emit) async {
      emit(const PasswordsState.loading());
      emit(const PasswordsState.loaded());
    });

    //Run on Passwords All cards removed
    on<PasswordsAllCardsRemoved>((event, emit) async {
      emit(const PasswordsState.loading());
      emit(const PasswordsState.initial());
    });
  }
}

class SpeedDialBloc extends Bloc<SpeedDialEvent, SpeedDialState> {
  SpeedDialBloc() : super(const SpeedDialState.closed()) {
    //Run when speedDial is closed
    on<SpeedDialClose>((event, emit) async {
      emit(const SpeedDialState.closed());
    });
    //Run when speedDial is opened
    on<SpeedDialOpen>((event, emit) async {
      emit(const SpeedDialState.opened());
    });
  }
}
