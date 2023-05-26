import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class MyIntroPage2 extends StatelessWidget {
  const MyIntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child:Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top:195,right:3),
          child: Image(image: AssetImage("assets/Doorstep_Pickup1.png")
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          // color: Colors.greenAccent,
          child:Container(
            padding: EdgeInsets.only(left:35,top:500),
            // child:Center(
              child:Text.rich(TextSpan(children: [
                WidgetSpan(child: Icon(Icons.info_outline_rounded)),
                TextSpan(text: "DOORSTEP PICKUP",
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


