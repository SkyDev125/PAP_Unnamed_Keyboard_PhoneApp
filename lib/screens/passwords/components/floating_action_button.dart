//Import the files needed for the variables
import 'package:first_app/screens/2fa_setup/passwords_page.dart';
import 'package:first_app/screens/password_setup/passwords_page.dart';

//Import the files needed for widgets
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

//Import the files needed for the event handler
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

//Imports needed for the Pages
import '../../../bloc/passwords_bloc.dart';

//Create the widget Float Action Button Class
class FloatActionButton extends StatefulWidget {
  const FloatActionButton({Key? key}) : super(key: key);

  @override
  _FloatActionButtonState createState() => _FloatActionButtonState();
}

class _FloatActionButtonState extends State<FloatActionButton> {
  
  @override
  Widget build(BuildContext context) {
    void passwordAdd() {
      Navigator.pushNamed(context, PasswordSetupPage.routeName);
    }

    void twoFAadd() {
      Navigator.pushNamed(context, TwoFAsetupPage.routeName);
    }

    //cardsList.add(_card());
    //context.read<PasswordsBloc>().add(const PasswordsEvent.cardAdd());

    void onOpen() {
      HapticFeedback.heavyImpact();
      context.read<SpeedDialBloc>().add(const SpeedDialEvent.open());
    }

    void onClose() {
      HapticFeedback.heavyImpact();
      context.read<SpeedDialBloc>().add(const SpeedDialEvent.close());
    }

    //Return FAB with tooltip, Icon and its action once pressed
    return SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.remove,
        spacing: 3,
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 4,
        tooltip: 'Add Account',
        onOpen: () => onOpen(),
        onClose: () => onClose(),
        overlayColor: Theme.of(context).scaffoldBackgroundColor,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.password),
            label: 'New Password',
            onTap: () => passwordAdd(),
          ),
          SpeedDialChild(
            child: const Icon(Icons.two_k),
            label: 'New 2FA auth',
            onTap: () => twoFAadd(),
          ),
        ]);
  }
}
