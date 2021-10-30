import 'package:flutter/material.dart';
import 'package:myapp/Modifier/main_modifier_page.dart';
import 'package:myapp/Notifier/main_notifier.dart';
import 'package:myapp/Provider/main_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeProviderScreen(),
    HomeNotifierPage(),
    ModifierPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "home Provider"),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_rounded), label: "home Notifier"),
          BottomNavigationBarItem(
              icon: Icon(Icons.headphones_battery), label: "home Modifier")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
