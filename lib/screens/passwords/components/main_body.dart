import 'package:first_app/components/variables.dart';
import 'package:flutter/material.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  MainBodyState createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {

  void reorderData(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
          padding: const EdgeInsets.only(top: 88, bottom: 65),
          onReorder: reorderData,
          itemCount: cardsList.length,
          itemBuilder: (BuildContext context, int index) {
            final card = cardsList[index];
            return Dismissible(
                key: ValueKey(card),
                confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        title: const Text("Confirm"),
                        content: const Text(
                            "Are you sure you wish to delete this PasrsWord?"),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("DELETE")),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("CANCEL"),
                          ),
                        ],
                      );
                    },
                  );
                },
                background: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    color: const Color(0xB2FF4D4D),
                    child: const Align(
                      alignment: Alignment(0.8, 0),
                      //todo: add text behind icon
                      child: Icon(Icons.delete, size: 35),
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    cardsList.removeAt(index);
                    //TODO: add cubit
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$index dismissed'),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  );
                },
                child: cardsList[index]);
          },
        );
  }
}