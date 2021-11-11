//Import the files needed for the variables
import 'package:first_app/components/variables.dart';
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
import '/screens/passwords/bloc/passwords_bloc.dart';

//Create the widget Float Action Button Class
class FloatActionButton extends StatefulWidget {
  const FloatActionButton({Key? key}) : super(key: key);

  @override
  _FloatActionButtonState createState() => _FloatActionButtonState();
}

class _FloatActionButtonState extends State<FloatActionButton> {
  //Define _card Widget to be created by FAB
  Widget _card() {
    return Card(
      elevation: 10,

      //Set Card padding bottom and top
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 16),

        //Set Card row with its Icon Button and content
        child: Row(children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.vpn_key,
            ),
            tooltip: 'Home',
            iconSize: 30,
            onPressed: () => setState(() => selectedIndex = 0),
          ),
          //TODO: Rest of card content
        ]),
      ),

      //Make Card corners round with a 30 radius
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
    );
  }

  @override
  Widget build(BuildContext context) {
    void passwordAdd() {
      //cardsList.add(_card());
      //context.read<PasswordsBloc>().add(const PasswordsEvent.cardAdd());
      Navigator.pushNamed(context, PasswordSetupPage.routeName);
    }

    void twoFAadd() {
      //cardsList.add(_card());
      //context.read<PasswordsBloc>().add(const PasswordsEvent.cardAdd());
      Navigator.pushNamed(context, TwoFAsetupPage.routeName);
    }

    //Return FAB with tooltip, Icon and its action once pressed
    return SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.remove,
        spacing: 3,
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 4,
        tooltip: 'Add Account',
        onOpen: () => HapticFeedback.heavyImpact(),
        onClose: () => HapticFeedback.heavyImpact(),
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
