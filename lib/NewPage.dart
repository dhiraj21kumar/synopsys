import 'package:flutter/material.dart';
import 'package:synopsys/synopsis_model.dart';

class NewPage extends StatefulWidget {
  final Synopsis synopsis;

  NewPage({this.synopsis});

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  List<List> list = [];

  buildList(Synopsis synopsis) {
    list.add(["Department", synopsis.department]);
    list.add(["Year", synopsis.year]);
    list.add(["Semester", synopsis.semester]);
    list.add(["Name", synopsis.name]);
    list.add(["Name2", synopsis.name2]);
    list.add(["Name3", synopsis.name3]);
    list.add(["Name4", synopsis.name4]);
    list.add(["USN", synopsis.usn]);
    list.add(["USN2", synopsis.usn2]);
    list.add(["USN3", synopsis.usn3]);
    list.add(["USN4", synopsis.usn4]);
    list.add(["Guide", synopsis.guide]);
    list.add(["Domain", synopsis.guide]);
    list.add(["Topic", synopsis.topic]);
    list.add(["Abstract", synopsis.abstracT]);
    list.add(["Objective", synopsis.objective]);
    list.add(["Deliverables", synopsis.deliverables]);
  }

  @override
  Widget build(BuildContext context) {
    buildList(widget.synopsis);
    return Scaffold(
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text(list[index][0]), Text("${list[index][1]}")],
              ),
            );
          }),
      // body: Column(
      //   children: [
      //     Text(widget.synopsis.department)
      //     ],
      // ),
    );
  }
}
