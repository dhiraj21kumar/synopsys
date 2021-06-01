class Users {
  String name;
  String sec;
  String teamLead;
  String type;

  Users({this.name, this.sec, this.teamLead, this.type});

  Users.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sec = json['sec'];
    teamLead = json['teamLead'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sec'] = this.sec;
    data['teamLead'] = this.teamLead;
    data['type'] = this.type;
    return data;
  }
}
