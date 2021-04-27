import 'package:flutter/material.dart';
import 'package:synopsys/DatabaseService.dart';
import 'package:synopsys/main.dart';
import 'package:synopsys/synopsis_model.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  TextEditingController _department = TextEditingController();
  TextEditingController _year = TextEditingController();
  TextEditingController _semester = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _name2 = TextEditingController();
  TextEditingController _name3 = TextEditingController();
  TextEditingController _name4 = TextEditingController();
  TextEditingController _usn = TextEditingController();
  TextEditingController _usn2 = TextEditingController();
  TextEditingController _usn3 = TextEditingController();
  TextEditingController _usn4 = TextEditingController();
  TextEditingController _guide = TextEditingController();
  TextEditingController _domain = TextEditingController();
  TextEditingController _topic = TextEditingController();
  TextEditingController _abstract = TextEditingController();
  TextEditingController _objective = TextEditingController();
  TextEditingController _deliverables = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildDepartment() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Department'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Department is Required';
        }
      },
      controller: _department,
    );
  }

  Widget _buildYear() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Year'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Year is Required';
        }
      },
      controller: _year,
    );
  }

  Widget _buildSemester() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Semester'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Semester is Required';
        }
      },
      controller: _semester,
    );
  }

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
      },
      controller: _name,
    );
  }

  Widget _buildName2() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name of 2nd Student'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
      },
      controller: _name2,
    );
  }

  Widget _buildName3() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name of 3rd Student'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
      },
      controller: _name3,
    );
  }

  Widget _buildName4() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name of 4th Student'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
      },
      controller: _name4,
    );
  }

  Widget _buildUSN() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'USN'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'USN is Required';
        }
      },
      controller: _usn,
    );
  }

  Widget _buildUSN2() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'USN of 2nd Student'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'USN is Required';
        }
      },
      controller: _usn2,
    );
  }

  Widget _buildUSN3() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'USN of 3rd Student'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'USN is Required';
        }
      },
      controller: _usn3,
    );
  }

  Widget _buildUSN4() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'USN of 4th Student'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'USN is Required';
        }
      },
      controller: _usn4,
    );
  }

  Widget _buildGuide() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Guide'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Guide is Required';
        }
      },
      controller: _guide,
    );
  }

  Widget _buildDomain() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Domain'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Domain is Required';
        }
      },
      controller: _domain,
    );
  }

  Widget _buildTopic() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Topic'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Topic is Required';
        }
      },
      controller: _topic,
    );
  }

  Widget _buildAbstract() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Abstract'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Abstract is Required';
        }
      },
      controller: _abstract,
    );
  }

  Widget _buildObjective() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Objective'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Objective is Required';
        }
      },
      controller: _objective,
    );
  }

  Widget _buildDeliverables() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Deliverables'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Deliverables is Required';
        }
      },
      controller: _deliverables,
    );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Successfully Uploaded'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your Synopsys has been uploaded.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Synopsys")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildDepartment(),
              _buildYear(),
              _buildSemester(),
              _buildName(),
              _buildName2(),
              _buildName3(),
              _buildName4(),
              _buildUSN(),
              _buildUSN2(),
              _buildUSN3(),
              _buildUSN4(),
              _buildGuide(),
              _buildDomain(),
              _buildTopic(),
              _buildAbstract(),
              _buildObjective(),
              _buildDeliverables(),
              SizedBox(height: 30),
              RawMaterialButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () async {
                  _showMyDialog(context);
                  if (!_formKey.currentState.validate()) {}
                  _formKey.currentState.save();
                  Synopsis synopsis = new Synopsis(
                      department: _department.text,
                      year: int.parse(_year.text),
                      semester: int.parse(_semester.text),
                      name: _name.text,
                      name2: _name2.text,
                      name3: _name3.text,
                      name4: _name4.text,
                      usn: _usn.text,
                      usn2: _usn2.text,
                      usn3: _usn3.text,
                      usn4: _usn4.text,
                      guide: _guide.text,
                      domain: _domain.text,
                      topic: _topic.text,
                      abstracT: _abstract.text,
                      objective: _objective.text,
                      deliverables: _deliverables.text);

                  await DatabaseService.setSynopsisInFirebase(
                      _usn.text, synopsis);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
