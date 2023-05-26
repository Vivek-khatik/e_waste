import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class MyIntroPage3 extends StatelessWidget {
  const MyIntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child:Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top:155,right: 10),
          child: Image(image: AssetImage("assets/Save_the_phone1.png")
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          // color: Colors.greenAccent,
          child:Container(
            padding: EdgeInsets.only(left:45,top:530),
            // child:Center(
              child:Text.rich(TextSpan(children: [
                WidgetSpan(child: Icon(Icons.info_outline_rounded)),
                TextSpan(text: "SAVE THE EARTH",
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

