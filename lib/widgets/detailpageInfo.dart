import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailPageInfo extends StatelessWidget {
  const DetailPageInfo({
    Key? key,
    required this.title,
    required this.date,
    required this.detail,
  }) : super(key: key);

  final String title;
  final String date;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  date,
                  style: TextStyle(
                    fontFamily: 'cFont',
                    color: Color.fromARGB(255, 104, 103, 103),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 30.0,
                  width: 70.0,
                  child: const Center(
                    child: Text(
                      "New",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
              title,
              style: const TextStyle(
                fontFamily: 'dFont',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 507.0,
              width: double.infinity,
              child: ListView(
                children: [
                  Text(
                    detail,
                    style: const TextStyle(
                      fontFamily: 'eFont',
                      fontSize: 18,
                      color: Color.fromARGB(255, 22, 22, 22),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
