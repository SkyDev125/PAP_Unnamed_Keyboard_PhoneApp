//Import the files needed for widgets
import 'package:flutter/material.dart';

//Create the Top App Bar widget Class
class TopAppBar extends StatelessWidget with PreferredSizeWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Return the top App Bar with its elevation, title and shape
    return AppBar(
          elevation: 10,

          //Center the title
          title: const Center(
            child: Text('PassWords'),
          ),

          //Round the bottom corners
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        );
  }

  //Preffered Size
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}