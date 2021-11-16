//Import the files needed for the variables
import 'package:first_app/components/variables.dart';

//Import the files needed for widgets
import 'package:flutter/material.dart';

//Import the files needed for the event handler
import 'package:first_app/screens/passwords/bloc/passwords_bloc.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

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
      if (newIndex > oldIndex) {
        newIndex--;
      }
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
        if (snackbarOn == 1) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          snackbarOn = 0;
        }
        //Define Reordable list padding, onreorder function,
        //total items in the list and start building the widgets inside
        return ReorderableListView.builder(
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
            return Dismissible(
                direction: DismissDirection
                    .endToStart, //Direction of where widget can be dismissed (right to left)
                key: ValueKey(card), //Unique Identifier for the widget

                //Run to confirm the dismission, exhibit a dialogBox for comfirmation
                confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,

                    //Build the dialogBox
                    builder: (BuildContext context) {
                      return AlertDialog(
                        //Set its shape to round and the title
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        title: const Text("Confirm",
                            style: TextStyle(fontSize: 25)),

                        //Define the content in the middle of the box
                        content: const Text(
                            "Are you sure you wish to delete this PassWord?",
                            style: TextStyle(fontSize: 20)),

                        //Set the buttons for the user to confirm
                        actions: <Widget>[
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pop(false), //Dont Confirm
                            child: const Text("CANCEL",
                                style: TextStyle(fontSize: 20)),
                          ),
                          TextButton(
                              onPressed: () =>
                                  Navigator.of(context).pop(true), //Confirm
                              child: const Text("DELETE",
                                  style: TextStyle(fontSize: 20))),
                        ],
                      );
                    },
                  );
                },

                //Set Background of Dismissible
                background: ClipRRect(
                  //Cut corners to be equal to the rounded card
                  borderRadius: const BorderRadius.all(Radius.circular(30)),

                  //TODO: Search about slideable flutter to use instead of this
                  //Set Color and Icon for dismissible
                  child: Container(
                    color: const Color(0xB2FF4D4D),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("REMOVE", style: TextStyle(fontSize: 20)),
                        Icon(Icons.delete, size: 40),
                        Padding(padding: EdgeInsets.only(right: 30))
                      ],
                    ),
                  ),
                ),

                //Run once Dismissed, set the state and run accordingly
                onDismissed: (direction) {
                  setState(() {
                    cardsList.removeAt(index);
                    passwordsFormPassword.removeAt(index);
                    passwordsFormUsername.removeAt(index);
                    passwordsFormURL.removeAt(index);
                    if (cardsList.isEmpty) {
                      context
                          .read<PasswordsBloc>()
                          .add(const PasswordsEvent.allCardsRemoved());
                    }
                  });

                  //Create a snackbar once deleted, set its content, color and rounded corners
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$index dismissed',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  );
                },

                //Card to be dismissed
                child: cardsList[index]);
          },
        );
      },
    );
  }
}
