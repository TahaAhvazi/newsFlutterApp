import 'dart:convert';

import '../model/Article.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> getData() async {
  final response = await http.get(Uri.parse("http://10.0.2.2:8000/articles/"));

  if (response.statusCode == 200) {
    final result = json.decode(response.body).cast<Map<String, dynamic>>();

    return result.map<Article>((json) => Article.fromMap(json)).toList();
  } else {
    throw Exception("Error happend !");
  }
}
