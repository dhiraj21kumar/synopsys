import 'package:cloud_firestore/cloud_firestore.dart';

class Synopsis {
  String department;
  int year;
  int semester;
  String name;
  String name2;
  String name3;
  String name4;
  String usn;
  String usn2;
  String usn3;
  String usn4;
  String guide;
  String domain;
  String topic;
  String abstracT;
  String objective;
  String deliverables;

  Synopsis(
      {this.department,
      this.year,
      this.semester,
      this.name,
      this.name2,
      this.name3,
      this.name4,
      this.usn,
      this.usn2,
      this.usn3,
      this.usn4,
      this.guide,
      this.domain,
      this.topic,
      this.abstracT,
      this.objective,
      this.deliverables});

  Synopsis.fromJson(Map<String, dynamic> json) {
    department = json['department'];
    year = json['year'];
    semester = json['semester'];
    name = json['name'];
    name2 = json['name2'];
    name3 = json['name3'];
    name4 = json['name4'];
    usn = json['usn'];
    usn2 = json['usn2'];
    usn3 = json['usn3'];
    usn4 = json['usn4'];
    guide = json['guide'];
    domain = json['domain'];
    topic = json['topic'];
    abstracT = json['abstracT'];
    objective = json['objective'];
    deliverables = json['deliverables'];
  }

  factory Synopsis.fromFirestore(DocumentSnapshot snap) {
    return Synopsis(
        department: snap['department'],
        year: snap['year'],
        semester: snap['semester'],
        name: snap['name'],
        name2: snap['name2'],
        name3: snap['name3'],
        name4: snap['name4'],
        usn: snap['usn'],
        usn2: snap['usn2'],
        usn3: snap['usn3'],
        usn4: snap['usn4'],
        guide: snap['guide'],
        domain: snap['domain'],
        topic: snap['topic'],
        abstracT: snap['abstracT'],
        objective: snap['objective'],
        deliverables: snap['deliverables']);
  }

  void setData(DocumentSnapshot snap) {
    try {
      this.department = snap['department'];
      this.year = snap['year'];
      this.semester = snap['semester'];
      this.name = snap['name'];
      this.name2 = snap['name2'];
      this.name3 = snap['name3'];
      this.name4 = snap['name4'];
      this.usn = snap['usn'];
      this.usn2 = snap['usn2'];
      this.usn3 = snap['usn3'];
      this.usn4 = snap['usn4'];
      this.guide = snap['guide'];
      this.domain = snap['domain'];
      this.topic = snap['topic'];
      this.abstracT = snap['abstracT'];
      this.objective = snap['objective'];
      this.deliverables = snap['deliverables'];
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> getMap() {
    return {
      'department': department,
      'year': year,
      'semester': semester,
      'name': name,
      'name2': name2,
      'name3': name3,
      'name4': name4,
      'usn': usn,
      'usn2': usn2,
      'usn3': usn3,
      'usn4': usn4,
      'guide': guide,
      'domain': domain,
      'topic': topic,
      'abstracT': abstracT,
      'objective': objective,
      'deliverables': deliverables
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department'] = this.department;
    data['year'] = this.year;
    data['semester'] = this.semester;
    data['name'] = this.name;
    data['name2'] = this.name2;
    data['name3'] = this.name3;
    data['name4'] = this.name4;
    data['usn'] = this.usn;
    data['usn2'] = this.usn2;
    data['usn3'] = this.usn3;
    data['usn4'] = this.usn4;
    data['guide'] = this.guide;
    data['domain'] = this.domain;
    data['topic'] = this.topic;
    data['abstract'] = this.abstracT;
    data['objective'] = this.objective;
    data['deliverables'] = this.deliverables;
    return data;
  }
}
