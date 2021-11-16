//Import the files needed for widgets
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        return const Center(
          child: Image(image: CachedNetworkImageProvider("http://google.com/favicon.ico"),)
        );
  }
}
