import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmatam/customcolor.dart';
import 'package:filmatam/main.dart';
import 'package:filmatam/widgets/imageslider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';
import '../screens/mainscreen.dart';
import 'mealitem.dart';
import 'restaurantitem.dart';
import '../services/userapi.dart';

class MealsWidget extends StatefulWidget {

  MealsWidget({Key? key}) : super(key: key);

  @override
  State<MealsWidget> createState() => _MealsWidgetState();
}

class _MealsWidgetState extends State<MealsWidget> {
  TextEditingController SearchController = TextEditingController();

  List search_result=[];

  bool re = false;

  List<String>  Filter = ['title','rate','price'];

  var searchkey =    GlobalKey<FormState>();

  String FilterSelection = 'title';

  void search({required String filter,required String search_keyword}){
    setState(() {
      re = true;
    });
    search_result = Plates.where((element) {
      print(element['$filter']);
      print(search_keyword);
      print(element['$filter'].toString()== search_keyword.toString());

        return element['$filter'].toString()== search_keyword.toString();

    }).toList();
// if(search_result == []) {
//       setState(() {
//         search_result = [-1];
//       });
//     }
    print(search_result);
  }
  @override
  void initState() {
    connectApi.init();
    connectApi()
          .getData(url: CATEGORY, query: data, token: token)
        .then((value) async {

      // print(Cities);
      setState(() {
        Caategory = value.data;
        // print(Caategory[4]['plates']);
        //  print();

        Caategory.removeWhere((element) {
          // print('${element['plates']}     ${element['plates'].isEmpty }\n');
          return element['plates'].isEmpty;
        });


        // print(Caategory);



         // print(Caategory[0]['plates'][0]['title']);
        // value.data.forEach((e)=>Cities.add(e['name_ar']));
        // person.Name = value.data['name'];
        // person.Name = value.data['name'];


//Caategory.map((e)=>ListView.separated(physics:NeverScrollableScrollPhysics(),shrinkWrap: true,scrollDirection: Axis.horizontal,itemBuilder: (_,int index)=>MealItem(Name: e['plates'][index]['title'], ImageLogo: e['plates'][index]['title'], rate: e['plates'][index]['title'], price: e['plates'][index]['title']), itemCount: e['plates'].length, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 20,) ,)).toList(),))
//


      });
    });

    connectApi()
        .getData(url: MEALS, query: data, token: token)
        .then((value) async {

      // print(Cities);
      setState(() {
        Plates = value.data;
        // print(Caategory[4]['plates']);
          print(Plates);
        Plates.removeWhere((element) {
          // print('${element['plates']}     ${element['plates'].isEmpty }\n');
          return element['images'].isEmpty;
        });

       /* Caategory.removeWhere((element) {
          // print('${element['plates']}     ${element['plates'].isEmpty }\n');
          return element['plates'].isEmpty;
        });*/
        //Black Bean Soup
        // Blac


        // print(Caategory);



        // print(Caategory[0]['plates'][0]['title']);
        // value.data.forEach((e)=>Cities.add(e['name_ar']));
        // person.Name = value.data['name'];
        // person.Name = value.data['name'];


//Caategory.map((e)=>ListView.separated(physics:NeverScrollableScrollPhysics(),shrinkWrap: true,scrollDirection: Axis.horizontal,itemBuilder: (_,int index)=>MealItem(Name: e['plates'][index]['title'], ImageLogo: e['plates'][index]['title'], rate: e['plates'][index]['title'], price: e['plates'][index]['title']), itemCount: e['plates'].length, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 20,) ,)).toList(),))
//


      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Restaurants.isEmpty?LinearProgressIndicator():Container(
      width: double.infinity,
      // padding: EdgeInsets.symmetric(horizontal: 25),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
            child: Form(
              key: searchkey,
              child: TextFormField(
                controller: SearchController,
                keyboardType: TextInputType.text,

                style: TextStyle(
                  fontSize: 25,
                ),
                decoration: InputDecoration(
                    hintText: 'جد وجبه',
                    hintStyle: TextStyle(fontSize: 25),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 30,
                        color: CustomColor.MainColor,
                        splashColor: Colors.transparent,
                        splashRadius: 20,
                        onPressed: () {
                          setState(() {
                            if(searchkey.currentState!.validate()){
                              search(search_keyword: SearchController.text,filter: FilterSelection);
                            }
                          });
                        },
                      ),
                    ),
                    suffixIconColor: CustomColor.MainColor,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 20.0,left: 20,bottom: 20),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<dynamic>(

                          // value: FilterSelection,
                            icon: Icon(Icons.filter_list,size:30,color:CustomColor.MainColor),
                            items: Filter.map((e) {
                              return DropdownMenuItem(
                                  value: e,
                                  child: Text(e));
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                FilterSelection = val!;
                              });
                            }),
                      ),
                    ),
                    prefixIconColor: CustomColor.MainColor,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    )),
                validator: (str) {

    if (str!.isEmpty) {
    return 'حقل البحث فارغاً';
    }
    return null;
    },
              ),
            ),
          ),
          Container(
            height: 200,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // color: Colors.red
              // boxShadow: [
              //   BoxShadow(
              //       color: CustomColor.MainColor.withOpacity(0.4),
              //       offset: Offset(2,2),
              //       blurRadius:10
              //   ),
              // ]
            ),
            margin: EdgeInsets.symmetric(vertical: 25),
            // padding: EdgeInsets.symmetric(horizontal: 25),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) => InkWell(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // height: 120,

                        constraints: BoxConstraints(maxHeight:120 ),
                        child: Image.network(
                          '${Caategory[index]['icon']}',
                          // scale: 4,
                           // cacheWidth: 500,
                           // cacheHeight: 500,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        Caategory[index]['name'],
                        style: TextStyle(
                          fontSize: 25,
                          // color: Colors.blackR
                        ),
                      )
                    ],
                  ),
                ),
                onTap: null,
              ),
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: 20,
              ),
              itemCount: Caategory.length,
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20),
            child: Text(
              'وجبات رائجه',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Visibility(
            visible: (!re ),
            child: Container(
              height: 275,
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: Colors.red,
                // boxShadow: [
                //   BoxShadow(
                //       color: CustomColor.MainColor.withOpacity(0.4),
                //       offset: Offset(2,2),
                //       blurRadius:10
                //   ),
                // ]
              ),
              margin: EdgeInsets.symmetric(vertical: 20),
              // padding: EdgeInsets.symmetric(horizontal: 25),
              child:
              ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  // Caategory[0]['plates'][0]['title']
                  //  print(Caategory[index]['plates']['title']);

                  return MealItem(
                    Name: Plates[index]['title'],
                    ImageLogo: Plates[index]['images'][0]['url'],
                    rate: Plates[index]['rate'],//'${Meals[index].rate}',
                    price: '${Plates[index]['price']}',
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 20,
                ),
                itemCount: Plates.length,
              ),
            ),
          ),
          Visibility(
            visible: (search_result.isNotEmpty && re),
            child: Container(
              height: 275,
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: Colors.red,
                // boxShadow: [
                //   BoxShadow(
                //       color: CustomColor.MainColor.withOpacity(0.4),
                //       offset: Offset(2,2),
                //       blurRadius:10
                //   ),
                // ]
              ),
              margin: EdgeInsets.symmetric(vertical: 20),
              // padding: EdgeInsets.symmetric(horizontal: 25),
              child:
              ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  // Caategory[0]['plates'][0]['title']
                  //  print(Caategory[index]['plates']['title']);

                  return MealItem(
                    Name: search_result[index]['title'],
                    ImageLogo: search_result[index]['images'][0]['url'],
                    rate: search_result[index]['rate'],//'${Meals[index].rate}',
                    price: '${search_result[index]['price']}',
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 20,
                ),
                itemCount: search_result.length,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20),
            child: Text(
              'وجبات مميزه',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: CarouselSlider.builder(
                options: CarouselOptions(
                    initialPage: 0,
                    height: 300,
                    enlargeCenterPage: true,
                    pauseAutoPlayOnTouch: false,
                    autoPlay: true),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return InkWell(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        Meals[index].ImageLogo,
                        //te().test[index],
                        //posts[postindex].imageurl[index],
                        // posts[1].imageurl[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                      if (index < 4)
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MainScreen(
                                  page: index,
                                )));
                    },
                  );
                },
                itemCount: Meals
                    .length //tete[0].test.length,//posts[0].imageurl.length,
                //posts[postindex].imageurl.length
                // Image.asset(,fit: BoxFit.cover,),
                // Image.asset(posts[1].imageurl,fit: BoxFit.cover,),
                // Image.asset(posts[2].imageurl,fit: BoxFit.cover,),
                // Image.asset(posts[3].imageurl,fit: BoxFit.cover,),
                // Image.asset(posts[4].imageurl,fit: BoxFit.cover,),
                // Image.asset(posts[5].imageurl,fit: BoxFit.cover,),
                ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 20.0, right: 20),
          //   child: Text(
          //     Caategory[index]['name'],
          //     style: TextStyle(
          //       fontSize: 30,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          /*GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(23),

            children: /* Restaurants.asMap().entries.map((RestaurantData){
                               int index = RestaurantData.key;
                              print(index);
                             */

            Caategory.map((
                RestaurantData,
                ) {
              //RestaurantData['plate']['title']
print(RestaurantData);

              return MealItem(Name: RestaurantData['plates']['title'], ImageLogo: RestaurantData['plates']['images'][0]['url'], rate: RestaurantData['plates']['rate'], price: RestaurantData['plates']['price'].toString());
            }).toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 0.58,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
          ),*/


          /*GridView(
                padding: EdgeInsets.all(25),
                children: [
                  Container(width:120,height:120,color: Colors.red,),
                  Container(width:120,height:120,color: Colors.red,),
                  Container(width:120,height:120,color: Colors.red,),
                  Container(width:120,height:120,color: Colors.red,),
                ],
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
                  childAspectRatio: 3/2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,

                ),

              ),*/
        ]),
      ),
    );
  }
}

/*
Restaurants.map((RestaurantData) => RestaurantItem(Name: RestaurantData.Name,rate:RestaurantData.rate,ImageLogo:RestaurantData.ImageLogo) ).toList()*/
