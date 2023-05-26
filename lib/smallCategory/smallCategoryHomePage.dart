import 'package:flutter/material.dart';

class MysmallCategoryHomePage extends StatelessWidget {
  const MysmallCategoryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("What would you like to recycle?",
        style: TextStyle(fontSize: 19,color: Colors.black)),
        iconTheme: IconThemeData(
          color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body:SingleChildScrollView(
        child:Container(
        color: Color(0xFFe3dede),
        child:Column(
          children: [
            SizedBox(height:10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'smartphoneCompany');
              },
              child:Container(
              color: Colors.white,
              height: 100,
              child:Row(
                children: [
                  Container(
                    child: Image(image: AssetImage("assets/smallCategory/iphone.png"),
                      width:110,
                      height: 80,
                    )
                  ),
                  Container(
                    padding:EdgeInsets.only(left:50),
                    child: Text("SmartPhone",
                    style:TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.black 
                      )
                    )
                  )
                ]  
              )
              ),
            ),
            SizedBox(height:30),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'serviceNotAvailable');
              },
              child:Container(
              color: Colors.white,
              height: 100,
              child:Row(
                children: [
                  Container(
                    child: Image(image: AssetImage("assets/smallCategory/earphones.png"),
                      width:110,
                      height: 80,
                    )
                  ),
                  Container(
                    padding:EdgeInsets.only(left:50),
                    child: Text("Earphone",
                    style:TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.black 
                      )
                    )
                  )
                ]  
              )
              ),
            ),
            SizedBox(height:30),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'serviceNotAvailable');
              },
              child:Container(
              color: Colors.white,
              height: 100,
              child:Row(
                children: [
                  Container(
                    child: Image(image: AssetImage("assets/smallCategory/battery.png"),
                      width:110,
                      height: 80,
                    )
                  ),
                  Container(
                    padding:EdgeInsets.only(left:50),
                    child: Text("Charger",
                    style:TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.black 
                      )
                    )
                  )
                ]  
              )
              ),
            ),
            SizedBox(height:30),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'serviceNotAvailable');
              },
              child:Container(
              color: Colors.white,
              height: 100,
              child:Row(
                children: [
                  Container(
                    child: Image(image: AssetImage("assets/smallCategory/tablet.png"),
                      width:110,
                      height: 80,
                    )
                  ),
                  Container(
                    padding:EdgeInsets.only(left:50),
                    child: Text("Tablet",
                    style:TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.black 
                      )
                    )
                  )
                ]  
              )
              ),
            ),
            SizedBox(height:30),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'serviceNotAvailable');
              },
              child:Container(
              color: Colors.white,
              height: 100,
              child:Row(
                children: [
                  Container(
                    child: Image(image: AssetImage("assets/smallCategory/watch.png"),
                      width:110,
                      height: 80,
                    )
                  ),
                  Container(
                    padding:EdgeInsets.only(left:50),
                    child: Text("Smart Watch",
                    style:TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.black 
                      )
                    )
                  )
                ]  
              )
              ),
            ),
            SizedBox(height:30),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'serviceNotAvailable');
              },
              child:Container(
              color: Colors.white,
              height: 100,
              child:Row(
                children: [
                  Container(
                    child: Image(image: AssetImage("assets/smallCategory/speaker.png"),
                      width:110,
                      height: 80,
                    )
                  ),
                  Container(
                    padding:EdgeInsets.only(left:50),
                    child: Text("Smart Speaker",
                    style:TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.black 
                      )
                    )
                  )
                ]  
              )
              ),
            ),
            SizedBox(height:30),
          ],
        )
      )
    )
    );
  }
}