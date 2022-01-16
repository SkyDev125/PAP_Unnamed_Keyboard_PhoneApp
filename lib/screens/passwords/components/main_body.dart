//Import the files needed for the variables
// ignore: unused_import
import 'dart:developer';

import 'package:first_app/cards_store.dart';
import 'package:first_app/components/variables.dart';
import 'package:first_app/screens/cards_edit/passwords_page.dart';
import 'package:first_app/screens/cards_view/passwords_page.dart';

//Import the files needed for widgets
import 'package:flutter/material.dart';

//Import the files needed for the event handler
import 'package:first_app/bloc/passwords_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hive/hive.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

//Create the widget Main Body Class
class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  MainBodyState createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {
  //Reorders the cards in the array once a card is moved.
  void reorderData(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }

      final cardsBox = Hive.box('cards_data');

      final oldItem = cardsBox.getAt(oldIndex);
      final newItem = cardsBox.getAt(newIndex);

      cardsBox.putAt(oldIndex, newItem);
      cardsBox.putAt(newIndex, oldItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Sets the state of the bloc (event/state handler) (Listens for the state)
    final state = context.watch<PasswordsBloc>().state;

    //returns the Widget based on the state defined by the bloc
    return state.when(
        //Initial state, show logo in center
        initial: () =>
            Center(child: Image.asset('assets/app_image_dark/gift.png')),

        //Wait for reordable list to load and show loading progress indicator
        loading: () => const Center(child: CircularProgressIndicator()),

        //Return the reordable list once loaded
        loaded: () {
          return Scrollbar(
            child: ReorderableListView.builder(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 15,
                  bottom: MediaQuery.of(context).padding.bottom + 30,
                  left: MediaQuery.of(context).padding.left + 10,
                  right: MediaQuery.of(context).padding.right + 10,
                ),
                onReorder: reorderData,
                itemCount: cardsListLoading,

                //Runs for each item in the itemCount (above)
                itemBuilder: (BuildContext context, int index) {
                  if (cardsListLoading > 1) {
                    if (index < cardsListLoading - 1) {
                      return Container(
                          key: UniqueKey(),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(15, 0, 0, 0),
                                blurRadius: 12.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    0, 10), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: CardWidget(
                            index: index,
                          ));
                    } else {
                      return SingleWidgetLoading(
                          key: UniqueKey(), index: index);
                    }
                  } else {
                    return SingleWidgetLoading(key: UniqueKey(), index: index);
                  }
                }),
          );
        },

