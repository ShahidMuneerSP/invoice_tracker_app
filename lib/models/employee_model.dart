class EmployeeModel {
  String? name;
  int? age;
  String? workId;
  String? nationality;
  int? id;

  EmployeeModel({this.name, this.age, this.workId, this.nationality, this.id});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    workId = json['workId'];
    nationality = json['nationality'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['workId'] = this.workId;
    data['nationality'] = this.nationality;
    data['id'] = this.id;
    return data;
  }
}