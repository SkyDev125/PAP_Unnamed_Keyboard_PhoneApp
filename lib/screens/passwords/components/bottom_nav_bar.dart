//import the variables and constants needed
import 'package:first_app/components/constants.dart';
import 'package:first_app/components/variables.dart';
import 'package:first_app/screens/settings/passwords_page.dart';

//Import Widget components
import 'package:flutter/material.dart';

//Start the main Class
class BottomNavBar extends StatefulWidget {
  //Set the widget to statefull
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() =>
      _BottomNavBarState(); //Start main Widget with state
}

//Secondary class with the main widget inside (with state)
class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //Create the decoration for the Container
      decoration: const BoxDecoration(
        //List of widgets inside of Box Shadow
        boxShadow: <BoxShadow>[
          //Set the box shadow's color and blur radius
          BoxShadow(
            color: Color(0x1a000000),
            blurRadius: 20,
          ),
        ],
      ),

      //Create ClipRRect widget to round the top borders of the container
      child: ClipRRect(
        //Set the border radius only for top right and left
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),

        //Set the Bottom App bar
        child: BottomAppBar(
          //Create a notch around the Float Action Button (FAB) and define its size
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,

          //Create SizedBox to define Bottom App Bar's height
          child: SizedBox(
            height: 60.0,

            //Create Row of Icon Buttons
            child: Row(
              //Set icons alignment to be separated by the same padding
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              //Create a list of the Buttons for the Row
              children: <Widget>[
                IconButton(
                  //Set the Icon image & colour
                  icon: Icon(
                    bottomAppBarMenuIcons[
                        0], //Icon Image imported from an array
                    color: selectedIndex ==
                            0 //Set color based on button being selected or not
                        ? Theme.of(context).colorScheme.secondary //If selected
                        : Theme.of(context).iconTheme.color, //If not selected
                  ),

                  tooltip: bottomAppBarMenuTooltips[
                      0], //Set the tooltip for each button from an imported array

                  //Set Splash radius and color
                  splashRadius: 650,
                  splashColor: Theme.of(context).colorScheme.secondary,

                  //Run when button is pressed
                  onPressed: () => setState(() {
                    selectedIndex = 0; //Sets the index to the button pressed
                  }),
                ),
                IconButton(
                  //Set the Icon image & colour
                  icon: Icon(
                    bottomAppBarMenuIcons[
                        1], //Icon Image imported from an array
                    color: selectedIndex ==
                            1 //Set color based on button being selected or not
                        ? Theme.of(context).colorScheme.secondary //If selected
                        : Theme.of(context).iconTheme.color, //If not selected
                  ),

                  tooltip: bottomAppBarMenuTooltips[
                      1], //Set the tooltip for each button from an imported array

                  //Set Splash radius and color
                  splashRadius: 650,
                  splashColor: Theme.of(context).colorScheme.secondary,

                  //Run when button is pressed
                  onPressed: () => setState(() {
                    selectedIndex = 1; //Sets the index to the button pressed
                  }),
                ),
                IconButton(
                  //Set the Icon image & colour
                  icon: Icon(
                    bottomAppBarMenuIcons[
                        2], //Icon Image imported from an array
                    color: selectedIndex ==
                            2 //Set color based on button being selected or not
                        ? Theme.of(context).colorScheme.secondary //If selected
                        : Theme.of(context).iconTheme.color, //If not selected
                  ),

                  tooltip: bottomAppBarMenuTooltips[
                      2], //Set the tooltip for each button from an imported array

                  //Set Splash radius and color
                  splashRadius: 650,
                  splashColor: Theme.of(context).colorScheme.secondary,

                  //Run when button is pressed
                  onPressed: () => setState(() {
                    selectedIndex = 2; //Sets the index to the button pressed
                  }),
                ),
                IconButton(
                  //Set the Icon image & colour
                  icon: Icon(
                    bottomAppBarMenuIcons[
                        3], //Icon Image imported from an array
                    color: selectedIndex ==
                            3 //Set color based on button being selected or not
                        ? Theme.of(context).colorScheme.secondary //If selected
                        : Theme.of(context).iconTheme.color, //If not selected
                  ),

                  tooltip: bottomAppBarMenuTooltips[
                      3], //Set the tooltip for each button from an imported array

                  //Set Splash radius and color
                  splashRadius: 650,
                  splashColor: Theme.of(context).colorScheme.secondary,

                  //Run when button is pressed
                  onPressed: () => setState(() {
                    selectedIndex = 0; //Sets the index to the button pressed
                    Navigator.pushNamed(context, SettingsPage.routeName);
                  }),
                ),
              ], //
            ),
          ),
        ),
      ),
    );
  }
}
