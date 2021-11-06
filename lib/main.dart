//TODO 2: Document the whole code, every single line
//TODO 3: Organize the code for better readability
//TODO 4: Check information about 2FA
//TODO 5: Set configuration of Passwords and 2FA(if possible)
//TODO 6: Research about bluetooth or nfc connection between app and raspberry pi
//TODO 7: Implement the data receive and sent of information based on NFT or Bluetooth
//TODO 8: Figure a way to save the app data so it wont be lost if closed. (save widget)
//TODO 9: Get rid of the useless menu's and figure out something better

import 'package:first_app/screens/passwords/bloc/passwords_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => PasswordsBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PAP Unnamed Project',
      theme: ThemeData.light().copyWith(
        canvasColor: Colors.transparent,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue,
          secondary: Colors.blue,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(),
      routes: routes,
    );
  }
}
