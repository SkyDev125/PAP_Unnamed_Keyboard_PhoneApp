//Import the files needed for widgets
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Import the file components where other widgets are stored separetly
import 'components/main_body.dart'; //Main Body widget
import 'components/bottom_nav_bar.dart'; //Bottom Navigation Bar Widget
import 'components/floating_action_button.dart'; //Float Action Button widget
import 'components/top_app_bar.dart'; //Top App Bar Widget

//Import the files needed for the event handler
import 'package:first_app/screens/passwords/bloc/passwords_bloc.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

//Set main class of this Page
class PasswordsPage extends StatelessWidget {
  const PasswordsPage({Key? key}) : super(key: key);

  static String routeName =
      "/"; //Setting the route name to "/" makes it the default page so the app starts here

  @override
  Widget build(BuildContext context) {
    //Sets the state of the bloc (event/state handler) (Listens for the state)
    final state = context.watch<SpeedDialBloc>().state;

    //returns the Widget based on the state defined by the bloc
    return state.when(

        //If SpeedDial is closed
        closed: () {
      //Start Widget Sequence but change the navigation bar color first
      return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
            systemNavigationBarColor: Theme.of(context).bottomAppBarColor,
          ),

          //Create the main scaffold (main page widget, house for all other widgets)
          child: const Scaffold(
            //Enable widgets get behind top and bottom App Bar, so they dont clip through
            extendBodyBehindAppBar: true, //Behind top App Bar
            extendBody: true, //Behind bottom App Bar

            //Imported Widgets
            appBar: TopAppBar(),
            body: MainBody(),
            bottomNavigationBar: BottomNavBar(),

            //Set FAB(Float Action Button) widget(imported) and its location on the bottom app bar
            floatingActionButton: FloatActionButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ));
    },

        //If SpeedDial is opened
        opened: () {
      //Start Widget Sequence but change the navigation bar color first
      return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
            systemNavigationBarColor: const Color.fromRGBO(51, 51, 51, 1),
          ),

          //Create the main scaffold (main page widget, house for all other widgets)
          child: const Scaffold(
            //Enable widgets get behind top and bottom App Bar, so they dont clip through
            extendBodyBehindAppBar: true, //Behind top App Bar
            extendBody: true, //Behind bottom App Bar

            //Imported Widgets
            appBar: TopAppBar(),
            body: MainBody(),
            bottomNavigationBar: BottomNavBar(),

            //Set FAB(Float Action Button) widget(imported) and its location on the bottom app bar
            floatingActionButton: FloatActionButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ));
    });
  }
}
