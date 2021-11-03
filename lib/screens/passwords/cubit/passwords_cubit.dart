import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'passwords_state.dart';

class PasswordsCubit extends Cubit<PasswordsState> {
  PasswordsCubit() : super(PasswordsInitial());
}
