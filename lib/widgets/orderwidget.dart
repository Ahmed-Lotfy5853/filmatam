import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Order Page",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
