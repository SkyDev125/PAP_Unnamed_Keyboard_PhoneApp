//Import the files needed for the variables
import 'package:first_app/components/variables.dart';

//Import the files needed for widgets
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Import the files needed for the event handler
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:first_app/screens/passwords/bloc/passwords_bloc.dart';

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

    //Return FAB with tooltip, Icon and its action once pressed
    return FloatingActionButton(
      //onPressed: () => setState(() => _count++),
      onPressed: () {
        cardsList.add(_card());
        HapticFeedback.heavyImpact();
        context.read<PasswordsBloc>().add(const PasswordsEvent.cardAdd());
      },
      tooltip: 'Add Account',
      child: const Icon(Icons.add),
    );
  }
}
