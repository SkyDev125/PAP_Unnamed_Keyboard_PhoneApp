//Import the files needed for widgets
import 'dart:ui';

import 'package:first_app/components/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

//Imports needed for the Pages
import '/screens/passwords/bloc/passwords_bloc.dart';
import 'custum_input_box.dart';

//Create the widget Main Body Class
class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  MainBodyState createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //Define _card Widget to be created by FAB
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
                      //TODO: figure out how to make the link be verified one last time before submiting!!!
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              duration: const Duration(days: 1),
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
                        snackbarOn = 1;
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
