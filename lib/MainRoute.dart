import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:card_list/main.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'Employee.dart';

class MainRoute extends State<SwipeList>  {
//Main Scree
  Future<List<Employee>> fetchOneEmployee() async {
    FirebaseDatabase database = new FirebaseDatabase();
    DatabaseReference _employeeRef= database.reference().child("employees");
    DataSnapshot employeeSnap = await _employeeRef.once();
    Map<dynamic, dynamic> empMap = employeeSnap.value["empno"];
    return(empMap ["empno"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cards"),
        ),
        body: Container (
          padding: const EdgeInsets.all(1.0),
          child: FirebaseAnimatedList(
              query: FirebaseDatabase .instance
                  .reference()
                  .child('employees')
                  .orderByChild('rn'),
              itemBuilder: (_, DataSnapshot snapshot, Animation<double> animation, index) {
                if (snapshot.value==null) {
                  return Center(child: CircularProgressIndicator());
                }
                else if (snapshot.value!=null){
                  return Card(
                      elevation: 5,
                      child: Container(
                        height: 220.0,
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 220.0,
                              width: 70.0,
                              child: Icon(Icons.account_circle, size: 80,
                                color: Colors.blue,),
                            ),
                            Container(
                              height: 220.0,
                              child: Padding(
                                padding: EdgeInsets.only(top: 85.0,
                                    bottom: 32.0,
                                    left: 16.0,
                                    right: 16.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(snapshot.value["ename"],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Job: ${snapshot.value["job"]}"),
                                      Text("ID: ${snapshot.value["empno"].toString()}"),
                                      Text("Manager: ${snapshot.value["mgr"].toString()}"),
                                    ]
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                }
                else {
                  return Text("ERROR!",
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold),
                  );
                }
              }
          ),
        )
    );
  }
}


