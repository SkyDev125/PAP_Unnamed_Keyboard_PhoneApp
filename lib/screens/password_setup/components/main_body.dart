//Import the files needed for widgets
import 'dart:ui';
import 'package:favicon/favicon.dart' as favicon;

import 'package:first_app/components/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

//Imports needed for the Pages
import '/screens/passwords/bloc/passwords_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custum_input_box.dart';

//Create the widget Main Body Class
class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  MainBodyState createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {
  final _formKey = GlobalKey<FormState>();

  // ignore: prefer_typing_uninitialized_variables
  late String iconUrl;

  int cardsNumber = cardsList.length;

  @override
  Widget build(BuildContext context) {
    //Define _card Widget to be created by FAB
    Widget _card() {
      return Card(
        elevation: 10,

        //Set Card padding bottom and top
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16, top: 16),

          //Set Card row with its Icon Button and content
          child: Row(children: <Widget>[
            const Padding(padding: EdgeInsets.only(left: 15,),),
            IconButton(
              //TODO: Change Icon to url (favicon) - cached_network_image plugin take a look at this tomorrow please
              icon: const Icon(Icons.open_in_browser),
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
            const Padding(padding: EdgeInsets.only(left: 15,),),
            Flexible(child: Text(passwordsFormURL[cardsNumber], overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
          ]),
        ),

        //Make Card corners round with a 30 radius
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
      );
    }

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 35,
          bottom: MediaQuery.of(context).padding.bottom + 30,
          left: MediaQuery.of(context).padding.left + 10,
          right: MediaQuery.of(context).padding.right + 10,
        ),
        child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyCustomInputBox(
                    label: "Website",
                    inputHint: "www.example.com",
                    identifier: 0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2),
                  ),
                  MyCustomInputBox(
                    label: "Username",
                    inputHint: "Example312",
                    identifier: 1,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2),
                  ),
                  MyCustomInputBox(
                    label: "Password",
                    inputHint: "Ex@mple",
                    identifier: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: const Text(
                                'Processing Data',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        );
                        _formKey.currentState!.save();

                        iconUrl = (await favicon.Favicon.getBest(
                                'https://' + passwordsFormURL[cardsNumber]))
                            .toString();

                        cardsList.add(_card());

                        Navigator.of(context).pop();

                        context
                            .read<PasswordsBloc>()
                            .add(const PasswordsEvent.cardAdd());
                      }
                    },
                    child: const Text('Submit', style: TextStyle(fontSize: 20)),
                  )
                ])));
  }
}
