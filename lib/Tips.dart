import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Order/orderPage.dart';
import 'Profile.dart';
import 'homePage.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class MyTipsWidget extends StatefulWidget {
  const MyTipsWidget({super.key});

  @override
  State<MyTipsWidget> createState() => _MyTipsWidgetState();
}

class _MyTipsWidgetState extends State<MyTipsWidget> {
  
  Future getOrderData() async{
    List<dynamic> get_data=[];
        List prdname=[];
        List prdprice=[];
        final SharedPreferences sharedPreferences=await SharedPreferences.getInstance(); 
        var obtainedEmail = sharedPreferences.getString('user_email');
          //Navigator.push(context,MaterialPageRoute(builder:(context) => MyHomePageWidget(first_name.text)));
        
        Future getData()async{
        var APIURL="https://ewaste123.000webhostapp.com/get_orderList.php";
        Map mapdata={
          "userEmail":obtainedEmail,
        };  

        http.Response response=await http.post(Uri.parse(APIURL),body:mapdata);

        try{
          //List prdname=get_data.map((e) =>  e.toString().split(":")[2].split(",")[0].split(" ")[1]).toList();
          //prdprice=get_data.map((e) =>  e.toString().split(":")[3].split(",")[0].split(" ")[1].split("}")[0]).toList()
          get_data=jsonDecode(response.body);
          prdname=get_data.map((e) =>  e.toString().split(":")[2].split(",")[0]).toList();
          prdprice=get_data.map((e) =>  e.toString().split(":")[3].split(",")[0].split(" ")[1].split("}")[0]).toList();
          //print(get_data);
        }
        catch(ex){}
      }
        getData().whenComplete(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyOrderPageWidget(prdname,prdprice);
              }));
        });
        
      }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Orders",
        style: TextStyle(fontSize: 19,color: Colors.black)),
        iconTheme: IconThemeData(
          color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(child: Text("Currently no TIPS")),
      
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
                getOrderData();
              }),
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.lightbulb_circle_outlined),
              onPressed: () {
                onPressed: () => Navigator.of(context).pop(false);
              }
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

        
        //elevation: 20.0,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        //selectedItemColor: Colors.amber[800],
      )

    );
  }
}