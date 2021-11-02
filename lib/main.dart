//TODO: Check information about 2FA
//TODO: Enhance the deletion of a widget
//TODO: Document the whole code, every single line
//TODO: Organize the code for better readability
//TODO: Set configuration of Passwords and 2FA(if possible)
//TODO: Research about bluetooth or nfc connection between app and raspberry pi
//TODO: Implement the data receive and sent of information based on NFT or Bluetooth
//TODO: Figure a way to save the app data so it wont be lost if closed. (save widget)
//TODO: Get rid of the useless menu's and figure out something better

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAP Unnamed Project',
      theme: ThemeData.light().copyWith(
        canvasColor: Colors.transparent,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue,
          secondary: Colors.blue,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<StatefulWidget> {
  int _selectedIndex = 0;
  final List<Widget> _cardsList = [];

  var bottomAppBarMenuIcons = [
    Icons.vpn_key,
    Icons.search_sharp,
    Icons.delete,
    Icons.settings
  ];
  var bottomAppBarMenuTooltips = ["Home", "Search", "Delete", "Settings"];

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
            onPressed: () => setState(() => _selectedIndex = 0),
          ),
        ]),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
    );
  }

  void reorderData(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Theme.of(context).bottomAppBarColor,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          elevation: 10,
          title: const Center(
            child: Text('PassWords'),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: ReorderableListView.builder(
          padding: const EdgeInsets.only(top: 88, bottom: 65),
          onReorder: reorderData,
          itemCount: _cardsList.length,
          itemBuilder: (BuildContext context, int index) {
            final card = _cardsList[index];
            return Dismissible(
                key: ValueKey(card),
                confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        title: const Text("Confirm"),
                        content: const Text(
                            "Are you sure you wish to delete this PassWord?"),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("DELETE")),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("CANCEL"),
                          ),
                        ],
                      );
                    },
                  );
                },
                background: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Container(
                        color: const Color(0xB2FF4D4D),
                        child: const Align(
                          alignment: Alignment(0.8, 0),
                            //todo: add text behind icon
                          child: Icon(Icons.delete, size: 35),
                        ),
                    ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    _cardsList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$index dismissed'),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  );
                },
                child: _cardsList[index]);
          },
        ),
        bottomNavigationBar: Container(
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
                          color: _selectedIndex == i
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).iconTheme.color,
                        ),
                        tooltip: bottomAppBarMenuTooltips[i],
                        splashRadius: 650,
                        splashColor: Theme.of(context).colorScheme.secondary,
                        onPressed: () => setState(() => _selectedIndex = i),
                      ),
                  ], //
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          //onPressed: () => setState(() => _count++),
          onPressed: () => setState(() => _cardsList.add(_card())),
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
