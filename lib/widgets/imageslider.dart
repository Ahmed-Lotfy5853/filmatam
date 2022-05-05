import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';

class te {
  //final String Te ;//= 'assets/dummy/food2.png';
  List<String> test;

  // = [
  //   'assets/dummy/food.png',
  //   'assets/dummy/food2.png',
  //   'assets/dummy/food3.png',
  // ];
  te({required this.test});
}

List<te> tete = [
  te(test: ['assets/dummy/food.png', 'assets/dummy/food.png']),
  te(test: ['assets/dummy/food2.png', 'assets/dummy/food3.png']),
  te(test: ['assets/dummy/food.png', 'assets/dummy/food.png']),
];

class ImageSlider extends StatelessWidget {
  final int postindex;
  // final List<String> photos;
  // final List<String> photos;
  final String photos;

  ImageSlider({required this.postindex, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: photos == null ? false:true,
      child: CarouselSlider.builder(
          options: CarouselOptions(
              initialPage: 0,
              height: 130,
              enlargeCenterPage: true,
              pauseAutoPlayOnTouch: false,
              autoPlay: true),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.network(
                photos,//[postindex],
                //te().test[index],
                //posts[postindex].imageurl[index],
                // posts[1].imageurl[0],
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: 1
          // photos[postindex]
          //     .length //tete[0].test.length,//posts[0].imageurl.length,
          //posts[postindex].imageurl.length
          // Image.asset(,fit: BoxFit.cover,),
          // Image.asset(posts[1].imageurl,fit: BoxFit.cover,),
          // Image.asset(posts[2].imageurl,fit: BoxFit.cover,),
          // Image.asset(posts[3].imageurl,fit: BoxFit.cover,),
          // Image.asset(posts[4].imageurl,fit: BoxFit.cover,),
          // Image.asset(posts[5].imageurl,fit: BoxFit.cover,),
          ),
    );
  }
}
