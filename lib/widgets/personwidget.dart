import 'dart:io';

import 'package:filmatam/customcolor.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models.dart';
import 'restaurantitem.dart';

class PersonWidget extends StatefulWidget {
   PersonWidget({Key? key}) : super(key: key);

  @override
  State<PersonWidget> createState() => _PersonWidgetState();
}

class _PersonWidgetState extends State<PersonWidget> {


late File  _Image;

final picker = ImagePicker();

  TextEditingController NameController = TextEditingController();

TextEditingController LocationController = TextEditingController();

   int _selectedTabbar = 0;


  Future getImage(ImageSource src) async{
final pickerFile = await picker.pickImage(source: src);
setState(() {
  if (pickerFile != null) {
    Accounts[0].Photo = pickerFile.path;
    _Image = File(pickerFile.path);
  }
});
}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                // splashColor: Colors.transparent,
                onTap: (){
                  var alert =  AlertDialog(
                    title: Text("اختر صورة :"),
                    content: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Divider(color: Colors.black,),
                          ListTile(leading: Icon(Icons.photo),title: Text("الاستوديو"),onTap: (){setState(() {
                            getImage(ImageSource.gallery);
                            // Image.file(_Image);
                            print(_Image.path);
                            Accounts[0].Photo = _Image.path;
                          });},),
                          ListTile(leading: Icon(Icons.camera),title: Text("الكاميرا"),onTap: (){setState(() {
                            getImage(ImageSource.camera);
                            print(_Image.path);
                            Accounts[0].Photo = _Image.path;
                            // Image.file(_Image);
                          });},),
                        ],
                      ),
                    ),
                  );
                  showDialog(context: context, builder: (BuildContext context)=>alert);
                },
                child:
                CircleAvatar(
                  radius: 53,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                    AssetImage(Accounts[0].Photo),
                  ),
                ),
              ),
              TextFormField(
                controller: NameController,
                keyboardType: TextInputType.name,
                style:TextStyle(overflow: TextOverflow.visible,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
                decoration: InputDecoration(

                  hintText: Accounts[0].Name,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                  overflow: TextOverflow.visible),
                  // contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/3),



                ),
                onFieldSubmitted: (string){
                  setState(() {
                   if(!(string.isEmpty)){
                     Accounts[0].Name = string;

                   }
                  });
                },

              ),
             /* Text(
                Accounts[0].Name,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),*/
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  child: TextFormField(
                    controller: LocationController,
                    keyboardType: TextInputType.name,
                    style:TextStyle(fontSize: 25, color: Colors.grey),
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      prefixIcon:  Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),

                      hintText: Accounts[0].Location,
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 25, color: Colors.grey)
                      // contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/3),



                    ),
                    onFieldSubmitted: (string){
                      setState(() {
                        if(!(string.isEmpty)){
                          Accounts[0].Location = string;

                        }
                      });
                    },
                    validator: (string){
                      if (string!.isEmpty) {
                        return 'حقل الاسم فارغاً';
                      }
                      return null;

                    },
                  ),
                ),
              ),
              // Divider(
              //   height: 20,
              //   color: Colors.grey,
              //
              //   // thickness: 0.7,
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              Divider(
                height: 20,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '${Accounts[0].followers}',
                        style: TextStyle(
                          color: CustomColor.MainColor,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'متابٍع',
                        style: TextStyle(fontSize: 25, color: Colors.grey),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '${Accounts[0].following}',
                        style: TextStyle(
                          color: CustomColor.MainColor,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'متابَع',
                        style: TextStyle(fontSize: 25, color: Colors.grey),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '${Accounts[0].TastedMeals}',
                        style: TextStyle(
                          color: CustomColor.MainColor,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'وجبه مذاقه',
                        style: TextStyle(fontSize: 25, color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
              Divider(
                height: 20,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              /* TabBarView(children: [
Container(width: 100,
height: 100,
color: Colors.red,),
                  Container(width: 50,
                    height: 50,
                    color: Colors.red,),
                ])*/
              TabBar(tabs: [
                Text('المفضله',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w200
                  ),),
                Text('الاعدادات',style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w200

                ),),
              ]),
              Expanded(
                child: TabBarView(

                  // physics: NeverScrollableScrollPhysics(),

                    children: [
                      GridView(

                        // physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.all(23),

                        children:/* Restaurants.asMap().entries.map((RestaurantData){
                       int index = RestaurantData.key;
                      print(index);
                     */Restaurants.map((RestaurantData)=>RestaurantItem(Name: RestaurantData.Name,rate:RestaurantData.rate,ImageLogo:RestaurantData.ImageLogo)).toList(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 165,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,


                        ),

                      ),
                      Center(child: Text('Welcome')),
                    ]),
              ),


            ]),
      ),
    );
  }
}
/*
Expanded(
                child: TabBarView(

                  // physics: NeverScrollableScrollPhysics(),

                    children: [
                      GridView(

                        // physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.all(23),

                        children:/* Restaurants.asMap().entries.map((RestaurantData){
                       int index = RestaurantData.key;
                      print(index);
                     */Restaurants.map((RestaurantData)=>RestaurantItem(Name: RestaurantData.Name,rate:RestaurantData.rate,ImageLogo:RestaurantData.ImageLogo)).toList(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 165,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,


                        ),

                      ),
                      Center(child: Text('Welcome')),
                    ]),
              ),
 */