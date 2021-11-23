import 'package:flutter/material.dart';
import 'listview.dart';

class Cocktail extends StatefulWidget {
  const Cocktail({Key? key}) : super(key: key);

  @override
  _CocktailState createState() => _CocktailState();
}

class _CocktailState extends State<Cocktail> {
  @override
  Lists lists = new Lists();
  Widget build(BuildContext context) {
    return lists.getList("Alcoholic");
  }
}
