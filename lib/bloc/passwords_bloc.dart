//Import files necessary for Bloc (event/state manager) and freezed (easier development with bloc)
import 'dart:developer';
import 'dart:io';
import 'package:first_app/cards_store.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart';
import 'package:bloc/bloc.dart';
import 'package:first_app/components/variables.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:favicon/favicon.dart' as favicon;

//Import files that are part of this one
part 'passwords_bloc.freezed.dart';
part 'passwords_event.dart';
part 'passwords_state.dart';

//React to events and emit states
class PasswordsBloc extends Bloc<PasswordsEvent, PasswordsState> {
  PasswordsBloc() : super(const PasswordsState.initial()) {
    //Run on Passwords Card Add Event
    on<PasswordsCardAdd>((event, emit) async {
      emit(const PasswordsState.loading());
      //get box's length
      final cardsBox = Hive.box('cards_data');
      final int boxsize = cardsBox.length - 1;
      CardInfo card = cardsBox.get(boxsize);
      log(card.passwordFormURL);
      log(card.passwordFormUsername);
      log(card.passwordFormPassword);
      log(card.passwordTOTPUrl);
      log(card.iconType);
      log(card.iconUrl);
      log("bitch");
      cardsListLoading = boxsize + 1;
      emit(const PasswordsState.loaded());

      try {
        //Define _card Widget to be created
        log("going to try");
        var iconUrl =
            await favicon.Favicon.getBest('http://' + card.passwordFormURL);

        final File _file = File(iconUrl!.url);

        switch (extension(_file.path)) {
          case '.svg':
            {
              card.iconUrl = _file.path;
              card.iconType = "svg";
              break;
            }

          default:
            {
              card.iconUrl = _file.path;
              card.iconType = "default";
              break;
            }
        }
      } catch (error) {
        card.iconUrl = "error";
        card.iconType = "error";
      }

      log(card.iconUrl);
      log(card.iconType);

      cardsBox.putAt(boxsize, card);
      emit(const PasswordsState.cardsLoaded());
    });

    //Run on Passwords Card Edit Event
    on<PasswordsCardEdit>((event, emit) async {
      emit(const PasswordsState.loading());
      final cardsBox = Hive.box('cards_data');
      CardInfo card = cardsBox.get(cardOnEdit);
      emit(const PasswordsState.cardEdited());

      try {
        //Define _card Widget to be created
        var iconUrl =
            await favicon.Favicon.getBest('http://' + card.passwordFormURL);

        final File _file = File(iconUrl!.url);

        switch (extension(_file.path)) {
          case '.svg':
            {
              card.iconUrl = _file.path;
              card.iconType = "svg";
              break;
            }

          default:
            {
              card.iconUrl = _file.path;
              card.iconType = "default";
              break;
            }
        }
      } catch (error) {
        card.iconUrl = "error";
        card.iconType = "error";
      }

      cardsBox.putAt(cardOnEdit, card);
      emit(const PasswordsState.cardsLoaded());
    });

    //Run on Passwords All cards removed
    on<PasswordsAllCardsRemoved>((event, emit) async {
      emit(const PasswordsState.loading());
      emit(const PasswordsState.initial());
    });

    on<PasswordCardEditIgnore>((event, emit) async {
      emit(const PasswordsState.loading());
      emit(const PasswordsState.loaded());
      emit(const PasswordsState.cardsLoaded());
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
