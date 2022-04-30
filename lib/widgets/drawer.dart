import 'package:filmatam/customcolor.dart';
import 'package:filmatam/screens/loginscreen.dart';
import 'package:filmatam/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../model/models.dart';
import '../screens/aboutusscreen.dart';
import '../services/userapi.dart';
import 'homewidget.dart';
import 'mealswidget.dart';
import 'restaurantwidget.dart';

class DrawerWidget extends StatefulWidget {
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // width: double.maxFinite,
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen(page: 1,)));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: CustomColor.MainColor,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/dummy/persons/person.png'),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "أحمد عماد الدين",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  size: 26,
                ),
                title: Text(
                  "الصفحه الرئيسيه",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen(page: 2,)));
                  //MainScreen(page: 2,)
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOutExpo,
                      type: PageTransitionType.leftToRightWithFade,
                      child: MainScreen(
                        page: 2,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.restaurant,
                  size: 26,
                ),
                title: Text(
                  "كل المطاعم",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOutExpo,
                      type: PageTransitionType.leftToRightWithFade,
                      child: MainScreen(page: 0),
                    ),
                  );

                  // Navigator.pop(context);

                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.production_quantity_limits,
                  size: 26,
                ),
                title: Text(
                  "كل المنتجات",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOutExpo,
                      type: PageTransitionType.leftToRightWithFade,
                      child: MainScreen(page: 3),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 26,
                ),
                title: Text(
                  "اتصل بنا",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOutExpo,
                      type: PageTransitionType.leftToRightWithFade,
                      child: MainScreen(page: 6),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.domain,
                  size: 26,
                ),
                title: Text(
                  "عنّا",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOutExpo,
                      type: PageTransitionType.leftToRightWithFade,
                      child: MainScreen(page: 5),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.output,
                  size: 26,
                ),
                title: Text(
                  "تسجيل خروج",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  print(token);
                  print(data);


    connectApi().postData(url: LOGOUT,token:token).then((value) async {
      Navigator.pushReplacement(
        context,
        PageTransition(
          duration: Duration(seconds: 2),
          curve: Curves.easeInOutExpo,
          type: PageTransitionType.leftToRightWithFade,
          child: LoginScreen(),
        ),
      );
    }).catchError((e)=>print(e));

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
