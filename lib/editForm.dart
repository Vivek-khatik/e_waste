import 'dart:async';
import 'dart:convert';

import 'package:e_waste/login.dart';
import 'package:e_waste/register.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'homePage.dart';

class MyEditFormWidget extends StatefulWidget {
  String getUserId="";
  String getUserName="";
  String getUserSurname="";
  String getUserGender="";
  String getUserPassword="";
  String getUserGmail="";
  String getUserMobile="";
  String getUserIdProof="";

  MyEditFormWidget(this.getUserId,this.getUserName,this.getUserSurname,this.getUserGender,this.getUserPassword,this.getUserGmail,this.getUserMobile,this.getUserIdProof);

  @override
  State<MyEditFormWidget> createState() => _MyEditFormWidgetState();
}

enum GenderEnum { male, female, other }

class _MyEditFormWidgetState extends State<MyEditFormWidget> {
  
  final _text = TextEditingController();
  bool _validate_first_name = false;
  bool _validate_last_name = false;
  bool _validate_password = false;
  bool _validate_email = false;
  bool _validate_contact_No = false;
  bool _validate_id_Proof = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  GenderEnum? gender;

  TextEditingController first_name=TextEditingController();
  TextEditingController last_name=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController contact_No=TextEditingController();
  TextEditingController id_Proof=TextEditingController();
  String Fgender="";

  @override
  void initState(){
    switch(widget.getUserGender){
      case "male":
        gender=GenderEnum.male;
      break;
      case "female":
        gender=GenderEnum.female;
      break;
      case "other":
        gender=GenderEnum.other;
      break;
    }
    first_name.text=widget.getUserName;
    last_name.text=widget.getUserSurname;
    password.text=widget.getUserPassword;
    email.text=widget.getUserGmail;
    contact_No.text=widget.getUserMobile;
    id_Proof.text=widget.getUserIdProof;
    super.initState();
  }

