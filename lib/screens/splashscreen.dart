
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:filmatam/customcolor.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:splashscreen/splashscreen.dart';

import 'mainscreen.dart';


class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => new _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return  new /*SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new MainScreen(),/*
      title: new Text('في المطعم',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),*/
      image: Image.asset('assets/PNG/Logo_arabic_whitexx.png',),
      photoSize: 200.0,
      backgroundColor: CustomColor.MainColor,
      useLoader: false,


    )*/
    AnimatedSplashScreen(
        duration: 3000,
        splash: Center(child: Image.asset('assets/PNG/Logo_arabic_whitexx.png',)),
        splashIconSize: 175,
        nextScreen: MainScreen(page: 2,),
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: Duration(seconds: 4),

        //pageTransitionType: PageTransitionType.scale,

        backgroundColor: CustomColor.MainColor);
  }
}


