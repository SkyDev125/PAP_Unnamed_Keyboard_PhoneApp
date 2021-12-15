//Import the files needed for widgets
import 'package:flutter/material.dart';
import 'screens/qr_code_scanner.dart';

//Create the widget Main Body Class
class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  MainBodyState createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {
  
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, QRViewExample.routeName),
            icon: const Icon(Icons.qr_code_scanner)),
      ],
    ));
  }
}