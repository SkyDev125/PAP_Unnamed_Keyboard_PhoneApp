//Import files necessary for Bloc (event/state manager) and freezed (easier development with bloc)
import 'dart:io';
import 'package:path/path.dart';

import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/components/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:favicon/favicon.dart' as favicon;
import 'package:url_launcher/url_launcher.dart';

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
      cardsListLoading = cardsList.length+1;
      emit(const PasswordsState.loaded());

      //Define _card Widget to be created
      int cardsNumber = cardsList.length;
      var iconUrl = (await favicon.Favicon.getBest(
          'http://' + passwordsFormURL[cardsNumber]));

      final File _file = File(iconUrl!.url);

      if (extension(_file.path) == ".svg") {
        Widget _card() {
          return Card(
            elevation: 10,
            key: UniqueKey(),

            //Set Card padding bottom and top
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 16),

              //Set Card row with its Icon Button and content
              child: Row(children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                ),
                IconButton(
                  icon: SvgPicture.network(
                    iconUrl.url,
                    placeholderBuilder: (context) =>
                        const CircularProgressIndicator(),
                  ),
                  //icon: const Icon(Icons.open_in_browser_rounded),
                  tooltip: 'Open in browser',
                  iconSize: 30,
                  onPressed: () async {
                    var url = 'http://' + passwordsFormURL[cardsNumber];
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                ),
                Flexible(
                    child: Text(
                  passwordsFormURL[cardsNumber],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ]),
            ),

            //Make Card corners round with a 30 radius
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
          );
        }

        cardsList.add(_card());
      } else {
        Widget _card() {
          return Card(
            elevation: 10,
            key: UniqueKey(),

            //Set Card padding bottom and top
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 16),

              //Set Card row with its Icon Button and content
              child: Row(children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                ),
                IconButton(
                  icon: CachedNetworkImage(
                    imageUrl: iconUrl.url,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  //icon: const Icon(Icons.open_in_browser_rounded),
                  tooltip: 'Open in browser',
                  iconSize: 30,
                  onPressed: () async {
                    var url = 'http://' + passwordsFormURL[cardsNumber];
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                ),
                Flexible(
                    child: Text(
                  passwordsFormURL[cardsNumber],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ]),
            ),

            //Make Card corners round with a 30 radius
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
          );
        }

        cardsList.add(_card());
      }

      emit(const PasswordsState.cardsLoaded());
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
