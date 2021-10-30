import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PAP Unnamed Keyboard',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<StatefulWidget> {
  int _count = 0;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Delete',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];
//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAP Unnamed Keyboard',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('PassWords'),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              _widgetOptions.elementAt(_selectedIndex),
              Text('You have pressed the button $_count times.')
              ]
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomAppBar(
            color: Colors.blue,
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: SizedBox(
              height: 60.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.vpn_key,
                      color: Colors.white,
                    ),
                    tooltip: 'Home',
                    onPressed: () => setState(() => _selectedIndex = 0),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    tooltip: 'Search',
                    onPressed: () => setState(() => _selectedIndex = 1),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      semanticLabel: "hey",
                    ),
                    tooltip: 'Delete',
                    onPressed: () => setState(() => _selectedIndex = 2),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    tooltip: 'Settings',
                    onPressed: () => setState(() => _selectedIndex = 3),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _count++),
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
