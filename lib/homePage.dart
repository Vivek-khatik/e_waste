// import 'package:e_waste/Global/globalVarDeclare.dart';
import 'dart:convert';

import 'package:e_waste/Profile.dart';
import 'package:e_waste/login.dart';
import 'package:e_waste/mediumCategory/Monitor/Brand/Samsung/samsungMonitorBrand.dart';
import 'package:e_waste/mediumCategory/Monitor/Brand/monitorCompany.dart';
import 'package:e_waste/productPricePage.dart';
import 'package:e_waste/searchPage.dart';
import 'package:e_waste/splashScreen.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Order/orderPage.dart';

class MyHomePageWidget extends StatefulWidget {
  String user_name;
  MyHomePageWidget(this.user_name);

  @override
  State<MyHomePageWidget> createState() => _MyHomePageWidgetState();
}

class _MyHomePageWidgetState extends State<MyHomePageWidget> {

  @override
  Widget build(BuildContext context) {

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

  Future<bool> showExitPopup() async {
      return await showDialog( //show confirm dialogue 
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit an App?'),
          actions:[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
               //return false when click on "NO"
              child:Text('No'),
            ),

            ElevatedButton(
              //onPressed: () => Navigator.of(context).pop(true), 
              //return true when click on "Yes"
              onPressed:(){SystemNavigator.pop();},
              child:Text('Yes'),
            ),

          ],
        ),
      )??false; //if showDialouge had returned null, then return false
    }

    const imagelist=["assets/Mar-Business_11.jpg",
                      "assets/doorstep2.jpg",
                      "assets/save_earth2.jpg"];
    
    String dispUserName=widget.user_name;

    return WillPopScope( 
      onWillPop: showExitPopup, //call function on back button press
      child: Scaffold(
      body:SingleChildScrollView(
        child: Column(
        children: [
          // FutureBuilder(builder: (context.(context, snapshot) (context, snapshot) {
          //   return Text(sna)
          // }))
          Row(
            children: [ 
              Container(
                padding: EdgeInsets.only(top:50,left: 20),
                child: Text("Hello $dispUserName",
                  style: TextStyle(
                    fontSize: 40,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..strokeWidth = 10
                      ..color = Colors.black54,
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(top:20,left:100),
              //   child:ElevatedButton(
              //     onPressed: ()async{
                    
              //       final SharedPreferences sharedPreferences=await SharedPreferences.getInstance(); 
              //       sharedPreferences.remove('user_name');
              //       sharedPreferences.remove('user_email');
              //       setState(() {
              //         Navigator.push(context,MaterialPageRoute(builder: (context){
              //         return MySplashScreen();
              //       }));
              //       }); 
              //     },
              //     child: Text("Logout"),
              //   )
              // ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 15,left: 90,right: 90,bottom: 15),
            color: Colors.black12,
            child: GestureDetector(
              child: ClipRRect(
                borderRadius:  BorderRadius.circular(80.0),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 25,),
                    Text('Click to Search'),
                  ],
                )
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MySearchPage();
                }));  
              },
                // child: Container(
                // padding: EdgeInsets.only(top: 10,left: 20,right: 20),        
                // child:TextField(
                //   readOnly: true,
                //   decoration: InputDecoration(
                //     prefixIcon: Icon(Icons.search),
                //     filled: true,
                //     fillColor: Colors.white,
                //     hintText: "Search Your Waste Type",
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10)
                //     ),
                //   ),
                // ),
              //),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            child:VxSwiper.builder(
              aspectRatio: 16/9,
              autoPlay: true,
              height: 150,
              enlargeCenterPage: true,
              itemCount: 3, 
              itemBuilder: (context,index){
                return Container(
                  child: Image.asset(
                    imagelist[index],
                    fit: BoxFit.fill,
                  )
                );
              }
            )
          ),
          SizedBox(height: 10,),

          Container(
            child:Text("Select Category",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            ),
          ),

          SizedBox(height: 10,),

          Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child:Container(
                child:Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Container(
                      padding: EdgeInsets.only(top:18,right:5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'smallCategoryHomePage');
                        },
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset("assets/tablet-applications.png",
                                width: 95.0, height: 40.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      padding: EdgeInsets.only(top:14,right:4),
                      child: Text("Small",
                      style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                      ),
                    ),
                  ]
                ),
                height: 120,
                width: 90,
                decoration: BoxDecoration(
                  color:Color(0xFFe3dede),
                  borderRadius: BorderRadius.circular(10),
                )
              )
            ),
            SizedBox(width:8,),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child:Container(
                child:Column(
                  children:[
                    Container(
                      padding: EdgeInsets.only(left:4,top:20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context){
                            return MyMonitorCompany();
                          }));
                        },
                        child: Container(
                          child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/monitor.png",
                                    width: 95.0, height: 50.0),
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      padding: EdgeInsets.only(top:12),
                      child: Text("Medium",
                      style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                      ),
                    ),
                  ]
                ),
                height: 120,
                width: 90,
                decoration: BoxDecoration(
                  color:Color(0xFFe3dede),
                  borderRadius: BorderRadius.circular(10),
                )
              )
            ),
            SizedBox(width:5,),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child:Container(
                child:Column(
                  children:[
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'serviceNotAvailable');
                        },
                        child:Container(
                      padding: EdgeInsets.only(left:4,top:17),
                      child: Image(image: AssetImage("assets/fridge.png"),
                      width: 55,
                      )
                    ),)),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      padding: EdgeInsets.only(top:10),
                      child: Text("Large",
                      style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                      ),
                    ),
                  ]
                ),
                height: 120,
                width: 90,
                decoration: BoxDecoration(
                  color:Color(0xFFe3dede),
                  borderRadius: BorderRadius.circular(10),
                )
              )
            )
          ],
          )  ,  
        
        SizedBox(height: 20,),

        Container(
            child:Text("Select Device",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            )
          ),

        SizedBox(height: 10,),

        Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 25,bottom: 50),
              child:Container(
                child:Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                              return MyMonitorCompany();
                            }));
                        },
                        child:Container(
                      // padding: EdgeInsets.only(right:5),
                      child: Image(image: AssetImage("assets/mediumCategory/Monitor.png"),
                      width: 60,
                      )
                    ),
                    )),
                    Container(
                      padding: EdgeInsets.only(right:2),
                      child: Text("Monitors",
                      style:TextStyle(fontSize: 12,fontWeight: FontWeight.bold)
                      ),
                    ),
                  ]
                ),
                height: 80,
                width: 70,
                decoration: BoxDecoration(
                  color:Color(0xFFe3dede),
                  borderRadius: BorderRadius.circular(10),
                )
              )
            ),
            SizedBox(width:8,),
            Padding(
              padding: EdgeInsets.only(left: 27,bottom: 50),
              child:Container(
                child:Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'serviceNotAvailable');
                        },
                    child:Container(
                      // padding: EdgeInsets.only(right:5),
                      child: Image(image: AssetImage("assets/earbuds.png"),
                      width: 55,
                      )
                    ),)),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      padding: EdgeInsets.only(right:2),
                      child: Text("HeadPhones",
                      style:TextStyle(fontSize: 11,fontWeight: FontWeight.bold)
                      ),
                    ),
                  ]
                ),
                height: 80,
                width: 70,
                decoration: BoxDecoration(
                  color:Color(0xFFe3dede),
                  borderRadius: BorderRadius.circular(10),
                )
              )
            ),
            SizedBox(width:5,),
            Padding(
              padding: EdgeInsets.only(left: 29,bottom: 50),
              child:Container(
                child:Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                   Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'smartphoneCompany');
                        },
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(image: AssetImage("assets/smartphone.png"),
                              width: 55,
                            )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(right:2),
                      child: Text("SmartPhones",
                      style:TextStyle(fontSize: 11,fontWeight: FontWeight.bold)
                      ),
                    ),
                  ]
                ),
                height: 80,
                width: 70,
                decoration: BoxDecoration(
                  color:Color(0xFFe3dede),
                  borderRadius: BorderRadius.circular(10),
                )
              )
            )
          ],
        )  ,
          
          Container(
            child:ElevatedButton.icon(onPressed: (){}, 
            icon: Icon(Icons.info),
            label: Text("Available Recycling Centers"),
            )
          )
        ],
      ),
      ),
      
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.home),
              onPressed: ((){
                onPressed: () => Navigator.of(context).pop(false);
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
        //elevation: 20.0,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        //selectedItemColor: Colors.amber[800],
      ) 
    )
  );
  }
}