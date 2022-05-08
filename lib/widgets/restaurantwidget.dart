import 'package:filmatam/customcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';
import '../services/userapi.dart';
import 'restaurantitem.dart';
import 'restaurantitems.dart';

class RestaurantWidget extends StatefulWidget {

   RestaurantWidget({Key? key}) : super(key: key);

  @override
  State<RestaurantWidget> createState() => _RestaurantWidgetState();
}

class _RestaurantWidgetState extends State<RestaurantWidget> {
  TextEditingController SearchController = TextEditingController();

   String FilterSelection = 'restaurant_name';

  var searchkey =  GlobalKey<FormState>();
  @override
  void initState() {
    connectApi.init();
    connectApi()
        .getData(url: RESTAURANTS, query: data, token: token)
        .then((value) async {

      // print(Cities);
      setState(() {
        Restaurants = value.data;
        print(Restaurants);
        // value.data.forEach((e)=>Cities.add(e['name_ar']));
        // person.Name = value.data['name'];
        // person.Name = value.data['name'];
      });
    });
    super.initState();
  }

  List search_result=[];
  bool re = false;
  List<String>  Filter = ['restaurant_name','rate'];
  void search({required String filter,required String search_keyword}){
setState(() {
  re = true;
});
search_result = Restaurants.where((element) => element['$filter']== search_keyword).toList();
// if(search_result == []) {
//       setState(() {
//         search_result = [-1];
//       });
//     }
    print(search_result);
  }
  // return meals.where((mealitem)=>mealitem.isfavorite).toList();
  // return meals.where((mealitem)=>mealitem.isfavorite).toList();
  // return meals.where((mealitem)=>mealitem.restaurant == restaurant).toList();

  @override
  Widget build(BuildContext context) {
    // print(((search_result.isEmpty) && re));
    return Restaurants.isEmpty?LinearProgressIndicator():Container(
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
           /* Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text('أكلات شعبيه',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,

              ),),
            ),*/
            Padding(
              padding: const EdgeInsets.only(right: 20.0,left: 20.0,top: 20.0),
              child: Form(
                key: searchkey,
                child: TextFormField(
                  controller: SearchController,
                  keyboardType: TextInputType.text,

                  style: TextStyle(

                    fontSize: 25,
                  ),
                  decoration: InputDecoration(
                    hintText: 'جد مطعم',
                    hintStyle: TextStyle(
                      fontSize: 25
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: IconButton(icon: Icon(Icons.search),iconSize:30,color:CustomColor.MainColor,splashColor: Colors.transparent,splashRadius:20, onPressed: () {
                            setState(() {
                              if(searchkey.currentState!.validate()){
                                search(search_keyword: SearchController.text,filter: FilterSelection);
                              }
                            });
                      },),
                    ),
                    suffixIconColor: CustomColor.MainColor,
                    suffixIcon:

                        Padding(
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

                    )
           ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'حقل البحث فارغاً';
                    }
                    return null;
                  },

                ),
              ),
            ),

            Visibility(
              visible: (search_result.isNotEmpty && re) ,
              child: (
                  Expanded(
                child: GridView(
                  padding: EdgeInsets.all(23),

                  children:/* Restaurants.asMap().entries.map((RestaurantData){
                     int index = RestaurantData.key;
                    print(index);
                   */
                  search_result.map((RestaurantData)=>RestaurantItem(Name: RestaurantData['restaurant_name'],rate:RestaurantData['rate'],ImageLogo:RestaurantData['logo'], personreviews: RestaurantData['person_view'], restaurantdescription:RestaurantData['restaurant_description'], Branches: {
                    'القاهره': ['المهندسين', 'الزمالك']
                  }
                  )).toList()
                  ,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 165,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,


                  ),

                ),
              )),
            ),

            Visibility(visible:(search_result.isEmpty && re ),child: (Center(child: Text('لا توجد نتائج للبحث',style: TextStyle(fontSize: 25),)))),

            Visibility(
      visible: (!re ),
      child: Expanded(
      child: GridView(
      padding: EdgeInsets.all(23),

      children:/* Restaurants.asMap().entries.map((RestaurantData){
                     int index = RestaurantData.key;
                    print(index);
                   */
      Restaurants.map((RestaurantData)=>RestaurantItem(Name: RestaurantData['restaurant_name'],rate:RestaurantData['rate'],ImageLogo:RestaurantData['logo'], personreviews: RestaurantData['person_view'], restaurantdescription:RestaurantData['restaurant_description'], Branches: {
      'القاهره': ['المهندسين', 'الزمالك']
      }
      )).toList()
      ,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 165,
      childAspectRatio: 0.65,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,


      ),

      ),
      ),
    ),

              /* GridView(
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
    );
  }
}

/*
Restaurants.map((RestaurantData) => RestaurantItem(Name: RestaurantData.Name,rate:RestaurantData.rate,ImageLogo:RestaurantData.ImageLogo) ).toList()*/
