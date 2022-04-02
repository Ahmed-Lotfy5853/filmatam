import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Product Page",
      style: TextStyle(
        fontSize: 30
      ),),
    );
  }
}
