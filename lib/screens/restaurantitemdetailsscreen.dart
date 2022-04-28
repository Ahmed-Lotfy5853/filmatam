import 'package:filmatam/customcolor.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';
import '../widgets/mealitem.dart';
import '../widgets/restaurantitem.dart';

class RestaurantItemDetailsScreen extends StatefulWidget {
  String image;
  String name;
  Map<String, List<String>> Branches;
  String restaurantdescription;
  int personreviews;
  double rate;

  RestaurantItemDetailsScreen({
    required this.image,
    required this.name,
    required this.restaurantdescription,
    required this.Branches,
    required this.personreviews,
    required this.rate,
  });

  @override
  State<RestaurantItemDetailsScreen> createState() =>
      _RestaurantItemDetailsScreenState();
}

class _RestaurantItemDetailsScreenState
    extends State<RestaurantItemDetailsScreen> {
  bool viewmore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 200,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                // Text(name,style: TextStyle(
                //   color: Colors.black,
                //   fontWeight: FontWeight.bold,
                //   fontSize: 25,
                // ),),
                Container(
                  margin: EdgeInsets.only(left: 20, bottom: 5),
                  // constraints: BoxConstraints(maxWidth: 90,maxHeight: 90),
                  // padding: EdgeInsets.only(left: 10),
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(widget.image), //fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            // Text(name,style: TextStyle(
            //   color: Colors.black,
            //   fontWeight: FontWeight.bold,
            //   fontSize: 25,
            // ),),
          ],
        ),
        // centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/dummy/meals/meal2.png'),
                  fit: BoxFit.cover)),
        ),
        actions: [
          //   Container(
          //   margin: EdgeInsets.only(left: 20,bottom: 5),
          //   // constraints: BoxConstraints(maxWidth: 90,maxHeight: 90),
          //   // padding: EdgeInsets.only(left: 10),
          //   width: 90,
          //   height: 90,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(15),
          //     image: DecorationImage(image: AssetImage(image), //fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
        ],
        // leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: ()=>Navigator.of(context).pop(),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        // padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(color: CustomColor.MainColor,
                        fontSize: 36,
                        fontWeight: FontWeight.w800),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 10,),
                          Text(
                            '${widget.rate}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        '${widget.personreviews}',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),

              Text(widget.restaurantdescription,
                softWrap: true,
                style: TextStyle(
                  fontSize: 25,
                  // color: Colors.black,
                  // fontWeight: FontWeight.bold
                ),),
              Text('قائمه الطعام',
                style: TextStyle(
                  fontSize: 36,
                  color: CustomColor.MainColor,
                  // fontWeight: FontWeight.bold
                ),),
              GridView(
                physics: NeverScrollableScrollPhysics(),

                shrinkWrap: true,
                padding: EdgeInsets.all(23),

                children: /* Restaurants.asMap().entries.map((RestaurantData){
                         int index = RestaurantData.key;
                        print(index);
                       */
                Meals.map((MealsData) {
                  return Container(
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow
                          (

                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 10
                        ),
                      ],
                    ),
                    child: MealItem(
                      Name: MealsData.Name,
                      ImageLogo: MealsData.ImageLogo,
                      rate: MealsData.rate,
                      price: MealsData.Price,
                    ),
                  );
                }).take(!viewmore ? 4 : Meals.length).toList(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 295,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,


                ),

              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: TextButton(onPressed: () {
                  setState(() {
                    viewmore = !viewmore;
                  });
                },
                  child: Text(viewmore ? 'أقل' : 'المزيد',
                    style: TextStyle(fontSize: 20),),),
              ),
              Text('الفروع',
                style: TextStyle(
                    color: CustomColor.MainColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) =>Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${widget.Branches.keys.toList()[index]}   :',style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),),
                    GridView(
                      physics: NeverScrollableScrollPhysics(),

                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 20,right: 20),

                      children: /* Restaurants.asMap().entries.map((RestaurantData){
                           int index = RestaurantData.key;
                          print(index);
                         */
                      List.generate(widget.Branches.values.toList()[index].length, (e) => Text(widget.Branches.values.toList()[index][e],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23
                      ),
                      softWrap: true,)),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2.25,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,


                      ),

                    ),
                  //
                  ],
              ),
                ),
                separatorBuilder: (BuildContext context, int index) =>Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Divider(height: 10,color: Colors.grey,indent: 20,endIndent: 20,),
                ),
                itemCount: widget.Branches.keys.length,
              )

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
        child: Icon(Icons.chat, color: Colors.white,),
        backgroundColor: CustomColor.MainColor,),
    );
  }
}
