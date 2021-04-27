import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:synopsys/form_screen.dart';
import 'package:synopsys/viewSynopsis.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EPMS',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: ViewSynopsis(),
      home: FormScreen(),
    );
  }
}
