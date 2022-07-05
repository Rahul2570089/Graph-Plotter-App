import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intro/home2.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
  
}

    TextEditingController x = new TextEditingController();
    TextEditingController y = new TextEditingController();

class _HomeState extends State<Home> {

  List<Data> e1 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Graph Plotter',style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body:
         Center(
           child: SingleChildScrollView(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Padding(padding: EdgeInsets.only(top: 45,bottom: 15),
                child: TextField(
                  keyboardType: TextInputType.number, 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  controller: x,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent),
                      borderRadius: BorderRadius.circular(20)
                      ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent),
                      borderRadius: BorderRadius.circular(20)
                      ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(20)
                      ),
                    hintText: 'Enter the x-value',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 45,bottom: 35),
                child: TextField(
                  keyboardType: TextInputType.number, 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  controller: y,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent),
                      borderRadius: BorderRadius.circular(20)
                      ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent),
                      borderRadius: BorderRadius.circular(20)
                      ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(20)
                      ),
                    hintText: 'Enter the y-value',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                              if(x.text.isNotEmpty && y.text.isNotEmpty){
                                e1.add(Data(double.parse(x.text),double.parse(y.text)));
                                x.clear();
                                y.clear();
                              }
                              else if(x.text.isEmpty && y.text.isEmpty) {
                                Fluttertoast.showToast(msg: "Please enter x and y axis value");
                              }
                              else if(x.text.isEmpty) {
                                Fluttertoast.showToast(msg: "Please enter x axis value");
                              }
                              else if(y.text.isEmpty) {
                                Fluttertoast.showToast(msg: "Please enter y axis value");
                              }
                          });
                        },
                        child: Text('Add data'),
                        )
                    ],
                  ),  
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (e1.length >= 2) {
                          var n = new MaterialPageRoute(
                            builder: (BuildContext context) =>
                              Home2(e1),
                          );
                          Navigator.of(context).push(n);
                        }
                        else {
                          Fluttertoast.showToast(msg: "Please enter atleast two values to see graph");
                        }
                    },
                    child: Text('See Graph'),
                    )
                ],
              ),
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if(e1.isNotEmpty)
                        e1.removeLast();
                      else
                        Fluttertoast.showToast(msg: "List is already empty");
                    },
                    child: Text('Remove Last'),
                    )
                ],
              ),
                ],
              ),
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      e1.clear();
                    },
                    child: Text('Reset'),
                    )
                ],
              ),
                   ]),
           ),
         )
    );
  }
}
