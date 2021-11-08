//TODO 3: Check information about 2FA
//TODO 4: Make a menu for the floating action button
//TODO 5: Set configuration of Passwords and 2FA(if possible)
//TODO 6: Research about bluetooth or nfc connection between app and raspberry pi
//TODO 7: Implement the data receive and sent of information based on NFT or Bluetooth
//TODO 8: Figure a way to save the app data so it wont be lost if closed. (save widget)
//TODO 9: Get rid of the useless menu's and figure out something better

//Import the files needed for the application
import 'package:first_app/screens/passwords/bloc/passwords_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes.dart';

//Create main function which will run when the application starts
void main() {

  //Run AppLoop
  runApp(BlocProvider(                    //Assign the state-event manager
    create: (context) => PasswordsBloc(), //Set state-event manager
    child: const MyApp(),                 //Run the Main widget (application) class
  ));
}

//Create the first class to create the widgets
//
//StatelessWidget - Static widget, doesnt change midway/doesnt need to be updated
//
//StatefulWidget - Flexible widget, can be changed midway through events (event manager - bloc) 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override                                             //Override the widget so it uses what we programmed
  Widget build(BuildContext context) {                  
    return MaterialApp(                                 //Return MaterialApp widget
      debugShowCheckedModeBanner: false,                //Disable the debug banner in the top right corner of the app
      
      //Set application Title
      title: 'PAP Unnamed Project', 

      //Set application Themes                 
      theme: ThemeData.light().copyWith(                  //Light Theme
        colorScheme: ColorScheme.fromSwatch().copyWith(   //Override Color Schemne
          primary: Colors.blue,                           //Set Primary Color (AppBar)
          secondary: Colors.blue,                         //Set Secondary Color (Buttons, active button, snackbar)
        ),  
      ),  
      darkTheme: ThemeData.dark().copyWith(),             //Dark Theme
      
      //Set routes of the application (pages)
      routes: routes,                                   
    );
  }
}
