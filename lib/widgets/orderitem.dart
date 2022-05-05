import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  late String ImagePhoto;
  late String MealName;
  late String MealSize;
  late String RestaurantName;
  late String BranchName;
  late double MealPrice;
  late double FinalMealPrice;
  late double MealItemPrice;
  late double MealItemNumber;


  OrderItem(
      {
      required this.ImagePhoto,
      required this.MealName,
      required this.MealSize,
      required this.RestaurantName,
      required this.BranchName,
      required this.MealPrice,
      required this.FinalMealPrice,
      required this.MealItemPrice,
      required this.MealItemNumber,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 5.0),
                         height: MediaQuery.of(context).size.height*0.23,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
            Container(
            width: 80,
              height: 80,

              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(image: AssetImage(ImagePhoto,
                  // width: 30,
                  // height: 30,
                  // fit: BoxFit.cover,
                ),),
                borderRadius: BorderRadius.circular(15),
              ),),



                ],),
                Row(            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                  Text('مطعم : ${RestaurantName}',style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,),),

                ],),
                Row(            mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Text('فرع : ${BranchName}',style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,),),


                ],)
              ],
            ),
          ),
          Text(MealName,style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.23,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                Text('سعر الوجبه $MealItemPrice',style: TextStyle(
                  // color: Colors.black,
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  decoration: FinalMealPrice==-1?TextDecoration.none:TextDecoration.lineThrough,

                ),),
                Visibility(
                  visible: FinalMealPrice!=-1,
                  child: Text('عرض $FinalMealPrice',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,),),
                ),
                Text('حجم الوجبه : ${MealSize}',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  // decoration: TextDecoration.lineThrough,
                ),
                ),

                Text('عدد الوجبات ${MealItemNumber.toInt()}',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,),),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 80,
            height: 80,

            decoration: BoxDecoration(
              // color: Colors.red,
              image: DecorationImage(image: AssetImage(ImagePhoto,
                // width: 30,
                // height: 30,
                // fit: BoxFit.cover,
              ),),
              borderRadius: BorderRadius.circular(15),
            ),

          ),
          SizedBox(width: 10,),

          Column(
            children: [
              Text(MealName,style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ),
              Text('حجم الوجبه : ${MealSize}',style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                // decoration: TextDecoration.lineThrough,
              ),
              ),
              Text('مطعم : ${RestaurantName}',style: TextStyle(
                color: Colors.black,
                fontSize: 20,),),
              Text('فرع : ${BranchName}',style: TextStyle(
                color: Colors.black,
                fontSize: 20,),),
            ],
          ),
SizedBox(width: 2,),
  Container(
    // alignment: Alignment.bottomCenter,
    height: 188,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('سعر الوجبه $MealItemPrice',style: TextStyle(
          // color: Colors.black,
          fontSize: 20,
          // fontWeight: FontWeight.bold,
          decoration: FinalMealPrice==-1?TextDecoration.none:TextDecoration.lineThrough,

        ),),
        Visibility(
          visible: FinalMealPrice!=-1,
          child: Text('عرض $FinalMealPrice',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,),),
        ),

        // FloatingActionButton(onPressed: null,child: Icon(Icons.plus_one),),
        Text('عدد الوجبات ${MealItemNumber.toInt()}',style: TextStyle(
          color: Colors.black,
          fontSize: 20,),),
        // FloatingActionButton(onPressed: null,child: Icon(Icons.exposure_minus_1),),
        Text('الاجمالي ${MealPrice}',style: TextStyle(
          color: Colors.black,
          fontSize: 20,),),
      ],


    ),
  ),


        ],
      ),
    );
 */