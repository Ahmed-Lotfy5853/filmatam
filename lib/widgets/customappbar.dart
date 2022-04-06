import 'package:flutter/material.dart';

import '../customcolor.dart';

PreferredSizeWidget CustomAppbar(){
  return
    AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      //flexibleSpace: Image.asset('assets/PNG/Logo_arabic_coloredxx_icon.png',
      // ),
      title: Image.asset('assets/PNG/Logo_arabic_coloredxx.png',
        scale: 125,),
      centerTitle: true,

      iconTheme: IconThemeData(color: CustomColor.MainColor),
      actions: [

        // Expanded(child: Container()),
        // Image.asset('assets/PNG/Logo_arabic_coloredxx_icon.png',),
        // Expanded(child: Container()),
        IconButton(onPressed: null, icon: Icon(Icons.account_balance_wallet,color: CustomColor.MainColor,))
      ],
    );
}