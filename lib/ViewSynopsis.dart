import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:synopsys/DatabaseService.dart';
import 'package:synopsys/synopsis_model.dart';

import 'NewPage.dart';

class ViewSynopsis extends StatelessWidget {
  TextEditingController _usn = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Synopsis')),
      body: Column(
        children: [
          TextFormField(
            controller: _usn,
          ),
          RawMaterialButton(
              child: Text('View'),
              onPressed: () async {
                Synopsis synopsis =
                    await DatabaseService.getSynopsisFromFirebase(_usn.text);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewPage(synopsis: synopsis)));
              })
        ],
      ),
    );
  }
}