        //Return the reordable list once loaded
        cardEdited: () {
          return Scrollbar(
            child: ReorderableListView.builder(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 15,
                  bottom: MediaQuery.of(context).padding.bottom + 30,
                  left: MediaQuery.of(context).padding.left + 10,
                  right: MediaQuery.of(context).padding.right + 10,
                ),
                onReorder: reorderData,
                itemCount: cardsListLoading,

                //Runs for each item in the itemCount (above)
                itemBuilder: (BuildContext context, int index) {
                  if (cardOnEdit == index) {
                    return SingleWidgetLoading(key: UniqueKey(), index: index);
                  }

                  return Container(
                      key: UniqueKey(),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(15, 0, 0, 0),
                            blurRadius: 12.0,
                            spreadRadius: 0.0,
                            offset:
                                Offset(0, 10), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: CardWidget(
                        index: index,
                      ));
                }),
          );
        },

        //Update the reordable list once card finishes to load
        cardsLoaded: () {
          if (snackbarOn == 1) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            snackbarOn = 0;
          }

          final cardsBox = Hive.box('cards_data');

          //Define Reordable list padding, onreorder function,
          //total items in the list and start building the widgets inside
          return Scrollbar(
            child: ReorderableListView.builder(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 15,
                bottom: MediaQuery.of(context).padding.bottom + 30,
                left: MediaQuery.of(context).padding.left + 10,
                right: MediaQuery.of(context).padding.right + 10,
              ),
              onReorder: reorderData,
              itemCount: cardsBox.length,

              //Runs for each item in the itemCount (above)
              itemBuilder: (BuildContext context, int index) {
                //Sets the current widget

                //Returns the dismissible inside the card, so it can be dismissed
                //edit, delete
                return Container(
                  key: ValueKey(index),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(15, 0, 0, 0),
                        blurRadius: 12.0,
                        spreadRadius: 0.0,
                        offset: Offset(0, 10), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: ClipPath(
                    clipper: Customshape(),
                    key: ValueKey(index),
                    child: Container(
                      color: const Color(0xFF912CEE),
                      key: ValueKey(index),
                      child: Slidable(
                          key: ValueKey(index),

                          //slidable animation from left to right
                          startActionPane: ActionPane(
                            extentRatio: 3 / 5,
                            motion: const DrawerMotion(),
                            dismissible: DismissiblePane(
                                resizeDuration: const Duration(seconds: 0),
                                closeOnCancel: true,
                                dismissThreshold: 0.90,
                                confirmDismiss: () async {
                                  return await confirmDialogBox(context);
                                },
                                onDismissed: () =>
                                    cardDismissed(index, context)),
                            children: [
                              //Delete function
                              SlidableAction(
                                onPressed: (_) async {
                                  await confirmDialogBox(context)
                                      ? cardDismissed(index, context)
                                      : false;
                                },
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                              //Edit function
                              SlidableAction(
                                onPressed: (_) async {
                                  cardOnEdit = index;
                                  Navigator.pushNamed(
                                      context, CardsEdit.routeName);
                                },
                                backgroundColor: const Color(0xFF21B7CA),
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Edit',
                              ),
                              //View Function
                              SlidableAction(
                                onPressed: (_) async {
                                  cardOnEdit = index;
                                  Navigator.pushNamed(
                                      context, CardsView.routeName);
                                },
                                backgroundColor: const Color(0xFF912CEE),
                                foregroundColor: Colors.white,
                                icon: Icons.visibility,
                                label: 'View',
                              ),
                            ],
                          ),
                          //slidable animation from right to left
                          endActionPane: ActionPane(
                            extentRatio: 3 / 5,
                            motion: const DrawerMotion(),

                            //Dismiss the card if slided completely.
                            dismissible: DismissiblePane(
                                resizeDuration: const Duration(seconds: 0),
                                closeOnCancel: true,
                                dismissThreshold: 0.90,
                                //Confirm if the user wants to delete the card
                                confirmDismiss: () async =>
                                    await confirmDialogBox(context),
                                //Delete the card
                                onDismissed: () =>
                                    cardDismissed(index, context)),

                            //IconButtons for the slidable
                            children: [
                              //View Function
                              SlidableAction(
                                onPressed: (_) async {
                                  cardOnEdit = index;
                                  Navigator.pushNamed(
                                      context, CardsView.routeName);
                                },
                                backgroundColor: const Color(0xFF912CEE),
                                foregroundColor: Colors.white,
                                icon: Icons.visibility,
                                label: 'View',
                              ),
                              //Edit function
                              SlidableAction(
                                onPressed: (_) async {
                                  cardOnEdit = index;
                                  Navigator.pushNamed(
                                      context, CardsEdit.routeName);
                                },
                                backgroundColor: const Color(0xFF21B7CA),
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Edit',
                              ),
                              //Delete function
                              SlidableAction(
                                onPressed: (_) async {
                                  await confirmDialogBox(context)
                                      ? cardDismissed(index, context)
                                      : false;
                                },
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: CardWidget(index: index)),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }

  void cardDismissed(int index, BuildContext context) {
    return setState(() {
      final cardsBox = Hive.box('cards_data');
      CardInfo card = cardsBox.get(index);

      final String cardName = card.passwordFormURL;
      final String cardUserName = card.passwordFormUsername;
      cardsBox.deleteAt(index);

      if (cardsBox.isEmpty) {
        context
            .read<PasswordsBloc>()
            .add(const PasswordsEvent.allCardsRemoved());
      }
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$cardName's account '$cardUserName' deleted!",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      );
    });
  }

  Future confirmDialogBox(BuildContext context) {
    return showDialog(
      context: context,

      //Build the dialogBox
      builder: (BuildContext context) {
        return AlertDialog(
          //Set its shape to round and the title
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          title: const Text("Confirm", style: TextStyle(fontSize: 25)),

          //Define the content in the middle of the box
          content: const Text("Are you sure you wish to delete this PassWord?",
              style: TextStyle(fontSize: 20)),

          //Set the buttons for the user to confirm
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), //Dont Confirm
              child: const Text("CANCEL", style: TextStyle(fontSize: 20)),
            ),
            TextButton(
                onPressed: () => Navigator.of(context).pop(true), //Confirm
                child: const Text("DELETE", style: TextStyle(fontSize: 20))),
          ],
        );
      },
    );
  }
}

class SingleWidgetLoading extends StatelessWidget {
  final int index;
  const SingleWidgetLoading({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardsBox = Hive.box('cards_data');
    CardInfo card = cardsBox.get(index);
    return Container(
      key: UniqueKey(),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(15, 0, 0, 0),
            blurRadius: 12.0,
            spreadRadius: 0.0,
            offset: Offset(0, 10), // shadow direction: bottom right
          )
        ],
      ),
      child: Card(
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
              icon: const CircularProgressIndicator(),
              //icon: const Icon(Icons.open_in_browser_rounded),
              tooltip: 'Loading...',
              iconSize: 30,
              onPressed: () async {},
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
            ),
            Flexible(
                child: Text(
              card.passwordFormURL,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ]),
        ),

        //Make Card corners round with a 30 radius
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    double temp = 4.5;

    var path = Path();
    path.moveTo(temp + 40, temp);
    path.quadraticBezierTo(temp, temp, temp, temp + 40);
    path.lineTo(temp, height - 40);
    path.quadraticBezierTo(temp, height - temp, 40, height - temp);
    path.lineTo(width - temp - 40, height - temp);
    path.quadraticBezierTo(
        width - temp, height - temp, width - temp, height - 40);
    path.lineTo(width - temp, temp + 40);
    path.quadraticBezierTo(width - temp, temp, width - temp - 40, temp);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CardWidget extends StatelessWidget {
  final int index;
  const CardWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardsBox = Hive.box('cards_data');
    CardInfo card = cardsBox.get(index);

    return Card(
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
            icon: card.iconType == "svg"
                ? SvgPicture.network(
                    card.iconUrl,
                    placeholderBuilder: (context) =>
                        const CircularProgressIndicator(),
                  )
                : CachedNetworkImage(
                    imageUrl: card.iconUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
            //icon: const Icon(Icons.open_in_browser_rounded),
            tooltip: card.iconType == "error"
                ? "Icon Couldn't be loaded"
                : 'Open in browser',
            iconSize: 30,
            onPressed: () async {
              var url = 'http://' + card.passwordFormURL;
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
            card.passwordFormURL,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ]),
      ),

      //Make Card corners round with a 30 radius
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
    );
  }
}
