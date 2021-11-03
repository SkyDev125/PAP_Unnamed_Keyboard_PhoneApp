//TODO: Figure out how to use cubits and blocs
//TODO: Document the whole code, every single line
//TODO: Organize the code for better readability
//TODO: Check information about 2FA
//TODO: Set configuration of Passwords and 2FA(if possible)
//TODO: Research about bluetooth or nfc connection between app and raspberry pi
//TODO: Implement the data receive and sent of information based on NFT or Bluetooth
//TODO: Figure a way to save the app data so it wont be lost if closed. (save widget)
//TODO: Get rid of the useless menu's and figure out something better

import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/passwords/cubit/passwords_cubit.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => PasswordsCubit(),
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
