import 'package:first_app/components/constants.dart';
import 'package:first_app/components/variables.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0x1a000000),
                blurRadius: 20,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: SizedBox(
                height: 60.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    for (int i = 0; i < 4; i++)
                      IconButton(
                        icon: Icon(
                          bottomAppBarMenuIcons[i],
                          color: selectedIndex == i
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).iconTheme.color,
                        ),
                        tooltip: bottomAppBarMenuTooltips[i],
                        splashRadius: 650,
                        splashColor: Theme.of(context).colorScheme.secondary,
                        onPressed: () => setState(() {
                          selectedIndex = i;
                        }),
                      ),
                  ], //
                ),
              ),
            ),
          ),
        );
  }
}