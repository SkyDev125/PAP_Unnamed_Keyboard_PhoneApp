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
  //int _count = 0;

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

  final List<Widget> _cardList = [
    const Card(
      child: Padding(
        padding: EdgeInsets.only(bottom: 80),
      ),
    )
  ];

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
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
          top: Radius.circular(30),
        ),
      ),
    );
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: _cardList +
                  const <Widget>[
                    Card(
                      child: Padding(
                        padding: EdgeInsets.only(top: 60),
                      ),
                    ),
                  ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0x0f000000),
                blurRadius: 10,
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
                    IconButton(
                      icon: const Icon(
                        Icons.vpn_key,
                      ),
                      tooltip: 'Home',
                      onPressed: () => setState(() => _selectedIndex = 0),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.search_sharp,
                      ),
                      tooltip: 'Search',
                      onPressed: () => setState(() => _selectedIndex = 1),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        semanticLabel: "hey",
                      ),
                      tooltip: 'Delete',
                      onPressed: () => setState(() => _selectedIndex = 2),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.settings,
                      ),
                      tooltip: 'Settings',
                      onPressed: () => setState(() => _selectedIndex = 3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          //onPressed: () => setState(() => _count++),
          onPressed: () => setState(() => _cardList.add(_card())),
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
