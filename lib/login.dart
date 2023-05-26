import 'dart:convert';
// import 'package:flutter_session/flutter_session.dart';
//import 'package:e_waste/Global/globalVarDeclare.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homePage.dart';
import 'package:e_waste/splashScreen.dart';

String getUserName="";
String getUserId="";
String getUserSurname="";
String getUserGender="";
String getUserPassword="";
String getUserGmail="";
String getUserMobile="";
String getUserIdProof="";

class MyLoginWidget extends StatefulWidget {
  const MyLoginWidget({super.key});

  @override
  State<MyLoginWidget> createState() => _MyLoginWidgetState();
}

class _MyLoginWidgetState extends State<MyLoginWidget> {
  final _text = TextEditingController();
  bool _validate_form_email = false;
  bool _validate_form_pwd = false;
 
  String user_name="";

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }
  Future fetchData() async{

    if(form_email.text == "" || form_pwd.text == ""){
      Fluttertoast.showToast(
        msg: "Fields cannot be empty",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        fontSize: 16.0
      );
    }

    var APIURL="https://ewaste123.000webhostapp.com/login.php";
    Map mapdata={
      'email':form_email.text,
      'password':form_pwd.text,
    };  

    http.Response response=await http.post(Uri.parse(APIURL),body:mapdata);

    try{
      var data=json.decode(response.body);
      getUserId=data[0].toString().split(',')[0].split(':')[1].split('}')[0].split(" ")[1];
      getUserName=data[0].toString().split(',')[1].split(':')[1].split('}')[0].split(" ")[1];
      getUserSurname=data[0].toString().split(',')[2].split(':')[1].split('}')[0].split(" ")[1];
      getUserGender=data[0].toString().split(',')[3].split(':')[1].split('}')[0].split(" ")[1];
      getUserPassword=data[0].toString().split(',')[4].split(':')[1].split('}')[0].split(" ")[1];
      getUserGmail=data[0].toString().split(',')[5].split(':')[1].split('}')[0].split(" ")[1];
      getUserMobile=data[0].toString().split(',')[6].split(':')[1].split('}')[0].split(" ")[1];
      getUserIdProof=data[0].toString().split(',')[7].split(':')[1].split('}')[0].split(" ")[1];

      if(getUserName != null){
        final SharedPreferences sharedPreferences=await SharedPreferences.getInstance(); 
        sharedPreferences.setString('user_id',getUserId);
        sharedPreferences.setString('user_name',getUserName);
        sharedPreferences.setString('user_surname',getUserSurname);
        sharedPreferences.setString('user_gender',getUserGender);
        sharedPreferences.setString('user_password',getUserPassword);
        sharedPreferences.setString('user_email',form_email.text);
        sharedPreferences.setString('user_mobile',getUserMobile);
        sharedPreferences.setString('user_idproof',getUserIdProof);

        Navigator.push(context,MaterialPageRoute(builder:(context) => MyHomePageWidget(getUserName)));
        Fluttertoast.showToast(
          msg: "login successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16.0
        );
      }
      else{
        Fluttertoast.showToast(
          msg: "login unsuccessful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16.0
        );
      }
    }
    catch(ex){
      Fluttertoast.showToast(
        msg: "login unsuccessful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0
      );
    }  
  }

  TextEditingController form_email=new TextEditingController();
  TextEditingController form_pwd=new TextEditingController();

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
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 100,top: 100),
              child: Image(image:AssetImage("assets/user.png"),
              width: 150,height: 150,
              )
            ),
            Container(
              padding: EdgeInsets.only(left: 115,top: 290),
              child: Text("SIGN IN",
                style: TextStyle(color: Colors.black,fontSize: 33,fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              child:Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.5,
                  right: 35,
                  left: 35
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: form_email,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled:true,
                        hintText: "Email",
                        errorText: _validate_form_email ? 'Email Cannot Be Empty' : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: form_pwd,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled:true,
                        hintText: "Password",
                        errorText: _validate_form_pwd ? 'Password Cannot Be Empty' : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child:ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        minimumSize: Size(280,50)
                      ),
                      onPressed: ()async{
                        
                        
                        // =form_email.text;

                        setState(() {
                         form_email.text.isEmpty ? _validate_form_email = true : _validate_form_email = false;
                         form_pwd.text.isEmpty ? _validate_form_pwd = true : _validate_form_pwd = false; 
                        });
                         
                        fetchData();
                      },
                      child: Text("SIGN IN")
                      )
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, 'register');
                          },
                           child: Text("Sign Up",
                           style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.black87
                           ),
                           )
                           ),
                        TextButton(
                          onPressed: (){},
                           child: Text("Forgot Password",
                           style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.black87
                           ),
                           )
                           )
                      ],
                    )
                  ],
                ),
              )
            ),
          ],
        ),
      )
    );
  }
}