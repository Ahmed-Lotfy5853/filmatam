import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmatam/customcolor.dart';
import 'package:filmatam/main.dart';
import 'package:filmatam/widgets/imageslider.dart';
import 'package:flutter/material.dart';

import '../models.dart';
import '../screens/mainscreen.dart';
import 'mealitem.dart';
import 'restaurantitem.dart';
import 'restaurantitems.dart';

class ProductWidget extends StatelessWidget {
  TextEditingController SearchController = TextEditingController();

  ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [

              Padding(
                padding: const EdgeInsets.only(right: 20.0,left: 20.0,top: 20.0),
                child: TextFormField(
                  controller: SearchController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  decoration: InputDecoration(
                      hintText: 'جد وجبه',
                      hintStyle: TextStyle(
                          fontSize: 25
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: IconButton(icon: Icon(Icons.search),iconSize:30,color:Colors.red,splashColor: Colors.transparent,splashRadius:20, onPressed: () {  },),
                      ),
                      suffixIconColor: CustomColor.MainColor,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: IconButton(icon: Icon(Icons.filter_list),iconSize:30,color:Colors.red,splashColor: Colors.transparent,splashRadius: 20, onPressed: () {  },),
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
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_,int index)=>InkWell(
                    child: Container(
                      padding: EdgeInsets.all(10),
decoration: BoxDecoration(
  color: Colors.white,
borderRadius: BorderRadius.circular(15),

),                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(FoodCategories[index].ImageUrl,
                          scale: 4,),
                          Text(FoodCategories[index].Name,style: TextStyle(
                            fontSize: 25,
                            // color: Colors.blackR
                          ),)
                        ],
                      ),
                    ),
                    onTap: null,
                  ),
                  separatorBuilder: (BuildContext context, int index) =>SizedBox(width: 20,),
                  itemCount: FoodCategories.length,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('رائج',style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,

                ),),
              ),

              Container(
                height: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: CustomColor.MainColor.withOpacity(0.4),
                  //       offset: Offset(2,2),
                  //       blurRadius:10
                  //   ),
                  // ]
                ),
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_,int index)=>MealItem(Name: Meals[index].Name, ImageLogo: Meals[index].ImageLogo, rate: Meals[index].rate, price: Meals[index].Price,) ,
                  separatorBuilder: (BuildContext context, int index) =>SizedBox(width: 20,),
                  itemCount: Meals.length,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('مميز',style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,

                ),),
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
                        onTap: (){
                          if(index<4)
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainScreen(page: index,)));
                        },
                      );
                    },

                    itemCount: Meals.length //tete[0].test.length,//posts[0].imageurl.length,
                  //posts[postindex].imageurl.length
                  // Image.asset(,fit: BoxFit.cover,),
                  // Image.asset(posts[1].imageurl,fit: BoxFit.cover,),
                  // Image.asset(posts[2].imageurl,fit: BoxFit.cover,),
                  // Image.asset(posts[3].imageurl,fit: BoxFit.cover,),
                  // Image.asset(posts[4].imageurl,fit: BoxFit.cover,),
                  // Image.asset(posts[5].imageurl,fit: BoxFit.cover,),
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
      ),
    );
  }
}

/*
Restaurants.map((RestaurantData) => RestaurantItem(Name: RestaurantData.Name,rate:RestaurantData.rate,ImageLogo:RestaurantData.ImageLogo) ).toList()*/
