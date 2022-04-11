//@dart=2.9
import 'package:filmatam/customcolor.dart';
import 'package:filmatam/screens/aboutusscreen.dart';
import 'package:filmatam/screens/contactusscreen.dart';
import 'package:filmatam/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/loginscreen.dart';
import 'screens/signupscreen.dart';
import 'screens/splashscreen.dart';
import 'widgets/restaurantwidget.dart';

int index = 1;
final local = [
  Locale('en', ''), // English, no country code
  Locale('ar', 'AE'), // Spanish, no country code
];

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    //color set to transperent or set your own color
    // statusBarIconBrightness: Brightness.dark,
    //set brightness for icons, like dark background light icons
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''), // English, no country code
          Locale('ar', 'AE'), // Spanish, no country code
        ],
        locale: local[index],
        debugShowCheckedModeBanner: false,
        title: 'في المطعم',
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          // highlightColor: Colors.white,
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: CustomColor.MainColor,
        ),
        home: Splashscreen(),
        // MainScreen(page: 1,)//ContactusScreen()//MainScreen(page: 2,),
        );
  }
}
