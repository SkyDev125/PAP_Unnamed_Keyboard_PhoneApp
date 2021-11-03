import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'passwords_state.dart';
part 'passwords_cubit.freezed.dart';

class PasswordsCubit extends Cubit<PasswordsState> {
  PasswordsCubit() : super(const PasswordsState.initial());
}
