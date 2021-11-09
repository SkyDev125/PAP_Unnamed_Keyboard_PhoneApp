//Set the imports for the routes (pages)
import 'package:flutter/widgets.dart';

//Import the Pages
import 'screens/passwords/passwords_page.dart';
import 'screens/passwords_setup/passwords_page.dart';
import 'screens/settings/passwords_page.dart';

//Configure the pages that will exist in the application (when a button is pressed and a new scaffold is needed)
final Map<String, WidgetBuilder> routes = {

  //Go to the main page "/" where the application will start
  //
  //(the route "/" is set inside the class Passwords())
  PasswordsPage.routeName: (context) => const PasswordsPage(),

  //Go to the other pages
  PasswordsSetupPage.routeName: (context) => const PasswordsSetupPage(), 
  SettingsPage.routeName: (context) => const SettingsPage(),   
};