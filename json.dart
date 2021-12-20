import 'dart:convert';

class Address {
  final String address1;
  final String? address2;
  final String? address3;
  final String townCity;
  final String state;
  final String postalCode;
  final String country;

  Address({
    required this.address1,
    required this.address2,
    required this.address3,
    required this.townCity,
    required this.state,
    required this.postalCode,
    required this.country
  });

  Address.fromJson(Map<String, dynamic> json)
      : address1 = json['address1'],
        address2 = json['address2'],
        address3 = json['address3'],
        townCity = json['townCity'],
        state = json['state'],
        postalCode = json['postalCode'],
        country = json['country'];

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['address1'] = address1;
    map['address2'] = address2;
    map['address3'] = address3;
    map['townCity'] = townCity;
    map['state'] = state;
    map['postalCode'] = postalCode;
    map['country'] = country;
    return map;
  }

  String toString() {
    return 'Address{address1: ${address1}, address2: ${address2}, address3: ${address3}, townCity: ${townCity}, state: ${state}, country: ${country}}';
  }
}

class Student {
  final String name;
  final int age;
  final Address address;

  Student({required this.name, required this.age, required this.address});

  Student.fromJson(Map<String, dynamic> json) 
      : name = json['name'] as String,
      age = json['age'] as int,
      address = Address.fromJson(json['address']);

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['name'] = name;
    map['age'] = age;
    map['address'] = address.toJson();
    return map;
  }

  String toString() {
    return 'Student{name: ${name}, age: ${age}, address: ${address}}';
  }
}

class Course {
  final List<Student> students;
  final String name;

  Course({required this.students, required this.name});

  Course.fromJson(Map<String, dynamic> json) 
      :name= json['name'] as String,
      students=
          (json['students'] as List).map((e) => Student.fromJson(e)).toList();

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['name'] = name;
    map['students'] = students.map((student) => student.toJson()).toList();
    return map;
  }
}

void main() {
  Address address = Address(address1: '1 Creek Street', address2: null, address3: null, 
    townCity: 'Brisbane', state: 'QLD', postalCode: '4101', country: 'Asutralia');
  Student student = Student(name: 'John', age: 23, address: address);
  Course course = Course(students: [student], name: 'CS101');
  String jsonStr = jsonEncode(course);
  print(jsonStr);
  Map<String, dynamic> parsed = jsonDecode(jsonStr);
  Course courseFromJson = Course.fromJson(parsed);
  print(courseFromJson.name);
  print(courseFromJson.students);
}
