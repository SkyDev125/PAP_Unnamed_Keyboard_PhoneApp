import 'package:first_app/components/variables.dart';
import 'package:first_app/screens/passwords/bloc/passwords_bloc.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

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
    final state = context.watch<PasswordsBloc>().state;

    return state.when(
      initial: () => const Center(child: FlutterLogo(size: 200)),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: () {
        return ReorderableListView.builder(
          padding:
              const EdgeInsets.only(top: 88, bottom: 65, left: 10, right: 10),
          onReorder: reorderData,
          itemCount: cardsList.length,
          itemBuilder: (BuildContext context, int index) {
            final card = cardsList[index];
            return Dismissible(
                direction: DismissDirection.endToStart,
                key: ValueKey(card),
                confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        title: const Text("Confirm",
                            style: TextStyle(fontSize: 25)),
                        content: const Text(
                            "Are you sure you wish to delete this PassWord?",
                            style: TextStyle(fontSize: 20)),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("DELETE",
                                  style: TextStyle(fontSize: 20))),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("CANCEL",
                                style: TextStyle(fontSize: 20)),
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
                onDismissed: (direction) {
                  setState(() {
                    cardsList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$index dismissed'),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  );
                },
                child: cardsList[index]);
          },
        );
      },
    );
  }
}
