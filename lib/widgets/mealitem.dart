import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_mask/widget_mask.dart';

import '../customcolor.dart';

class MealItem extends StatefulWidget {
  late String Name;
  late String ImageLogo;
  double rate = 2.5;
  double price;

  MealItem(
      {required this.Name,
      required this.ImageLogo,
      required this.rate,
      required this.price});

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  bool favorited = false;

 /* late double _dimension;

  @override
  void initState() {
    super.initState();
    _dimension = 203.0;



    }*/

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        // padding: EdgeInsets.only(top: 10, right: 5, left: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(

          alignment: Alignment.topCenter,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    widget.ImageLogo,
                    width: 300,
                    height: 170,
                    fit: BoxFit.cover,

                    // width: double.infinity,
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
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        softWrap: true,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [


                              RatingBarIndicator(
                                rating: widget.rate,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                ' ${widget.price}جم ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
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
            Container(
              width: 280,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: null,
                          // color: CustomColor.MainColor,
                          icon: Icon(Icons.add_shopping_cart,color: CustomColor.MainColor,size: 20,)
                          // Image.asset(
                          //   'assets/icons/send.png',
                          //   scale: 0.8,
                          // )
                      ),
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
                        icon:         SvgPicture.asset(favorited?
                             'assets/SVG/hearsvg.svg':'assets/SVG/heartfilled.svg'
                           ,width: 16,height:16,color: CustomColor.MainColor,),
                        //Icon(favorited?Icons.monitor_heart_outlined:Icons.heart_broken,color: CustomColor.MainColor,size: 20,),
                        // Image.asset(favorited
                        //     ? 'assets/icons/redheart.png'
                        //     : 'assets/icons/redborderheart.png'),
                        iconSize: 20,
                        splashColor: Colors.transparent,
                      ),
                      radius: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: null,
    );
  }
}

