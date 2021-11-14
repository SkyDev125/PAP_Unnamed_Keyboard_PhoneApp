//Import the files needed for widgets
import 'package:flutter/material.dart';

import 'custum_input_box.dart';

//Create the widget Main Body Class
class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  MainBodyState createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {
  //Reorders the cards in the array once a card is moved.
  void reorderData(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 15,
          bottom: MediaQuery.of(context).padding.bottom + 30,
          left: MediaQuery.of(context).padding.left + 10,
          right: MediaQuery.of(context).padding.right + 10,
        ),
        child: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              MyCustomInputBox(label: "Website", inputHint: "www.example.com"),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              MyCustomInputBox(label: "Username", inputHint: "Example312"),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              MyCustomInputBox(label: "Password", inputHint: "Ex@mple"),
            ])
          ],
        ));
  }
}
