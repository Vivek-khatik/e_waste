// import 'dart:js';

// import 'dart:js';

// import 'package:e_waste/Mobile%20Questions/mobileQuestions.dart';
// import 'package:e_waste/Order/orderPage.dart';
import 'package:e_waste/Global/globalVarDeclare.dart';
import 'package:e_waste/Profile.dart';
import 'package:e_waste/Tips.dart';
import 'package:e_waste/onBoardScreen.dart';
import 'package:e_waste/register.dart';
import 'package:e_waste/serviceNotAvail.dart';
import 'package:e_waste/smallCategory/Earphone/earphoneCompany.dart';
import 'package:e_waste/smallCategory/SmartPhone/Brand/Apple/appleBrand.dart';
// import 'package:e_waste/smallCategory/SmartPhone/Brand/Apple/applePage.dart';
import 'package:e_waste/smallCategory/SmartPhone/Brand/Realme/realmeBrand.dart';
import 'package:e_waste/smallCategory/SmartPhone/Brand/Samsung/samsungBrand.dart';
import 'package:e_waste/smallCategory/smallCategoryHomePage.dart';
import 'package:e_waste/smallCategory/SmartPhone/smartphoneCompany.dart';
import 'package:e_waste/splashScreen.dart';
import 'package:flutter/material.dart';
// import 'Order/priceEvaluation.dart';
import 'homePage.dart';
import 'login.dart';

void main() { 
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashScreen',
      routes: {
        'splashScreen':(context)=> MySplashScreen(),
        'onboard':(context) => MyOnBoardScreen(),
        'login': (context) => MyLoginWidget(),
        'register':(context) => MyRegisterWidget(),
        // 'homePage':(context) => MyHomePageWidget(),
        'smallCategoryHomePage':(context) => MysmallCategoryHomePage(),
        'smartphoneCompany':(context) => MysmartphoneCompany(),
        'appleBrand':(context) => MyAppleBrand(),
        //'orderPage':(context) => MyOrderPageWidget(),
        //'profilePage':(context) => MyProfileWidget(),
        'tipsPage':(context) => MyTipsWidget(),
        // 'applePage':(context) => MyApplePageWidget(fixedPrice),
        // 'mobileQuestions':(context)=>MyMobileQuestionWidget(),
        //'priceEvaluation':(context) => MyPriceEvaluationWidget(),
        'samsungBrand':(context)=>MySamsungBrand(),
        'realmeBrand':(context)=>MyRealmeBrand(),
        'earphoneCompany':(context)=>MyearphoneCompany(),
        'serviceNotAvailable':(context) =>MyServiceNotAvail() 
        },
    )
  );
}
