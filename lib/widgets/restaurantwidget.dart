import 'package:flutter/material.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Restaurant Page",
      style: TextStyle(
        fontSize: 30
      ),),
    );
  }
}
