import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 228, 228, 228),
          borderRadius: BorderRadius.circular(22.0),
        ),
        height: height * 7 / 100,
        width: width * 95 / 100,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              size: 28,
              Icons.search,
              color: Color.fromARGB(255, 92, 92, 92),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Search ...",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 92, 92, 92),
              ),
            )
          ],
        ),
      ),
    );
  }
}
