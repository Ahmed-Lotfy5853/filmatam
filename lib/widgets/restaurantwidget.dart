import 'package:filmatam/customcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';
import 'restaurantitem.dart';
import 'restaurantitems.dart';

class RestaurantWidget extends StatelessWidget {
  TextEditingController SearchController = TextEditingController();

   RestaurantWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

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
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: IconButton(icon: Icon(Icons.search),iconSize:30,color:CustomColor.MainColor,splashColor: Colors.transparent,splashRadius:20, onPressed: () {  },),
                  ),
                  suffixIconColor: CustomColor.MainColor,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: IconButton(icon: Icon(Icons.filter_list),iconSize:30,color:CustomColor.MainColor,splashColor: Colors.transparent,splashRadius: 20, onPressed: () {  },),
                  ),
                  prefixIconColor: CustomColor.MainColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),

                  )
           ),
                validator: (str){

                },

              ),
            ),

            Expanded(
              child: GridView(
                padding: EdgeInsets.all(23),

                children:/* Restaurants.asMap().entries.map((RestaurantData){
                   int index = RestaurantData.key;
                  print(index);
                 */
                Restaurants.map((RestaurantData)=>RestaurantItem(Name: RestaurantData.Name,rate:RestaurantData.rate,ImageLogo:RestaurantData.ImageLogo, personreviews: RestaurantData.personreviews, restaurantdescription:RestaurantData.restaurantdescription, Branches: RestaurantData.branches)).toList()
                  ,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 165,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,


                ),

              ),
            ),


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
    );
  }
}

/*
Restaurants.map((RestaurantData) => RestaurantItem(Name: RestaurantData.Name,rate:RestaurantData.rate,ImageLogo:RestaurantData.ImageLogo) ).toList()*/
