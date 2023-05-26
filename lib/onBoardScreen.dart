import 'package:e_waste/introPage1.dart';
import 'package:e_waste/introPage2.dart';
import 'package:e_waste/introPage3.dart';
//import 'package:e_waste/login.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class MyOnBoardScreen extends StatefulWidget {
  const MyOnBoardScreen({super.key});

  @override
  State<MyOnBoardScreen> createState() => _MyOnBoardScreenState();
}

class _MyOnBoardScreenState extends State<MyOnBoardScreen> {
  
  PageController _controller=PageController();
  
  bool onLastPage=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage=(index==2);
              });
            },
            children: [
              MyIntroPage1(),
              MyIntroPage2(),
              MyIntroPage3()
            ],
          ),
          Container(
            alignment:Alignment(0, 0.75),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               
                SmoothPageIndicator(controller: _controller,count:3),

                onLastPage ?
                  GestureDetector(
                    onTap: (() {
                      Navigator.pushNamed(context, 'login');
                    }),
                    child:Text("done")
                  ):
                  GestureDetector(
                    onTap: (() {
                      _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                    }),
                    child:Text("next")
                  )
              ],
            )
          )
        ],
      ),
    );
  }
}