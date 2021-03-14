import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_denemeler/models/student.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  Student student = Student("", 0);

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni Öğrenci Ekleme")),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildNameField(),
                buildGradeField(),
                SizedBox(height: 20),
                buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Burhan"),
      onSaved: (String value) {
        student.name = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "80"),
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      onPressed: () {
        formKey.currentState.save();

        Navigator.of(context).pop(student);
      },
      color: Colors.green,
      textColor: Colors.white,
      child: Text("KAYDET"),
    );
  }
}
