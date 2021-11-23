import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'listview.dart';

class Mocktails extends StatefulWidget {
  const Mocktails({Key? key}) : super(key: key);

  @override
  _MocktailsState createState() => _MocktailsState();
}

class _MocktailsState extends State<Mocktails> {
  Lists lists = new Lists();
  @override
  Widget build(BuildContext context) {
    return lists.getList("Non_Alcoholic");
  }
}
