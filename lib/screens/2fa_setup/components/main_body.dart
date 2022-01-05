//Import the files needed for widgets
import 'package:flutter/material.dart';
import 'screens/manual_setup/passwords_page.dart';
import 'screens/qr_code_setup/qr_code_scanner.dart';

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 35,
            bottom: MediaQuery.of(context).padding.bottom + 30,
            left: MediaQuery.of(context).padding.left + 10,
            right: MediaQuery.of(context).padding.right + 10,
          )),
          const Text("Scan Qr Code:", style: TextStyle(fontSize: 25)),
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, QrCodeScan.routeName),
              icon: const Icon(Icons.qr_code_scanner),
              iconSize: 100,
              color: Theme.of(context).colorScheme.secondary,
              padding: const EdgeInsets.all(15)),
          const Text("Or", style: TextStyle(fontSize: 25)),
          const Padding(padding: EdgeInsets.all(7.5)),
          ElevatedButton(
            style: const ButtonStyle(),
            onPressed: () =>
                Navigator.pushNamed(context, TwoFAManual.routeName),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child:
                  Text("Enter Code Manually", style: TextStyle(fontSize: 25)),
            ),
          ),
        ],
      ),
    );
  }
}
