import 'package:http/http.dart' as http;
import 'dart:convert';

class Drinks {
  String title;
  String imageUrl;
  String id;

  Drinks(this.title, this.imageUrl, this.id);
}
