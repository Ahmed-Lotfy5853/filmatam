import 'dart:io';

import 'package:filmatam/customcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../model/models.dart';
import '../services/userapi.dart';
import 'restaurantitem.dart';

class PersonWidget extends StatefulWidget {
  PersonWidget({Key? key}) : super(key: key);
  File? _Image;

  @override
  State<PersonWidget> createState() => _PersonWidgetState();
}

class _PersonWidgetState extends State<PersonWidget> {
  final picker = ImagePicker();

  TextEditingController NameController = TextEditingController();

  TextEditingController LocationController = TextEditingController();

  int _selectedTabbar = 0;

  Future getImage(ImageSource src) async {
    try {
      final pickerFile = await picker.pickImage(source: src);
      if (pickerFile != null) {
        // final temporary = File(pickerFile.path);
        // setState(() {
        //
        //   this._Image = temporary;
        // });

        final imagePermanent = await saveImagePermanently(pickerFile.path);
        setState(() {
          // Accounts[0].Photo=pickerFile.path;
          this.widget._Image = imagePermanent;
        });
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    Accounts[0].Photo = '${directory.path}/$name';
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  user person = user();
  List<dynamic> wishlist = [];

  @override
  void initState() {
    connectApi()
        .getData(url: USER, query: data, token: token)
        .then((value) async {
      print(value);
      setState(() {
        person.Name = value.data['name'];
        person.email = value.data['email'];
        person.Following = value.data['following'];
        person.Followers = value.data['followers'];
        person.Tested_meals = value.data['tested_meals'];
        person.Location = value.data['city']??'القاهره';
        print(person.Location);
        // person.Name = value.data['name'];
        // person.Name = value.data['name'];
      });
    });
    connectApi()
        .getData(url: WISHLIST, query: data, token: token)
        .then((value) async {
      print(value);
      setState(() {
        wishlist = value.data;
        // person.Name = value.data['name'];
        // person.Name = value.data['name'];
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ((person.Name==null||person.Tested_meals==null||person.Followers==null||person.Following==null))?LinearProgressIndicator():Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    // splashColor: Colors.transparent,
                      onTap: () {
                        var alert = AlertDialog(
                          title: Text("اختر صورة :"),
                          content: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Divider(
                                  color: Colors.black,
                                ),
                                ListTile(
                                  leading: Icon(Icons.photo),
                                  title: Text("الاستوديو"),
                                  onTap: () {
                                    setState(() {
                                      getImage(ImageSource.gallery);
                                      Navigator.of(context).pop();
                                      // Image.file(_Image);
                                      // print(_Image.path);
                                      // Accounts[0].Photo = _Image.path;
                                    });
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.camera),
                                  title: Text("الكاميرا"),
                                  onTap: () {
                                    setState(() {
                                      getImage(ImageSource.camera);
                                      Navigator.of(context).pop();
                                      setState(() {
                                        // Accounts[0].Photo = _Image!.path;
                                        print('3' + Accounts[0].Photo);
                                      });
                                      // Image.file(_Image);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => alert);
                      },
                      child: ClipOval(
                        child: widget._Image == null
                            ? Image.asset(
                          Accounts[0].Photo,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        )
                            : Image.file(
                          widget._Image!,
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      )
                    // CircleAvatar(
                    //   radius: 53,
                    //   backgroundColor: Colors.white,
                    //   child: CircleAvatar(
                    //     radius: 50,
                    //     backgroundImage:
                    //     AssetImage(Accounts[0].Photo),
                    //   ),
                    // ),
                  ),
                  TextFormField(
                    controller: NameController,
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                        overflow: TextOverflow.visible,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: person.Name,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          overflow: TextOverflow.visible),
                      // contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/3),
                    ),
                    onFieldSubmitted: (string) {
                      setState(() {
                        if (!(string.isEmpty)) {
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
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextFormField(
                        controller: LocationController,
                        keyboardType: TextInputType.name,
                        style: TextStyle(fontSize: 25, color: Colors.grey),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey,
                            ),
                            hintText: person.Location,
                            border: InputBorder.none,
                            hintStyle:
                            TextStyle(fontSize: 25, color: Colors.grey)
                          // contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/3),

                        ),
                        onFieldSubmitted: (string) {
                          setState(() {
                            if (!(string.isEmpty)) {
                              person.Location = string;
                            }
                          });
                        },
                        validator: (string) {
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
                            '${person.Followers}',
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
                            '${person.Following}',
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
                            '${person.Tested_meals}',
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

                  Align(
                    alignment: Alignment.centerRight,

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'المفضله',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),

                ]),
          ),
        ),
        Visibility(
            visible: true,
            child: Flexible(
              child: GridView(
                // physics: NeverScrollableScrollPhysics(),
                //  shrinkWrap: true,
                padding: EdgeInsets.all(23),

                children: /* Restaurants.asMap().entries.map((RestaurantData){
                               int index = RestaurantData.key;
                              print(index);
                             */
                wishlist.map((
                    RestaurantData,
                    ) {
                  return RestaurantItem(
                    Name: RestaurantData.Name,
                    rate: RestaurantData.rate,
                    ImageLogo: RestaurantData.ImageLogo,
                    personreviews: RestaurantData.personreviews,
                    restaurantdescription: RestaurantData.restaurantdescription,
                    Branches: RestaurantData.branches,
                  );
                }).toList(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 165,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              ),
            ),),

      ],
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
