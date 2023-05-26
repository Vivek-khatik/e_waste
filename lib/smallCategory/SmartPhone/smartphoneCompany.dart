import 'package:flutter/material.dart';

class MysmartphoneCompany extends StatelessWidget {
  const MysmartphoneCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Select Brand",
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
                          padding: EdgeInsets.only(top:18,right:5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'appleBrand');
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/smartphoneCompany/apple.png",
                                    width: 95.0, height: 50.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          padding: EdgeInsets.only(top:14,right:4),
                          child: Text("Apple",
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
                    child:Column(
                      children:[
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'samsungBrand');
                            },
                            child: Container(
                              padding: EdgeInsets.only(left:4),
                              child: Image(image: AssetImage("assets/smartphoneCompany/samsung.png"),
                              width: 90,
                              )
                            ),
                          )
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          padding: EdgeInsets.only(),
                          child: Text("Samsung",
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
                          padding: EdgeInsets.only(top:18),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'realmeBrand');
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/smartphoneCompany/Realme_logo.png",
                                    width: 95.0, height: 50.0),
                              ),
                            ),
                        ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          padding: EdgeInsets.only(top:14,right:4),
                          child: Text("Realme",
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
                // Padding(
                //   padding: EdgeInsets.only(left: 15),
                //   child:Container(
                //     child:Column(
                //       children:[
                //         Container(
                //           padding: EdgeInsets.only(top:30),
                //           child: Image(image: AssetImage("assets/smartphoneCompany/OnePlus.png"),
                //           width: 100,
                //           )
                //         ),
                //         SizedBox(
                //           height: 27,
                //         ),
                //         Container(
                //           padding: EdgeInsets.only(),
                //           child: Text("Oneplus",
                //           style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                //           ),
                //         ),
                //       ]
                //     ),
                //     height: 120,
                //     width: 115,
                //     decoration: BoxDecoration(
                //       color:Color(0xFFe3dede),
                //       borderRadius: BorderRadius.circular(10),
                //     )
                //   )
                // ),
                // SizedBox(width:5,),
              ],
            )  ,  
        ),
        // SizedBox(height: 30),
        // Container(
        //   child:Row(children: [
        //         Padding(
        //           padding: EdgeInsets.only(left: 45),
        //           child:Container(
        //             child:Column(
        //               children:[
        //                 Container(
        //                   padding: EdgeInsets.only(top:18),
        //                   child: GestureDetector(
        //                     onTap: () {
        //                       Navigator.pushNamed(context, 'smallCategoryHomePage');
        //                     },
        //                     child: Container(
        //                       child: ClipRRect(
        //                         borderRadius: BorderRadius.circular(20.0),
        //                         child: Image.asset("assets/smartphoneCompany/xiaomi.png",
        //                             width: 95.0, height: 50.0),
        //                       ),
        //                     ),
        //                 ),
        //                 ),
        //                 SizedBox(
        //                   height: 1,
        //                 ),
        //                 Container(
        //                   padding: EdgeInsets.only(top:14,right:4),
        //                   child: Text("Mi",
        //                   style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
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
        //         SizedBox(width:30,),
        //         Padding(
        //           padding: EdgeInsets.only(left: 15),
        //           child:Container(
        //             child:Column(
        //               children:[
        //                 Container(
        //                   padding: EdgeInsets.only(top:40),
        //                   child: Image(image: AssetImage("assets/smartphoneCompany/nokia.png"),
        //                   width: 100,
        //                   )
        //                 ),
        //                 SizedBox(
        //                   height: 20,
        //                 ),
        //                 Container(
        //                   padding: EdgeInsets.only(),
        //                   child: Text("Nokia",
        //                   style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
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
        //         SizedBox(width:5,),
        //       ],
        //     )  ,  
        //   ) 
      ]
    )
    );
  }
}