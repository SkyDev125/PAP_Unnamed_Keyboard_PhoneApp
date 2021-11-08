import 'package:bloc/bloc.dart';
// ignore: unused_import
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'passwords_bloc.freezed.dart';
part 'passwords_event.dart';
part 'passwords_state.dart';

class PasswordsBloc extends Bloc<PasswordsEvent, PasswordsState> {
  PasswordsBloc() : super(const PasswordsState.initial()) {
    on<PasswordsCardAdd>((event, emit) async {
      emit(const PasswordsState.loading());
      emit(const PasswordsState.loaded());
    });

    on<PasswordsAllCardsRemoved>((event, emit) async {
      emit(const PasswordsState.loading());
      emit(const PasswordsState.initial());
    });
  }
}
