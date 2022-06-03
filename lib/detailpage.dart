import 'dart:convert';
import 'package:blog/model/ArticleDetail.dart';
import 'package:blog/widgets/appbarDetail.dart';
import 'package:blog/widgets/detailpageInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'model/Article.dart';

class DetailPage extends StatefulWidget {
  final int id;

  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<ArticleDetail> futureArticles;

  Future<ArticleDetail> getDetailData() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2:8000/articles/${widget.id}"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ArticleDetail.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futureArticles = getDetailData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticleDetail>(
      future: futureArticles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            body: Column(
              children: [
                const AppBarDetail(),
                DetailPageInfo(
                  title: snapshot.data!.title,
                  date: snapshot.data!.date,
                  detail: snapshot.data!.description,
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(snapshot.error.toString()),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
