import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:synopsys/review_model.dart';
import 'package:synopsys/synopsis_model.dart';

import 'Users.dart';

class DatabaseService {
  static final _db = FirebaseFirestore.instance;

  static void setSynopsisInFirebase(String docId, Synopsis synopsis) async {
    await _db.collection("synopsis").doc(docId).set(synopsis.getMap());
  }

  static Future<Synopsis> getSynopsisFromFirebase(String docId) async {
    return Synopsis.fromFirestore(
        await _db.collection('synopsis').doc(docId).get());
  }

  // static Future<List<String>> getStudentUsnListFromReviews(
  //     String teamLead) async {
  //   return (await _db.collection('reviews').doc(teamLead).get()).data().keys;
  // }

  static Future<DocumentSnapshot> getReviewDoc(String usn) async {
    return await _db.collection('reviews').doc(usn).get();
  }
}
