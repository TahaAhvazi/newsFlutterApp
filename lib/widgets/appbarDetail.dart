import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppBarDetail extends StatelessWidget {
  const AppBarDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 40.0,
        width: double.infinity,
        child: Row(
          children: const [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 27, 27, 27),
            ),
            SizedBox(
              width: 280,
            ),
            Icon(
              Icons.share,
              color: Color.fromARGB(255, 27, 27, 27),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.save,
              color: Color.fromARGB(255, 27, 27, 27),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.keyboard_option_key,
              color: Color.fromARGB(255, 27, 27, 27),
            ),
          ],
        ),
      ),
    );
  }
}
