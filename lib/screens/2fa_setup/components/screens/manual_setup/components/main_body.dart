//Import the files needed for widgets
import 'package:first_app/bloc/passwords_bloc.dart';
import 'package:first_app/cards_store.dart';
import 'package:flutter/material.dart';
import 'package:first_app/components/variables.dart';
import 'package:first_app/screens/password_setup/components/custum_input_box.dart';
import 'package:hive/hive.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

//Create the widget Main Body Class
class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  MainBodyState createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {
  int onlyonce = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 35,
        bottom: MediaQuery.of(context).padding.bottom + 30,
        left: MediaQuery.of(context).padding.left + 10,
        right: MediaQuery.of(context).padding.right + 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FormWidget(formKey: _formKey),
        ],
      ),
    );
  }
}

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          MyCustomInputBox(
            label: "Key",
            inputHint: "HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ",
            identifier: 3,
          ),
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
              await requestGET(url);
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
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                );

                _formKey.currentState!.save();
                final newCardInfo = CardInfo(formURL,
                    formUsername, formPassword, passwordTOTPUrl, "", "");
                Hive.box('cards_data').add(newCardInfo);
                snackbarOn = 1;
                Navigator.of(context).popUntil(ModalRoute.withName("/"));

                context
                    .read<PasswordsBloc>()
                    .add(const PasswordsEvent.cardAdd());
              }
            },
            child: const Text('Submit', style: TextStyle(fontSize: 20)),
          )
        ]));
  }
}
