import 'dart:async';

import 'package:e_waste/homePage.dart';
import 'package:e_waste/login.dart';
import 'package:e_waste/onBoardScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import 'login.dart';

String finalUserName="";
String finalEmail="";

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  @override
  void initState(){
    // Timer(Duration(seconds: 2), ()=> GetMaterialApp);
    super.initState();
    _navigatetohome().whenComplete((){
        if(finalUserName == '' || finalUserName == null){
          Navigator.pushNamed(context, 'onboard');  
        }
        else{
          Navigator.push(context,MaterialPageRoute(builder:(context) => MyHomePageWidget(finalUserName)));
        }      
    });
  }

Future _navigatetohome() async{
  final SharedPreferences sharedPreferences=await SharedPreferences.getInstance(); 
  var obtainedUserName = sharedPreferences.getString('user_name');
  var obtainedEmail = sharedPreferences.getString('user_email');

  await Future.delayed(Duration(seconds: 3),(){});

  setState(() {
    finalUserName=obtainedUserName;  
    finalEmail=obtainedEmail;
  });
}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top:85,right: 5),
      child : Image(image: AssetImage("assets/Recycle_me.png")) 
    );
  }
}