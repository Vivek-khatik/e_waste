import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'mediumCategory/Monitor/Brand/monitorCompany.dart';
import 'smallCategory/smallCategoryHomePage.dart';

class Component{
  String CompName="";
  Component(this.CompName);
}

class MySearchPage extends StatefulWidget {
  const MySearchPage({super.key});

  @override
  State<MySearchPage> createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  
  static List<Component> comList=[
    Component("small"),Component("medium"),Component("large"),Component("smartphone"),Component("desktop"),
  ];
  
  List<Component> displayList = List.from(comList);

  void updateList(String value){
    setState(() {
      displayList = comList.where((element) => element.CompName.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: Colors.amber,
        child:Stack(
          children: [
            Container(
              padding:EdgeInsets.only(top: 50,left: 15,right: 15),
              child:TextField(
                onChanged: (value) => updateList(value),
                autofocus:true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
              ),
            ),
            Container(
              color: Colors.black26,
              padding:EdgeInsets.only(top:90),
              child: ListView.builder(
                itemCount: displayList.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(displayList[index].CompName),
                      onTap: () {
                        switch (displayList[index].CompName) {
                          case "small":
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return MysmallCategoryHomePage();
                            }));
                            break;
                          case "medium":
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return MyMonitorCompany();
                            }));
                            break;
                          case "large":
                            Navigator.pushNamed(context, 'serviceNotAvailable');
                            break;
                          case "smartphone":
                            Navigator.pushNamed(context, 'smartphoneCompany');
                            break;
                          case "desktop":
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return MyMonitorCompany();
                            }));
                            break;
                          default:
                        }
                      },
                    ),
                  );
                })
                ),
            )
          ],
        )
      )
    );
  }
}