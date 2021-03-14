class Student {
  int id;
  String name;
  int grade;
  Student(
    String name,
    int grade,
  ) {
    this.name = name;
    this.grade = grade;
  }

  Student.withID(
    int id,
    String name,
    int grade,
  ) {
    this.id = id;
    this.name = name;
    this.grade = grade;
  }

  String get getstatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (this.grade >= 40) {
      message = "Bütünlemeye Kaldı";
    } else {
      message = "Kaldı";
    }
    return message;
  }
}
