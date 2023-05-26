import 'package:flutter/material.dart';

import '../../../../Mobile Questions/mobileQuestions.dart';

void askWorkableDevice(BuildContext context,String imgAddress,String mbName,int fixedPrice){
  var alertDialog=AlertDialog(
    title: Text("Is Your Device working?"),
    content: Text("Please Select"),
    actions: <Widget>[
      ElevatedButton(child: Text("Yes"),onPressed: (){
        
        Navigator.push(context, MaterialPageRoute(builder: (context){

                return MyMobileQuestionWidget(imgAddress,mbName,fixedPrice);
              
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
      var alertEmpDialog=AlertDialog(title: Text("Our Employee will reach to you"),actions: <Widget>[
          ElevatedButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context){
            return MyRealmeBrand();
          })); }, child: Text("OK"))
        ],
      );
      return alertEmpDialog;
     }
    );
}

class MyRealmeBrand extends StatelessWidget {
  MyRealmeBrand({super.key});

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
                              imgSend="assets/realme/realme8pro.jpg";
                              mbName="Realme 8 Pro";
                              fixedPrice=8000;
                              askWorkableDevice(context,imgSend,mbName,fixedPrice);
                              //Navigator.pushNamed(context, 'appleBrand');
                            },
                            child: Container(
                              padding: EdgeInsets.only(top:8),
                              child: ClipRRect(
                                // borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/realme/realme8pro.jpg",
                                    width: 70,
                                    //height: 80,
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
                          child: Text("8 pro",
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
                SizedBox(width:30,),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child:Container(
                    padding: EdgeInsets.only(top: 5),
                    child:Column(
                      children:[
                        Container(
                          padding: EdgeInsets.only(left:4),
                          child: GestureDetector(
                            onTap: () {
                              imgSend="assets/realme/realme9pro.png";
                              mbName="Realme 9 Pro";
                              fixedPrice=11000;
                              askWorkableDevice(context,imgSend,mbName,fixedPrice);
                              //Navigator.pushNamed(context, 'appleBrand');
                            },
                            child: Container(
                              padding: EdgeInsets.only(top:8),
                              child: ClipRRect(
                                // borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/realme/realme9pro.png",
                                    width: 70,
                                    //height: 80,
                                ),
                              ),
                            ),
                          ),
                          
                          // child: Image(image: AssetImage("assets/realme/realme9pro.png"),
                          // width: 90,
                          //)
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          padding: EdgeInsets.only(),
                          child: Text("9 pro",
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
        Container(
          child:Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child:Container(
                    child:Column(
                      children:[
                        Container(
                          padding: EdgeInsets.only(),
                          child: GestureDetector(
                            onTap: () {
                              imgSend="assets/realme/realme10pro.png";
                              mbName="Realme 10 Pro";
                              fixedPrice=14000;
                              askWorkableDevice(context,imgSend,mbName,fixedPrice);
                              //Navigator.pushNamed(context, 'smallCategoryHomePage');
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/realme/realme10pro.png",
                                    width: 90
                                    ),
                              ),
                            ),
                        ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          padding: EdgeInsets.only(),
                          child: Text("10 pro",
                          style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold)
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
          ) 
        ]
      )
    );
  }
}


// Future<void> _showMyDialog() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('AlertDialog Title'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 Text('This is a demo alert dialog.'),
//                 Text('Would you like to approve of this message?'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Confirm'),
//               onPressed: () {
//                 print('Confirmed');
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//  }

