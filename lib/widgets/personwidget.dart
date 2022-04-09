import 'package:flutter/material.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[ Text(
        "Person Page",
        style: TextStyle(fontSize: 30),
      ),]
    );
  }
}
