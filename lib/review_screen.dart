import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:synopsys/DatabaseService.dart';

class ReviewScreen extends StatefulWidget {
  final int phase;
  final String usn;
  final String leadUsn;

  ReviewScreen({
    @required this.phase,
    @required this.usn,
    @required this.leadUsn,
  });

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  Future<DocumentSnapshot> reviewDoc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reviewDoc = DatabaseService.getReviewDoc(widget.leadUsn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
      future: reviewDoc,
      builder: (BuildContext context, AsyncSnapshot snap) {
        switch (snap.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return CircularProgressIndicator();
          case ConnectionState.done:
            return Center(
              child: Text(
                  '${snap.data[widget.usn][widget.phase - 1]["rating"]}\n${snap.data[widget.usn][widget.phase - 1]["comments"]}'),
            );
            break;
        }
      },
    ),
    );
  }
}
