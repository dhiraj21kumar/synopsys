import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  List<PhaseReview> phaseReviews;

  Review({this.phaseReviews});

  Review.fromJson(Map<String, dynamic> json) {
    if (json['usn'] != null) {
      // ignore: deprecated_member_use
      phaseReviews = new List<PhaseReview>();
      json['usn'].forEach((v) {
        phaseReviews.add(new PhaseReview.fromJson(v));
      });
    }
  }

  factory Review.fromFirestore(DocumentSnapshot snap) {
    List<PhaseReview> usn = [];
    snap['usn'].foreach((v) {
      usn.add(PhaseReview.fromJson(v));
    });
    return Review(
      phaseReviews: usn,
    );
  }

  void setData(DocumentSnapshot snap) {
    try {
      List<PhaseReview> generatedUsn = [];
      snap['usn'].foreach((v) {
        phaseReviews.add(PhaseReview.fromJson(v));
      });
      this.phaseReviews = generatedUsn;
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> getMap() {
    List<Map<String, dynamic>> list = [];
    phaseReviews.forEach((element) {
      list.add(element.getMap());
    });
    return {
      'usn': list,
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.phaseReviews != null) {
      data['usn'] = this.phaseReviews.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PhaseReview {
  int rating;
  String comments;

  PhaseReview({this.rating, this.comments});

  PhaseReview.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['comments'] = this.comments;
    return data;
  }

  Map<String, dynamic> getMap() {
    return {'rating': rating, 'comments': comments};
  }
}
