// import 'dart:html';

// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class MyIntroPage1 extends StatelessWidget {
  const MyIntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child:Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top:115,right: 5),
          child: Image(image: AssetImage("assets/assured_price1-removebg-preview.png")
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          // color: Colors.greenAccent,
          child:Container(
            padding: EdgeInsets.only(left:60,top:510),
            // child:Center(
              child:Text.rich(TextSpan(children: [
                WidgetSpan(child: Icon(Icons.info_outline_rounded)),
                TextSpan(text: "ASSURED PRICE",
              style: TextStyle(color: Colors.black87,fontSize: 30 ),
              )
              ], 
              )
              ),
            // child: 
            // ),
          // ),
        ),
        )
      ],
    ) 
    );
  }
}