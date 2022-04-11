import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

Widget CustomNavigationBarWidget({Index, Color, bColor, Ontap}) {
  return CurvedNavigationBar(
    index: Index,
    //height: 75.0,
    items: <Widget>[
      Icon(
        Icons.restaurant,
        size: 30,
        color: Color,
      ),
      Icon(
        Icons.person,
        size: 30,
        color: Color,
      ),
      Icon(Icons.home, size: 30, color: Color),
      Icon(Icons.production_quantity_limits, size: 30, color: Color),
      Icon(Icons.reviews, size: 30, color: Color),
    ],
    color: Colors.white,
    buttonBackgroundColor: Colors.white,
    backgroundColor: bColor,
    animationCurve: Curves.easeInOut,
    animationDuration: Duration(milliseconds: 600),
    onTap: Ontap,

    letIndexChange: (index) => true,
  );
}
