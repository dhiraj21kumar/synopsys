import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:synopsys/synopsis_model.dart';

class DatabaseService {
  static final _db = FirebaseFirestore.instance;

  static void setSynopsisInFirebase(String docId, Synopsis synopsis) async {
    await _db.collection("synopsis").doc(docId).set(synopsis.getMap());
  }

  static Future<Synopsis> getSynopsisFromFirebase(String docId) async {
    return Synopsis.fromFirestore(
        await _db.collection('synopsis').doc(docId).get());
  }
}
