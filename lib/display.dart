import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  final id;
  final img;
  final list;
  final title;
  final recipe;

  const SearchPage({this.id, this.img, this.list, this.title, this.recipe});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  get list => widget.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBox) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xFF3B185F),
              expandedHeight: 200,
              floating: true,
              pinned: true,
              title: Text(
                "${widget.title}",
                style: GoogleFonts.adamina(
                    color: Color(0xFFFEC260), fontWeight: FontWeight.bold),
                textAlign: TextAlign.end,
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.id,
                  child: FadeInImage(
                    image: NetworkImage(widget.img),
                    placeholder: AssetImage('images/loading-bar.gif'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
          ];
        },
        body: Container(
          color: Color(0xFF3B185F),
          padding: const EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Ingredients',
                    style: GoogleFonts.bungee(
                        color: Color(0xFFA12568), fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.white,
                  endIndent: 10,
                  indent: 10,
                ),
                IngredientsWidget(
                  ingredients: list,
                ),
                Divider(
                  color: Colors.white,
                  endIndent: 10,
                  indent: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: SizedBox(
                    height: 40,
                    child: Text(
                      "Recipe",
                      style: GoogleFonts.bungee(
                          color: Color(0xFFA12568), fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  child: Text(
                    "${widget.recipe}",
                    style: GoogleFonts.quicksand(
                        color: Color(0xFFFEC260), fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IngredientsWidget extends StatelessWidget {
  final List<String>? ingredients;

  const IngredientsWidget({this.ingredients});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: ingredients!.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(
                backgroundColor: Color(0xFFA12568),
                label: Text(
                  ingredients![index],
                  style: const TextStyle(
                    color: Color(0xFFFEC260),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
