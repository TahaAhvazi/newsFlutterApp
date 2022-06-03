import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ArticleView extends StatelessWidget {
  String title;
  String category;
  String date;

  ArticleView(
      {Key? key,
      required this.title,
      required this.category,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        top: height * 1 / 100,
        left: width * 2 / 100,
        right: width * 2 / 100,
        bottom: height * 1 / 100,
      ),
      child: Container(
        width: width * 3 / 2,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            boxShadow: [
              const BoxShadow(
                color: Color.fromARGB(255, 163, 163, 163),
                blurRadius: 15.0,
                offset: Offset(0, 0.50),
              ),
            ],
            borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category,
                style: TextStyle(fontFamily: 'Bfont'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                maxLines: 1,
                date,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
