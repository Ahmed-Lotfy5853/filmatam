import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:filmatam/customcolor.dart';
import 'package:filmatam/screens/contactusscreen.dart';
import 'package:flutter/material.dart';

import '../widgets/customappbar.dart';
import '../widgets/customnavigationnbarwidget.dart';
import '../widgets/drawer.dart';
import '../widgets/homewidget.dart';
import '../widgets/orderwidget.dart';
import '../widgets/personwidget.dart';
import '../widgets/productwidget.dart';
import '../widgets/restaurantwidget.dart';
import 'aboutusscreen.dart';

List<Widget> choice = [
  RestaurantWidget(),
  PersonWidget(),
  HomeWidget(),
  ProductWidget(),
  OrderWidget(),
  AboutusScreen(),
  ContactusScreen(),
];

class MainScreen extends StatefulWidget {
  int page = 2;

  MainScreen({
    required this.page,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(widget.page),
      body: choice[widget.page],
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: CustomNavigationBarWidget(
          Index: widget.page < 5 ? widget.page : 2,
          Color: CustomColor.MainColor,
          bColor:
              widget.page < 5 ? CustomColor.MainColor.shade50 : Colors.white,
          Ontap: (index) {
            setState(() {
              widget.page = index;
            });
          }),
      drawer: DrawerWidget(),
    );
  }
}
