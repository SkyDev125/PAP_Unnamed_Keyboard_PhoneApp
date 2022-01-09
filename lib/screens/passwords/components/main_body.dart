//Import the files needed for the variables
// ignore: unused_import
import 'dart:developer';

import 'package:first_app/components/variables.dart';
import 'package:first_app/screens/cards_edit/passwords_page.dart';

//Import the files needed for widgets
import 'package:flutter/material.dart';

//Import the files needed for the event handler
import 'package:first_app/bloc/passwords_bloc.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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

      final item = cardsList.removeAt(oldIndex);
      final url = passwordsFormURL.removeAt(oldIndex);
      final username = passwordsFormUsername.removeAt(oldIndex);
      final password = passwordsFormPassword.removeAt(oldIndex);
      final totpUrl = passwordsTOTPUrl.removeAt(oldIndex);

      cardsList.insert(newIndex, item);
      passwordsFormURL.insert(newIndex, url);
      passwordsFormUsername.insert(newIndex, username);
      passwordsFormPassword.insert(newIndex, password);
      passwordsTOTPUrl.insert(newIndex, totpUrl);
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
                          child: cardsList[index]);
                    } else {
                      return SingleWidgetLoaded(key: UniqueKey(), index: index);
                    }
                  } else {
                    return SingleWidgetLoaded(key: UniqueKey(), index: index);
                  }
                }),
          );
        },

        //Update the reordable list once card finishes to load
        cardsLoaded: () {
          if (snackbarOn == 1) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            snackbarOn = 0;
          }

          //?log variables info:
          //?log(cardsList.length.toString());
          //?log(passwordsFormURL.length.toString());
          //?log(passwordsFormUsername.length.toString());
          //?log(passwordsFormPassword.length.toString());
          //?log(passwordsTOTPUrl.length.toString());
          //?
          //?log(passwordsFormURL[cardsList.length - 1].toString());
          //?log(passwordsFormUsername[cardsList.length - 1].toString());
          //?log(passwordsFormPassword[cardsList.length - 1].toString());
          //?log(passwordsTOTPUrl[cardsList.length - 1].toString());

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
              itemCount: cardsList.length,

              //Runs for each item in the itemCount (above)
              itemBuilder: (BuildContext context, int index) {
                //Sets the current widget
                final card = cardsList[index];

                //Returns the dismissible inside the card, so it can be dismissed
                //edit, delete
                return Container(
                  key: ValueKey(card),
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
                  child: ClipRRect(
                    key: ValueKey(card),
                    borderRadius: BorderRadius.circular(30.0),
                    child: Slidable(
                        key: ValueKey(card),

                        //slidable animation from right to left
                        startActionPane: ActionPane(
                          motion: const DrawerMotion(),
                          dismissible: DismissiblePane(
                              closeOnCancel: true,
                              dismissThreshold: 0.80,
                              confirmDismiss: () async {
                                return await confirmDialogBox(context);
                              },
                              onDismissed: () => cardDismissed(index, context)),
                          children: [
                            SlidableAction(
                              onPressed: (_) async {
                                log(index.toString());
                                log(passwordsFormURL[index]);
                                await confirmDialogBox(context)
                                    ? cardDismissed(index, context)
                                    : false;
                              },
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                            SlidableAction(
                              onPressed: (_) async {
                                Navigator.pushNamed(
                                    context, CardsEdit.routeName);
                              },
                              backgroundColor: const Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Edit',
                            ),
                          ],
                        ),
                        //slidable animation from left to right
                        endActionPane: ActionPane(
                          motion: const DrawerMotion(),

                          //Dismiss the card if slided completely.
                          dismissible: DismissiblePane(
                              closeOnCancel: true,
                              dismissThreshold: 0.80,
                              //Confirm if the user wants to delete the card
                              confirmDismiss: () async =>
                                  await confirmDialogBox(context),
                              //Delete the card
                              onDismissed: () => cardDismissed(index, context)),

                          //IconButtons for the slidable
                          children: [
                            //Edit function
                            SlidableAction(
                              onPressed: (_) async {
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
                                log(index.toString());
                                log(passwordsFormURL[index]);
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
                        child: cardsList[index]),
                  ),
                );
              },
            ),
          );
        });
  }

  void cardDismissed(int index, BuildContext context) {
    return setState(() {
      final String cardName = passwordsFormURL[index];
      final String cardUserName = passwordsFormUsername[index];
      cardsList.removeAt(index);
      passwordsFormPassword.removeAt(index);
      passwordsFormUsername.removeAt(index);
      passwordsFormURL.removeAt(index);
      passwordsTOTPUrl.removeAt(index);

      if (cardsList.isEmpty) {
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

class SingleWidgetLoaded extends StatelessWidget {
  final int index;
  const SingleWidgetLoaded({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              passwordsFormURL[index],
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
