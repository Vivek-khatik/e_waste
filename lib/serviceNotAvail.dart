import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyServiceNotAvail extends StatefulWidget {
  const MyServiceNotAvail({super.key});

  @override
  State<MyServiceNotAvail> createState() => _MyServiceNotAvailState();
}

class _MyServiceNotAvailState extends State<MyServiceNotAvail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Text("Service Not Available")
      )
    );
  }
}