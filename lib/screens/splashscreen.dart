import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:filmatam/customcolor.dart';
import 'package:filmatam/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

import 'mainscreen.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => new _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return new /*SplashScreen(
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
//codeforces


        AnimatedSplashScreen(

            duration: 100,
            splash: Center(
                child:
                SvgPicture.asset('assets/SVG/Logo_arabic_whitexx_cleaned.svg'
                  ,//width: 100,height:100,
                //  color: CustomColor.MainColor,
                ),

              /* Image.asset(
              'assets/PNG/Logo_arabic_whitexx.png',
            )*/
            ),
             splashIconSize: 175,
            nextScreen:   LoginScreen()
              ,
            splashTransition: SplashTransition.fadeTransition,
            animationDuration: Duration(seconds: 1),

            //pageTransitionType: PageTransitionType.scale,

            backgroundColor: CustomColor.MainColor);
  }
}
