import 'dart:convert';

import 'package:e_waste/homePage.dart';
import 'package:e_waste/smallCategory/SmartPhone/Brand/Apple/appleBrand.dart';
import 'package:e_waste/smallCategory/SmartPhone/mobilePageList.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Profile.dart';

class Item{
  Item(this.userEmail,this.prodName,this.prodPrice);

  String userEmail="";
  String prodName="";
  String prodPrice="";
}

class MyOrderPageWidget extends StatefulWidget {
  
  List prdname=[];
  List prdprice=[];
  MyOrderPageWidget(this.prdname,this.prdprice);

  @override
  State<MyOrderPageWidget> createState() => _MyOrderPageWidgetState();
}

class _MyOrderPageWidgetState extends State<MyOrderPageWidget> {
  
  var data;
  
  @override
  void initState(){
    super.initState();
     
  }
  
  @override 
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final SharedPreferences sharedPreferences=await SharedPreferences.getInstance(); 
        var user_name = sharedPreferences.getString('user_name');
        
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return MyHomePageWidget(user_name);
        }));
        return false;
      },
    child:Scaffold(
      appBar: AppBar(title: Text("Orders",
        style: TextStyle(fontSize: 19,color: Colors.black)),
        iconTheme: IconThemeData(
          color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body:Stack(
        children: [
          Positioned.fill(
            child:ListView.builder(itemCount: widget.prdname.length,itemBuilder: (context, index) {  
              return Card(
                child: ListTile(title: Text(widget.prdname[index]),
                  //subtitle: Text(widget.prdprice[index]),
                  trailing: Text(widget.prdprice[index]),
                ),
              );
            }, 
            ) 
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.home),
              onPressed: (() async{
                final SharedPreferences sharedPreferences=await SharedPreferences.getInstance(); 
                var obtainedUserName = sharedPreferences.getString('user_name');
                Navigator.push(context,MaterialPageRoute(builder: (context){
                  return MyHomePageWidget(obtainedUserName);
                }));
              }),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.shop_2_outlined),
              onPressed: (() {
                onPressed: () => Navigator.of(context).pop(false);
              }),
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.lightbulb_circle_outlined),
              onPressed: (() {
                Navigator.pushNamed(context, 'tipsPage');
              }),
            ),
            label: 'Tips',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.person_add_alt_1_outlined),
              onPressed: (() async{
                final SharedPreferences sharedPreferences=await SharedPreferences.getInstance(); 
                String obtainedEmail = sharedPreferences.getString('user_email');
                String obtainedName = sharedPreferences.getString('user_name');
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MyProfileWidget(obtainedEmail,obtainedName);
                }));
              }),
            ),
            label: 'Profile',
          ),
        ],
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
      ) 
    
    )
    );
  }
}
