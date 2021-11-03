import 'package:first_app/components/variables.dart';
import 'package:flutter/material.dart';

class FloatActionButton extends StatefulWidget {
  const FloatActionButton({Key? key}) : super(key: key);

  @override
  _FloatActionButtonState createState() => _FloatActionButtonState();
}

class _FloatActionButtonState extends State<FloatActionButton> {

  Widget _card() {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.vpn_key,
            ),
            tooltip: 'Home',
            iconSize: 30,
            onPressed: () => setState(() => selectedIndex = 0),
          ),
        ]),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
          //onPressed: () => setState(() => _count++),
          onPressed: () => setState(() => cardsList.add(_card())),
          tooltip: 'Add Account',
          child: const Icon(Icons.add),
        );
  }
}