import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'DatabaseService.dart';
import 'Users.dart';
import 'review_screen.dart';

class FirstRoute extends StatelessWidget {
  void onPressed(BuildContext context, int phase) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SecondRoute(
                phase: phase,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Phases'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent, //background color of button
                  side: BorderSide(
                      width: 3, color: Colors.brown), //border width and color
                  elevation: 3, //elevation of button
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(60)),
                  padding: EdgeInsets.symmetric(
                      vertical: 50.0,
                      horizontal: 90) //content padding inside button
                  ),
              onPressed: () {
                onPressed(context, 1);
              },
              child: Text("Phase 1")),
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent, //background color of button
                  side: BorderSide(
                      width: 3, color: Colors.brown), //border width and color
                  elevation: 3, //elevation of button
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(60)),
                  padding: EdgeInsets.symmetric(
                      vertical: 50.0,
                      horizontal: 90) //content padding inside button
                  ),
              onPressed: () {
                onPressed(context, 2);
              },
              child: Text("Phase 2")),
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent, //background color of button
                  side: BorderSide(
                      width: 3, color: Colors.brown), //border width and color
                  elevation: 3, //elevation of button
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(60)),
                  padding: EdgeInsets.symmetric(
                      vertical: 50.0,
                      horizontal: 90) //content padding inside button
                  ),
              onPressed: () {
                onPressed(context, 3);
              },
              child: Text("Phase 3")),
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent, //background color of button
                  side: BorderSide(
                      width: 3, color: Colors.brown), //border width and color
                  elevation: 3, //elevation of button
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(60)),
                  padding: EdgeInsets.symmetric(
                      vertical: 50.0,
                      horizontal: 90) //content padding inside button
                  ),
              onPressed: () {
                onPressed(context, 4);
              },
              child: Text("Phase 4")),
        ],
      )),
    );
  }
}

class SecondRoute extends StatefulWidget {
  final int phase;
  SecondRoute({@required this.phase});

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  String leadUsn = '1NT17IS054';
  Future<DocumentSnapshot> reviewDoc;

  @override
  void initState() {
    super.initState();
    reviewDoc = DatabaseService.getReviewDoc(leadUsn);
  }

  Widget getStudentTile(String usn) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.indigoAccent, //background color of button
            side: BorderSide(
                width: 5, color: Colors.brown), //border width and color
            elevation: 5, //elevation of button
            shape: RoundedRectangleBorder(
                //to set border radius to button
                borderRadius: BorderRadius.circular(80)),
            padding: EdgeInsets.all(50) //content padding inside button
            ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ReviewScreen(
                    usn: usn,
                    phase: widget.phase,
                    leadUsn: leadUsn,
                  )));
        },
        child: Text(usn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Student"),
        ),
        body: FutureBuilder(
            future: reviewDoc,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:

                case ConnectionState.waiting:

                case ConnectionState.active:
                  return CircularProgressIndicator();
                  break;
                case ConnectionState.done:
                  return Center(
                      child: Column(
                    children: [
                      for (String usn in snapshot.data.data().keys) getStudentTile(usn),
                    ],
                  ));

                  break;
              }
            }));
  }
}
