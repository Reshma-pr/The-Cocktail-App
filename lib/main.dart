import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'display.dart';
import 'cocktails.dart';
import 'mocktails.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;
  static const List<Widget> _widgetOptions = [
    Cocktail(),
    Mocktails(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF2A0944),
          body: Center(
            child: _widgetOptions.elementAt(_currentIndex),
          ),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) {
              setState(() {
                _currentIndex = i;
              });
            },
            items: [
              SalomonBottomBarItem(
                icon: Icon(
                  FontAwesomeIcons.glassCheers,
                  color: Colors.white,
                ),
                title: Text("Cocktails"),
                selectedColor: Color(0xFFFEC260),
              ),
              SalomonBottomBarItem(
                icon: Icon(
                  FontAwesomeIcons.cocktail,
                  color: Colors.white,
                ),
                title: Text("Mocktails"),
                selectedColor: Color(0xFFFEC260),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
