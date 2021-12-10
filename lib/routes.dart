//Set the imports for the routes (pages)
import 'package:flutter/widgets.dart';

//Import the Pages
import 'screens/2fa_setup/components/screens/qr_code_scanner.dart';
import 'screens/2fa_setup/passwords_page.dart';
import 'screens/password_setup/passwords_page.dart';
import 'screens/passwords/passwords_page.dart';
import 'screens/settings/passwords_page.dart';

//Configure the pages that will exist in the application (when a button is pressed and a new scaffold is needed)
final Map<String, WidgetBuilder> routes = {

  //Go to the main page "/" where the application will start
  //
  //(the route "/" is set inside the class Passwords())
  PasswordsPage.routeName: (context) => const PasswordsPage(),

  //Go to the other pages
  TwoFAsetupPage.routeName: (context) => const TwoFAsetupPage(),
  PasswordSetupPage.routeName: (context) => const PasswordSetupPage(), 
  SettingsPage.routeName: (context) => const SettingsPage(),
  QRViewExample.routeName: (context) => const QRViewExample(),   
};