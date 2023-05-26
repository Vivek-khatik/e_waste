import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyTermsWidget extends StatelessWidget {
  const MyTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          SizedBox(height: 60,),
          Container(
            padding: EdgeInsets.only(left:10,right: 10),
            decoration: BoxDecoration(
              color:Color(0xFFe3dede),
              borderRadius: BorderRadius.circular(20),
            ),
            child:Text("   Thank you for considering using our recycling app. Before you proceed, please read and agree to the following terms and conditions:",
            style: TextStyle(
              fontSize: 20,
            ),
            )
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left:10,right: 10),
            decoration: BoxDecoration(
              color:Color(0xFFe3dede),
              borderRadius: BorderRadius.circular(10),
            ),
            child:Text("1.Acceptance of Terms: By downloading and using the recycling app, you agree to be bound by these terms and conditions.")
            ),
          SizedBox(height: 20,),

          Container(
            padding: EdgeInsets.only(left:10,right: 10),
            decoration: BoxDecoration(
              color:Color(0xFFe3dede),
              borderRadius: BorderRadius.circular(10),
            ),
            child:Text("2.Use of the App: Our recycling app is designed to help you manage your recycling efforts. You may use the app only for lawful purposes and in accordance with these terms and conditions."),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left:10,right: 10),
            decoration: BoxDecoration(
              color:Color(0xFFe3dede),
              borderRadius: BorderRadius.circular(10),
            ),
            child:Text("3.User Accounts: In order to use the app, you may be required to create a user account. You must provide accurate and complete information when creating your account, and you are responsible for maintaining the confidentiality of your login information."),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left:10,right: 10),
            decoration: BoxDecoration(
              color:Color(0xFFe3dede),
              borderRadius: BorderRadius.circular(10),
            ),
            child:Text("4.Intellectual Property: The app and all of its contents, including but not limited to text, graphics, logos, icons, images, and software, are the property of the app developer and are protected by copyright and other intellectual property laws. You may not use the app or its contents for any purpose other than those expressly permitted by these terms and conditions."),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left:10,right: 10),
            decoration: BoxDecoration(
              color:Color(0xFFe3dede),
              borderRadius: BorderRadius.circular(10),
            ),
            child:Text(   "5.User Content: You may submit content, including but not limited to recycling information and feedback, to the app. You retain all rights in, and are solely responsible for, the content you submit. By submitting content to the app, you grant the app developer a non-exclusive, worldwide, royalty-free license to use, copy, modify, and distribute the content in connection with the app."),
          ),
        ]
      )
    );
  }
}