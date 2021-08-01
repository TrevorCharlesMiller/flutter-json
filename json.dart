import 'dart:convert';

class Student {
  String name;
  int age;

  Student({required this.name, required this.age});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'] as String,
      age: json['age'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['name'] = name;
    map['age'] = age;
    return map;
  }

  String toString() {
    return 'Student{name: ${name}, age: ${age}}';
  }
}

class Course {
  List<Student> students;
  String name;

  Course({required this.students, required this.name});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      name: json['name'] as String,
      students:
          (json['students'] as List).map((e) => Student.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['name'] = name;
    map['students'] = students.map((student) => student.toJson()).toList();
    return map;
  }
}

void main() {
  Student student = Student(name: 'John', age: 23);
  Course course = Course(students: [student], name: 'CS101');
  String jsonStr = jsonEncode(course);
  print(jsonStr);
  Map<String, dynamic> parsed = jsonDecode(jsonStr);
  Course courseFromJson = Course.fromJson(parsed);
  print(courseFromJson.name);
  print(courseFromJson.students);
}
