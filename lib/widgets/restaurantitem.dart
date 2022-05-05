import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:widget_mask/widget_mask.dart';

import '../customcolor.dart';
import '../screens/restaurantitemdetailsscreen.dart';

class RestaurantItem extends StatefulWidget {
  late String Name;
  late String ImageLogo;
  late String restaurantdescription;
  Map<String, List<String>> Branches;
  String rate ;
  String personreviews;

  RestaurantItem(
      {
        required this.Name,
        required this.ImageLogo,
        required this.restaurantdescription,
        required this.Branches,
        required this.rate,
        required this.personreviews,
      });

  @override
  State<RestaurantItem> createState() => _RestaurantItemState();
}

class _RestaurantItemState extends State<RestaurantItem> {
  bool favorited = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(

        // padding: EdgeInsets.only(top: 10, right: 5, left: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: CustomColor.MainColor.withOpacity(0.4),
                  offset: Offset(2, 2),
                  blurRadius: 10
              ),
            ]
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
//المسافات تصغر
            //القلب في العكس
            //  الاسم في النص
            //الظل
            //صغر الايقون
            // ظل
            //لونهم احمر
            //زي
            //اسم المطعم bold
            //الصوره مدوره
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    widget.ImageLogo,
                    width: double.infinity,
                  ),
                ),
                // Container(
                //   width:double.infinity ,
                //   height: 170,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage(
                //         widget.ImageLogo,
                //
                //       ),
                //       fit: BoxFit.contain,
                //     ),
                //     // color: Colors.red,
                //     borderRadius: BorderRadius.circular(15)
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: WidgetMask(
                //     // blendMode: BlendMode.srcATop,
                //     // childSaveLayer: true,
                //     mask: Image.asset(widget.ImageLogo),
                //   child: Container(
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15),
                //       color: Colors.red
                //     ),
                //   ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.Name,
                        style:
                        TextStyle(fontSize: 25, color: Colors.black,
                            fontWeight: FontWeight.bold),
                        softWrap: true,
                      ),
                      RatingBarIndicator(
                        rating: double.parse(widget.rate),
                        itemBuilder: (context, index) =>
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                        itemCount: 5,
                        itemSize: 23.0,
                        direction: Axis.horizontal,
                      ),
                      /*
                        initialRating: widget.rate,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemSize: 21,
          onRatingUpdate: (rating) {
          },
                       */
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: null,
                        color: CustomColor.MainColor,
                        icon: Image.asset(
                          'assets/icons/send.png',
                          scale: 0.8,
                        )),
                    radius: 16,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          favorited ? favorited = false : favorited = true;
                        });
                      },
                      icon: Image.asset(favorited
                          ? 'assets/icons/redheart.png'
                          : 'assets/icons/redborderheart.png',color: CustomColor.MainColor,),
                      iconSize: 20,
                      splashColor: Colors.transparent,
                    ),
                    radius: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              RestaurantItemDetailsScreen(name: widget.Name,
                image: widget.ImageLogo,
                personreviews:widget.personreviews,
                rate: widget.rate, restaurantdescription: widget.restaurantdescription, Branches: widget.Branches,)
            //MealItemDetails()
          ),
        );
      },
    );
  }
}
