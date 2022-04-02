import 'package:filmatam/customcolor.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // width: double.maxFinite,
        child: Drawer(
          backgroundColor: Colors.white,
          child:

             Column(
              children: [
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: CustomColor.MainColor,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/dummy/person.png'),
                        ),
                        Column(
                          children: [
                            Text("أحمد عماد الدين",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),),
                            // Text("Ahmed@gmail.com",
                            // style: TextStyle(
                            //   color: Colors.white,
                            //   fontSize: 25,
                            // ),),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home,
                    size: 26,
                  ),
                  title: Text(
                    "الصفحه الرئيسيه",
                    style: TextStyle(
                        fontSize: 24,

                    ),
                  ),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(Icons.restaurant,
                    size: 26,
                  ),
                  title: Text(
                    "كل المطاعم",
                    style: TextStyle(
                      fontSize: 24,

                    ),
                  ),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(Icons.production_quantity_limits,
                    size: 26,
                  ),
                  title: Text(
                    "كل امنتجات",
                    style: TextStyle(
                      fontSize: 24,

                    ),
                  ),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(Icons.phone,
                    size: 26,
                  ),
                  title: Text(
                    "اتصل بنا",
                    style: TextStyle(
                        fontSize: 24,
                    ),
                  ),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(Icons.domain,
                    size: 26,
                  ),
                  title: Text(
                    "عنّا",
                    style: TextStyle(
                        fontSize: 24,
                    ),
                  ),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(Icons.menu,
                    size: 26,
                  ),
                  title: Text(
                    "تسجيل خروج",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  onTap: (){},
                ),
              ],
            ),
          ),
      ),
    );
  }
}
