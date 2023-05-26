import 'dart:convert';

import 'package:e_waste/Tips.dart';
import 'package:e_waste/editForm.dart';
import 'package:e_waste/splashScreen.dart';
import 'package:e_waste/terms.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Order/orderPage.dart';
import 'homePage.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class MyProfileWidget extends StatefulWidget {
  String dispName="";
  String dispEmail="";
  MyProfileWidget(this.dispEmail,this.dispName);

  @override
  State<MyProfileWidget> createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
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
      appBar: AppBar(title: Text("Profile",
        style: TextStyle(fontSize: 19,color: Colors.black)),
        iconTheme: IconThemeData(
          color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(children: [ 
        Container(
          padding: EdgeInsets.only(left: 30,top:40),
          child: Image(image:AssetImage("assets/user.png"),
          width: (MediaQuery.of(context).size.width - 60) / 2,
          height: 150,
          )
        ),
        SizedBox(height: 5,),
        Container(
          margin: EdgeInsets.only(left:35),
          child: Text(widget.dispName,
          style: TextStyle(
            fontSize: 25
          )
          ),
          height: 30,
        ),
        SizedBox(height: 5,),
        Container(
          margin: EdgeInsets.only(left:35),
          child: Text(widget.dispEmail,
          style: TextStyle(
            fontSize: 15
          )
          ),
          height: 30,
          ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.only(left:45),
          child:ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
              minimumSize: Size(280,50)
            ),
            child: Text("Edit"),
            onPressed: () async{

              final SharedPreferences sharedPreferences=await SharedPreferences.getInstance(); 
              
              var obtainedUserId = sharedPreferences.getString('user_id');
              var obtainedUserName = sharedPreferences.getString('user_name');
              var obtainedUserSurname = sharedPreferences.getString('user_surname');
              var obtainedUserGender = sharedPreferences.getString('user_gender');
              var obtainedUserPassword = sharedPreferences.getString('user_password');
              var obtainedEmail = sharedPreferences.getString('user_email');
              var obtainedUserMobile = sharedPreferences.getString('user_mobile');
              var obtainedUserIdProof = sharedPreferences.getString('user_idproof');

              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MyEditFormWidget(obtainedUserId,obtainedUserName,obtainedUserSurname,obtainedUserGender,obtainedUserPassword,obtainedEmail,obtainedUserMobile,obtainedUserIdProof);
              }));
            },
          )
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.only(left:45),
          child:ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
              minimumSize: Size(280,50)
            ),
            child: Text("Terms And Condition"),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return MyTermsWidget();
              }));
            },
          )
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.only(left:45),
          child:ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
              minimumSize: Size(280,50)
            ),
            onPressed: ()async{
              
              final SharedPreferences sharedPreferences=await SharedPreferences.getInstance(); 
              sharedPreferences.remove('user_name');
              sharedPreferences.remove('user_email');
              sharedPreferences.remove('user_id');
              setState(() {
                Navigator.push(context,MaterialPageRoute(builder: (context){
                return MySplashScreen();
              }));
              }); 
            },
            child: Text("Logout"),
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
                getOrderData();
              }),
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.lightbulb_circle_outlined),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context){
                  return MyTipsWidget();
                }));
              }
            ),
            label: 'Tips',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.person_add_alt_1_outlined),
              onPressed: (() {
                onPressed: () => Navigator.of(context).pop(false);
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