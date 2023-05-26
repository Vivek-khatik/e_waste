import 'dart:convert';

import 'package:e_waste/Order/orderPage.dart';
import 'package:e_waste/homePage.dart';
import 'package:e_waste/smallCategory/SmartPhone/mobilePageList.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MyProductPricePageWidget extends StatefulWidget {
  int fixedPrice=0;
  String imgAddress="";
  String mbName="";
  MyProductPricePageWidget(this.fixedPrice,this.imgAddress,this.mbName);

  @override
  State<MyProductPricePageWidget> createState() => _MyPrdouctPricePageWidgetState();
}

class _MyPrdouctPricePageWidgetState extends State<MyProductPricePageWidget> { 

  Future insertData() async{

    showDialog(
      context: context, 
      builder: (context){
        return Center(child: CircularProgressIndicator()); 
      });
    
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance(); 
    var obtainedEmail = sharedPreferences.getString('user_email');
    String prodImg="";

    var APIURL="https://ewaste123.000webhostapp.com/post_orderList.php";
    Map mapdata={
      "userEmail":obtainedEmail,
      "prodName":widget.mbName,
      "prodPrice":widget.fixedPrice.toString(),
      "prodImg":prodImg,
    };

    http.Response response=await http.post(Uri.parse(APIURL),body:mapdata);

    try{
      var data=jsonDecode(json.encode(response.body));

      if(data=="success" || data==""){
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

          Fluttertoast.showToast(
            msg: "Order Placed Successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            fontSize: 16.0
          );
        });
        
        }
        else{
          Fluttertoast.showToast(
            msg: "Sorry Order Not Placed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            fontSize: 16.0
          );
        }
      }
    catch(ex){
      Fluttertoast.showToast(
        msg: "Sorry Order Not Placed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Model",
        style: TextStyle(fontSize: 19,color: Colors.black)),
        iconTheme: IconThemeData(
          color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: 500,
            height: 350,
            child:Image(image: AssetImage(widget.imgAddress))       
          ),
          SizedBox(height: 50,),
          Container(
            child: Text(widget.mbName,
            style: TextStyle(
              fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 30,),
          Container(
            child:  Text("Price :"+widget.fixedPrice.toString()+"  rs")
          ),
          SizedBox(height: 30,),
          ElevatedButton(
            onPressed: (){

              insertData();

              // List<mobilePageList> mobile_lst=[];
              // mobilePageList mblObj=new mobilePageList();
              // mblObj.imgAddress=widget.imgAddress;
              // mblObj.prodName=widget.mbName;
              // mblObj.prodPrice=widget.fixedPrice.toString();

              // mobile_lst.add(mblObj);
              // print(mblObj.prodName);

              //final SharedPreferences sharedPreferences=await SharedPreferences.getInstance(); 
              //var obtainedUserName = sharedPreferences.getString('user_name');

              //SharedPreferences prefs = await SharedPreferences.getInstance();

              //get List
              //String userPref = prefs.getString('orderList');
              //Map<String,dynamic> userMap = jsonDecode(userPref) as Map<String, dynamic>;
              
              //set List
              //Map<String, dynamic> orderList = {'Username':obtainedUserName,'PName':widget.mbName,'PPrice':widget.fixedPrice.toString()};
              //userPref=orderList.toString();
              //print(orderList);
              
              //bool result = await prefs.setString('orderList', jsonEncode(userPref));

              //if(result == true){
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                // return MyOrderPageWidget();
                // }));  
              //}
            },
            child: Text("Place Order Request")
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () async{
              final SharedPreferences sharedPreferences=await SharedPreferences.getInstance(); 
              var obtainedUserName = sharedPreferences.getString('user_name');
              
              Navigator.push(context, MaterialPageRoute(builder:(context){
                return MyHomePageWidget(obtainedUserName);
              }));
            },
            child: Text("Cancel Order Request")
          )
        ],
      )
    );
  }
}


