import 'package:flutter/material.dart';
import 'package:flutter_denemeler/models/student.dart';
import 'package:flutter_denemeler/views/student_add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State {
  List<Student> students = [
    Student.withID(1, "Burhan", 35),
    Student.withID(2, "Ahmet", 40),
    Student.withID(3, "Ali", 85),
  ];

  Student selectedStudent = Student.withID(0, "Hiç Kimse", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Denemeleri"),
      ),
      body: buildbodyWidget(),
    );
  }

  Widget buildbodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(students[index].name),
                subtitle: Text("Sınavdan Aldığı Not: " +
                    students[index].grade.toString() +
                    " [" +
                    students[index].getstatus +
                    "]"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://image.flaticon.com/icons/png/512/354/354637.png"),
                ),
                trailing: buildStatusIcon(students[index].grade),
                onTap: () {
                  setState(() {
                    this.selectedStudent = students[index];
                  });
                },
              );
            },
          ),
        ),
        Text("Seçilen: " + selectedStudent.name),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () async {
                  Student newStudent = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentAdd(),
                      ));
                  setState(() {
                    students.add(newStudent);
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text("YENİ ÖĞRENCİ"),
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.orangeAccent,
                textColor: Colors.white,
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text("GÜNCELLE"),
                  ],
                ),
              ),
              Expanded(
                child: RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text("SİL"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