  Future insertValue() async{

    if(gender.toString()=="GenderEnum.male"){
      Fgender="male";
    }
    if(gender.toString()=="GenderEnum.female"){
      Fgender="female";
    }
    if(gender.toString()=="GenderEnum.other"){
      Fgender="other";
    }

    //final SharedPreferences sharedPreferences=await SharedPreferences.getInstance(); 
    // var obtainedUserId = sharedPreferences.getString('user_id');
    // var obtainedUserName="";
    // var obtainedUserSurname="";
    // var obtainedUserGender="";
    // var obtainedUserPassword="";
    // var obtainedUserGmail="";
    // var obtainedUserMobile="";
    // var obtainedUserIdProof="";

    var APIURL="https://ewaste123.000webhostapp.com/user_register.php";
    Map mapdata={
      "userId":widget.getUserId,
      "first_name":first_name.text,
      "last_name":last_name.text,
      "gender":Fgender,
      "password":password.text,
      "email":email.text,
      "contactNo":contact_No.text,
      "idProof":id_Proof.text
    };

    
    // http.Response response=await http.post(Uri.parse(APIURL),body:mapdata);
    
    // try{
    //   if(first_name.text != "" && last_name.text != "" && Fgender != "" && password.text != "" && email.text != "" && contact_No.text != "" && id_Proof.text != "")
    //   {
    //     var data=jsonDecode(json.encode(response.body));

    //     if(data=="success" || data==""){
    //       Navigator.push(context,MaterialPageRoute(builder:(context) => MyHomePageWidget(first_name.text)));
    //       Fluttertoast.showToast(
    //         msg: "Updated Successfully",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.BOTTOM,
    //         fontSize: 16.0
    //       );
    //     }
    //     else{
    //       Fluttertoast.showToast(
    //         msg: "Update unsuccessful",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.BOTTOM,
    //         fontSize: 16.0
    //       );
    //     }
    //   }
    //   else{
    //     Fluttertoast.showToast(
    //     msg: "Fields cannot be empty",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     fontSize: 16.0
    //     );  
    //   }     
    // }
    // catch(ex){
    //   Fluttertoast.showToast(
    //     msg: "Update unsuccessful",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     fontSize: 16.0
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background1.jpg"),
          fit: BoxFit.cover 
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView( 
          child:
          Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left:30,top: 60),
              child: Text("Register Form",
              style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              child:Container(
                padding: EdgeInsets.only(
                  top:MediaQuery.of(context).size.height*0.2,
                  right: 35,
                  left:35
                ),
                child: Column(
                  children: [                
                    TextField(
                      controller: first_name,
                      decoration: InputDecoration(
                        //prefixText: "Name:  ",
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        //labelText: widget.getUserName,
                        //hintText: "First Name",
                        errorText: _validate_first_name ? 'First Name Cannot Be Empty' : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ) 
                        ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: last_name,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        //labelText: widget.getUserSurname,
                        hintText: "Last Name",
                        errorText: _validate_last_name ? 'Last Name Cannot Be Empty' : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ) 
                        ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text("Gender",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.only(right: 180),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<GenderEnum>(
                            contentPadding: EdgeInsets.all(0.0),
                            value: GenderEnum.male,
                            dense: true,
                            title: Text(GenderEnum.male.name),
                            groupValue: gender, 
                            onChanged: (value){
                              setState((){
                                gender=value;
                              });
                            }
                          ),
                        ),
                        SizedBox(width:0,),
                        Expanded(
                          child: RadioListTile<GenderEnum>(
                            contentPadding: EdgeInsets.all(0.0),
                            value: GenderEnum.female,
                            dense: true,
                            title: Text(GenderEnum.female.name),
                            groupValue: gender, 
                            onChanged: (value){
                              setState((){
                                gender=value;
                              });
                            }
                          ),
                        ),
                        SizedBox(width:0,),
                        Expanded(
                          child: RadioListTile<GenderEnum>(
                            contentPadding: EdgeInsets.all(0.0),
                            value: GenderEnum.other,
                            dense: true,
                            title: Text(GenderEnum.other.name),
                            groupValue: gender, 
                            onChanged: (value){
                              setState((){
                                gender=value;
                              });
                            }
                          ),
                        ),
                      ],
                    ),
                  
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: password,
                      obscureText:true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        //labelText: widget.getUserPassword,
                        hintText: "Password",
                        errorText: _validate_password ? 'Password Cannot Be Empty' : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ) 
                        ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Email",
                        //labelText: widget.getUserGmail,
                        errorText: _validate_email ? 'Email Cannot Be Empty' : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ) 
                        ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: contact_No,
                      maxLength: 10,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        //labelText: widget.getUserMobile,
                        hintText: "Contact_No",
                        errorText: _validate_contact_No ? 'Contact No Cannot Be Empty' : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ) 
                        ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: id_Proof,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        //labelText: widget.getUserIdProof,
                        hintText: "ID Proof",
                        errorText: _validate_id_Proof ? 'idProof Cannot Be Empty' : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ) 
                        ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: (){
                        insertValue();
                        setState(() {
                           first_name.text.isEmpty ? _validate_first_name = true : _validate_first_name = false;
                           last_name.text.isEmpty ? _validate_last_name = true : _validate_last_name = false;
                           password.text.isEmpty ? _validate_password = true : _validate_password = false;
                           email.text.isEmpty ? _validate_email = true : _validate_email = false;
                           contact_No.text.isEmpty ? _validate_contact_No = true : _validate_contact_No = false;
                           id_Proof.text.isEmpty ? _validate_id_Proof = true : _validate_id_Proof = false;
                        });
                      },
                      style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        minimumSize: Size(300,50),
                      ),
                       child: Text("SUBMIT",
                       style: TextStyle(fontSize: 25),
                       )
                      )
                  ],
                ),
              ) 
            )
          ],
        ),
      )
      )
    );
  }
}


