import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:filmatam/customcolor.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/homewidget.dart';
import '../widgets/orderwidget.dart';
import '../widgets/personwidget.dart';
import '../widgets/productwidget.dart';
import '../widgets/restaurantwidget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 2;

  List<Widget> choice = [
    RestaurantWidget(),
    PersonWidget(),
    HomeWidget(),
    ProductWidget(),
    OrderWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
toolbarHeight: 70,        backgroundColor: Colors.white,
        //flexibleSpace: Image.asset('assets/PNG/Logo_arabic_coloredxx_icon.png',
        // ),
        title: Image.asset('assets/PNG/Logo_arabic_coloredxx.png',
        scale: 125,),
        centerTitle: true,

        iconTheme: IconThemeData(color: CustomColor.MainColor),
        actions: [

          // Expanded(child: Container()),
          // Image.asset('assets/PNG/Logo_arabic_coloredxx_icon.png',),
          // Expanded(child: Container()),
          IconButton(onPressed: null, icon: Icon(Icons.wallet_membership,color: CustomColor.MainColor,))
        ],
      ),
      body: choice[_page],
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: CurvedNavigationBar(

        index: _page,
        //height: 75.0,
        items: <Widget>[
          Icon(Icons.restaurant, size: 30,color: CustomColor.MainColor,),
          Icon(Icons.person, size: 30,color: CustomColor.MainColor,),
          Icon(Icons.home, size: 30,color: CustomColor.MainColor),
          Icon(Icons.production_quantity_limits, size: 30,color: CustomColor.MainColor),
          Icon(Icons.reviews, size: 30,color: CustomColor.MainColor),

        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: CustomColor.MainColor.shade50,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      drawer: DrawerWidget(),

    );
  }
}
