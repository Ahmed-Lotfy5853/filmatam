
/*t
import 'package:flutter/material.dart';

import '../models.dart';
import 'restaurantitem.dart';

List<Widget> RestaurantItems = [
    Text(category),
    GridView(
      padding: EdgeInsets.all(25),
      children: restaurantsdata.map((RestaurantData) => RestaurantItem(Name: RestaurantData.Name,rate:RestaurantData.rate,ImageLogo:RestaurantData.ImageLogo) ).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,

      ),

    ),
  ];
*/

/*
({
required List<Restaurant> restaurantsdata,
required String category,
}){
return */