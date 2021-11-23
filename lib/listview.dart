import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drinks.dart';
import 'display.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Lists {
  Future<List<Drinks>> getJson(String type) async {
    Uri url = Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=$type");
    http.Response data = await http.get(url);
    var jsonData = json.decode(data.body)["drinks"];
    List<Drinks> items = [];
    for (var da in jsonData) {
      Drinks d = Drinks(da["strDrink"], da["strDrinkThumb"], da["idDrink"]);
      items.add(d);
    }
    return items;
  }

  FutureBuilder getList(String type) {
    return FutureBuilder(
        future: getJson(type),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SpinKitChasingDots(
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return TextButton(
                  onPressed: () async {
                    var lis = await ingredients(snapshot.data[index].id);
                    var rec = await recipe(snapshot.data[index].id);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SearchPage(
                        id: snapshot.data[index].id,
                        img: snapshot.data[index].imageUrl,
                        list: lis,
                        title: snapshot.data[index].title,
                        recipe: rec,
                      );
                    }));
                  },
                  child: ListTile(
                    title: Text(
                      snapshot.data[index].title,
                      style: GoogleFonts.dancingScript(
                          color: Color(0xFFFEC260),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Image(
                      image: NetworkImage(snapshot.data[index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                    contentPadding: EdgeInsets.all(15),
                  ),
                );
              },
            );
          }
        });
  }

  Future<List<String>> ingredients(var id) async {
    http.Response response = await http.get(Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id"));
    List<String> ings = [];
    var jsonData = jsonDecode(response.body)["drinks"][0];
    for (int i = 1; i <= 15; i++) {
      var ing = jsonData["strIngredient$i"];
      if (ing == null) {
        break;
      } else {
        String s = ing.toString();
        ings.add(s);
      }
    }
    return ings;
  }

  Future<String> recipe(var id) async {
    http.Response response = await http.get(Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id"));
    var jsonData = jsonDecode(response.body)["drinks"][0];
    String rec = jsonData["strInstructions"];
    return rec;
  }
}
