import 'package:e_waste/productPricePage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class MyMonitorQuestionWidget extends StatefulWidget {
  
  String imgAddress="";
  String mbName="";
  int fixedPrice=0;
  MyMonitorQuestionWidget(this.imgAddress,this.mbName,this.fixedPrice);

  @override
  State<MyMonitorQuestionWidget> createState() => _MyMobileQuestionWidgetState();
}

enum Working {Yes, No}

class _MyMobileQuestionWidgetState extends State<MyMonitorQuestionWidget> {
  
  Working? _workingdisplay;
  Working? _workingbattery;
  Working? _workingcamera;
  Working? _dentOnScreen;
  Working? _availbb;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Some Questions...",
        style: TextStyle(fontSize: 19,color: Colors.black)),
        iconTheme: IconThemeData(
          color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child:Column(
              children:[ Container(
                child: Text("Is Display Working?"),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<Working>(
                      contentPadding: EdgeInsets.only(left: 40),
                      value: Working.Yes,
                      dense: true,
                      title: Text(Working.Yes.name),
                      groupValue: _workingdisplay, 
                      onChanged: (value){
                        setState((){
                          _workingdisplay=value;
                        });
                      }
                    ),
                  ),
                  SizedBox(width:0,),
                  Expanded(
                    child: RadioListTile<Working>(
                      contentPadding: EdgeInsets.all(0.0),
                      value: Working.No,
                      dense: true,
                      title: Text(Working.No.name),
                      groupValue: _workingdisplay, 
                      onChanged: (value){
                        setState((){
                          _workingdisplay=value;
                        });
                      }
                    ),
                  ),
                ]
              )    
              ]      
            ),
            margin: EdgeInsets.only(top: 40), 
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
            color:Color(0xFFe3dede),
            borderRadius: BorderRadius.circular(10),
            )
          ),
            Container(
              child:Column(
              children:[ Container(
                child: Text("Is Body in Good Condition?"),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<Working>(
                      contentPadding: EdgeInsets.only(left: 40),
                      value: Working.Yes,
                      dense: true,
                      title: Text(Working.Yes.name),
                      groupValue: _workingbattery, 
                      onChanged: (value){
                        setState((){
                          _workingbattery=value;
                        });
                      }
                    ),
                  ),
                  SizedBox(width:0,),
                  Expanded(
                    child: RadioListTile<Working>(
                      contentPadding: EdgeInsets.all(0.0),
                      value: Working.No,
                      dense: true,
                      title: Text(Working.No.name),
                      groupValue: _workingbattery, 
                      onChanged: (value){
                        setState((){
                          _workingbattery=value;
                        });
                      }
                    ),
                  ),
                ]
              )    
              ]      
            ),
            margin: EdgeInsets.only(top: 40), 
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
            color:Color(0xFFe3dede),
            borderRadius: BorderRadius.circular(10),
            )
          ),
            
            Container(
              child:Column(
                children:[ Container(
                  child: Text("Any Dent on Screen?"),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<Working>(
                        contentPadding: EdgeInsets.only(left: 40),
                        value: Working.Yes,
                        dense: true,
                        title: Text(Working.Yes.name),
                        groupValue: _dentOnScreen, 
                        onChanged: (value){
                          setState((){
                            _dentOnScreen=value;
                          });
                        }
                      ),
                    ),
                    SizedBox(width:0,),
                    Expanded(
                      child: RadioListTile<Working>(
                        contentPadding: EdgeInsets.all(0.0),
                        value: Working.No,
                        dense: true,
                        title: Text(Working.No.name),
                        groupValue: _dentOnScreen, 
                        onChanged: (value){
                          setState((){
                            _dentOnScreen=value;
                          });
                        }
                      ),
                    ),
                  ]
                )    
              ]      
            ),
              margin: EdgeInsets.only(top: 40), 
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
              color:Color(0xFFe3dede),
              borderRadius: BorderRadius.circular(10),
              )
            ),
            
            Container(
              child:Column(
                children:[ Container(
                  child: Text("Bill Box Available?"),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<Working>(
                        contentPadding: EdgeInsets.only(left: 40),
                        value: Working.Yes,
                        dense: true,
                        title: Text(Working.Yes.name),
                        groupValue: _availbb, 
                        onChanged: (value){
                          setState((){
                            _availbb=value;
                          });
                        }
                      ),
                    ),
                    SizedBox(width:0,),
                    Expanded(
                      child: RadioListTile<Working>(
                        contentPadding: EdgeInsets.all(0.0),
                        value: Working.No,
                        dense: true,
                        title: Text(Working.No.name),
                        groupValue: _availbb, 
                        onChanged: (value){
                          setState((){
                            _availbb=value;
                          });
                        }
                      ),
                    ),
                  ]
                )    
              ]      
            ),
              margin: EdgeInsets.only(top: 40), 
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
              color:Color(0xFFe3dede),
              borderRadius: BorderRadius.circular(10),
              )
            ),
            SizedBox(height: 20,),
            ElevatedButton(
            onPressed: (){
              
              if(_workingdisplay == null || _workingbattery == null || _dentOnScreen == null || _availbb ==null ){
                Fluttertoast.showToast(
                msg: "Please Answer All Questions",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                fontSize: 16.0
                );
              }
              else{
               var cal_fixedPrice=widget.fixedPrice;
              setState(() {
                if(_workingdisplay.toString()=="Working.No"){
                  //cal_fixedPrice-=3000;
                  cal_fixedPrice -= (cal_fixedPrice*50~/100).toInt();
                }
                if(_workingbattery.toString()=="Working.No"){
                  //cal_fixedPrice-=1500;
                  cal_fixedPrice -= (cal_fixedPrice*8~/100).toInt();
                }
                if(_dentOnScreen.toString()=="Working.No"){
                  cal_fixedPrice -= (cal_fixedPrice*10~/100).toInt();
                }
                if(_availbb.toString()=="Working.No"){
                  cal_fixedPrice -= (cal_fixedPrice*10~/100).toInt();
                }
              }); 

              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MyProductPricePageWidget(cal_fixedPrice,widget.imgAddress,widget.mbName);
              })); 
              }
            },
            child: Text("Submit")
          )
          ],
        ),
      ),
    );
  }
}