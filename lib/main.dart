import 'dart:convert';

import 'package:blog/detailpage.dart';
import 'package:blog/model/Article.dart';
import 'package:blog/services/getData.dart';
import 'package:blog/Animations/Animation.dart';
import 'package:blog/widgets/articleview.dart';
import 'package:blog/widgets/customsearchbox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Article>> futurearticle;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    futurearticle = getData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder<List<Article>>(
            future: futurearticle,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const MyAnimation(child: CustomSearchBox()),
                    MyAnimation(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: height * 2 / 100, left: width * 2 / 100),
                        child: const Text(
                          "News All Around The World ! ",
                          style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'Bfont',
                          ),
                        ),
                      ),
                    ),
                    MyAnimation(
                      child: SizedBox(
                        height: height * 30 / 100,
                        width: width,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          addAutomaticKeepAlives: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            MyAnimation(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: SizedBox(
                                    height: height * 25 / 100,
                                    width: width * 45 / 100,
                                    child: Image.asset(
                                      "assets/images/trump.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            MyAnimation(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Container(
                                    height: height * 25 / 100,
                                    width: width * 45 / 100,
                                    child: Image.asset(
                                      "assets/images/news.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: SizedBox(
                                  height: height * 25 / 100,
                                  width: width * 45 / 100,
                                  child: Image.asset(
                                    "assets/images/trump.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: width * 3 / 100,
                            bottom: height * 1 / 100,
                          ),
                          child: const Text(
                            "Todays Last News",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: width * 3 / 100,
                            bottom: height * 1 / 100,
                          ),
                          child: const Text(
                            "See all",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromARGB(255, 173, 173, 173),
                            ),
                          ),
                        ),
                      ],
                    ),
                    MyAnimation(
                      child: SizedBox(
                        height: height * 30 / 100,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data?.length,
                          itemBuilder: (_, index) => Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) => DetailPage(
                                          id: snapshot.data![index].id)),
                                    ),
                                  );
                                },
                                child: ArticleView(
                                  title: snapshot.data![index].title,
                                  category: snapshot.data![index].category,
                                  date: snapshot.data![index].description,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
