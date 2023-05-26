import 'package:flutter/material.dart';

import '../../../../Mobile Questions/mobileQuestions.dart';
import '../../../Monitor Questions/monitorQuestions.dart';

void askWorkableDevice(BuildContext context,String imgAddress,String mbName,int fixedPrice){
  var alertDialog=AlertDialog(
    title: Text("Is Your Device working?"),
    content: Text("Please Select"),
    actions: <Widget>[
      ElevatedButton(child: Text("Yes"),onPressed: (){
        
        Navigator.push(context, MaterialPageRoute(builder: (context){

                return MyMonitorQuestionWidget(imgAddress,mbName,fixedPrice);
              
              }));
      }),
      
      ElevatedButton(child: Text("No"),onPressed: (){
        showEmpDialog(context);
      }),  
    ],
  );

  showDialog(
    context: context,
     builder:(BuildContext context){
      return alertDialog;
     }
    );
}

void showEmpDialog(BuildContext context){
  showDialog(
    context: context,
     builder:(BuildContext context){
      var alertEmpDialog=AlertDialog(title: Text("Our Employee will reach to you"),
      actions: <Widget>[
        ElevatedButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context){
            return MySamsungMonitorBrand();
          })); }, child: Text("OK"))
      ],
      );
      return alertEmpDialog;
     }
    );
}

class MySamsungMonitorBrand extends StatelessWidget {
  MySamsungMonitorBrand({super.key});

  String mbName="";
  String imgSend="";
  int fixedPrice=0;

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
    body:Column(
      children:[
        SizedBox(height: 50,),
        Container(
          child:Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child:Container(
                    child:Column(
                      children:[
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              imgSend="assets/samsung/samsungS27.png";
                              mbName="Samsung S27";
                              fixedPrice=11000;
                              askWorkableDevice(context,imgSend,mbName,fixedPrice);
                              //Navigator.pushNamed(context, 'appleBrand');
                            },
                            child: Container(
                              padding: EdgeInsets.only(top:3),
                              child: ClipRRect(
                                // borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/samsung/samsungS27.png",
                                    width: 130,
                                    height: 90,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          //padding: EdgeInsets.only(),
                          child: Text("S27AM501NU",
                          style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)
                          ),
                        ),
                      ]
                    ),
                    height: 120,
                    width: 115,
                    decoration: BoxDecoration(
                      color:Color(0xFFe3dede),
                      borderRadius: BorderRadius.circular(10),
                    )
                  )
                ),
                SizedBox(width:30,),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child:Container(
                    child:Column(
                      children:[
                        Container(
                          padding: EdgeInsets.only(left:4),
                          child: GestureDetector(
                            onTap: () {
                              imgSend="assets/samsung/samsungM5.png";
                              mbName="Samsung M5";
                              fixedPrice=16000;
                              askWorkableDevice(context,imgSend,mbName,fixedPrice);
                              //Navigator.pushNamed(context, 'appleBrand');
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/samsung/samsungM5.png",
                                    width: 90,
                                ),
                              ),
                            ),
                          ),
                          // child: Image(image: AssetImage("assets/samsung/samsungnote10.png"),
                          // width: 90,
                          // )
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          padding: EdgeInsets.only(),
                          child: Text("M 5",
                          style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                          ),
                        ),
                      ]
                    ),
                    height: 120,
                    width: 115,
                    decoration: BoxDecoration(
                      color:Color(0xFFe3dede),
                      borderRadius: BorderRadius.circular(10),
                    )
                  )
                ),
                SizedBox(width:5,),
              ],
            )  ,  
          ),
        SizedBox(height: 30),
        // Container(
        //   child:Row(children: [
        //         Padding(
        //           padding: EdgeInsets.only(left: 45),
        //           child:Container(
        //             child:Column(
        //               children:[
        //                 Container(
        //                   padding: EdgeInsets.only(),
        //                   child: GestureDetector(
        //                     onTap: () {
        //                       imgSend="assets/samsung/samsungnote20.png";
        //                       mbName="Samsung Note 20+";
        //                       fixedPrice=22000;
        //                       askWorkableDevice(context,imgSend,mbName,fixedPrice);
        //                       // Navigator.pushNamed(context, 'smallCategoryHomePage');
        //                     },
        //                     child: Container(
        //                       child: ClipRRect(
        //                         borderRadius: BorderRadius.circular(20.0),
        //                         child: Image.asset("assets/samsung/samsungnote20.png",
        //                             width: 90
        //                             ),
        //                       ),
        //                     ),
        //                 ),
        //                 ),
        //                 SizedBox(
        //                   height: 1,
        //                 ),
        //                 Container(
        //                   padding: EdgeInsets.only(),
        //                   child: Text("Note 20 Ultra",
        //                   style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold)
        //                   ),
        //                 ),
        //               ]
        //             ),
        //             height: 120,
        //             width: 115,
        //             decoration: BoxDecoration(
        //               color:Color(0xFFe3dede),
        //               borderRadius: BorderRadius.circular(10),
        //             )
        //           )
        //         ),  
        //       SizedBox(width:5,),
        //       ],
        //     )  ,  
        //   ) 
        
        ]
      )
    );
  }
}




