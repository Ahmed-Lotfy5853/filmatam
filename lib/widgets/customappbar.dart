import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../customcolor.dart';

PreferredSizeWidget CustomAppbar(int page) {
  return AppBar(
    elevation: (page==1)?0:3,
    toolbarHeight: 70,
    backgroundColor: Colors.white,
    //flexibleSpace: Image.asset('assets/PNG/Logo_arabic_coloredxx_icon.png',
    // ),
    title:
    SvgPicture.asset('assets/SVG/Logo_arabic_coloredxx_cleaned.svg'
      ,width: 100,height:100,),



    // Image.asset(
    //   'assets/icon/filmatam.png',
    //   // 'assets/PNG/Logo_arabic_coloredxx.png',
    //   //  scale: 2,
    // ),
    centerTitle: true,

    iconTheme: IconThemeData(color: CustomColor.MainColor),
    actions: [

      // Expanded(child: Container()),
      // Image.asset('assets/PNG/Logo_arabic_coloredxx_icon.png',),
      // Expanded(child: Container()),
      IconButton(
          onPressed: null,
          icon: SvgPicture.asset('assets/SVG/Wallet-icon.svg'
            ,width: 50,height:50,color: CustomColor.MainColor,),
        /*Icon(
            Icons.account_balance_wallet,
            color: CustomColor.MainColor,
          )*/
      )
    ],
  );
}
