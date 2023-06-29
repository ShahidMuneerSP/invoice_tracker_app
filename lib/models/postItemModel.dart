// To parse this JSON data, do
//
//     final postItemModel = postItemModelFromJson(jsonString);

import 'dart:convert';

class PostItemModel {
    PostItemModel({
        required this.id,
        required this.taskRelation,
        required this.billNo,
        required this.billAmount,
        required this.billDate,
        required this.homeDelivery,
        required this.empRelation,
        required this.startTime,
        required this.pickEndTime,
        required this.checkStartTime,
        required this.checkEndTime,
        required this.deliveredTime,
        required this.date,
    });

    int id;
    TaskRelation taskRelation;
    String billNo;
    double billAmount;
    DateTime billDate;
    bool homeDelivery;
    EmpRelation empRelation;
    String startTime;
    String pickEndTime;
    String checkStartTime;
    String checkEndTime;
    String deliveredTime;
    DateTime date;

    factory PostItemModel.fromRawJson(String str) => PostItemModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PostItemModel.fromJson(Map<String, dynamic> json) => PostItemModel(
        id: json["id"],
        taskRelation: TaskRelation.fromJson(json["task_relation"]),
        billNo: json["bill_no"],
        billAmount: json["bill_amount"],
        billDate: DateTime.parse(json["bill_date"]),
        homeDelivery: json["home_delivery"],
        empRelation: EmpRelation.fromJson(json["emp_relation"]),
        startTime: json["start_time"],
        pickEndTime: json["pick_end_time"],
        checkStartTime: json["check_start_time"],
        checkEndTime: json["check_end_time"],
        deliveredTime: json["delivered_time"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "task_relation": taskRelation.toJson(),
        "bill_no": billNo,
        "bill_amount": billAmount,
        "bill_date": "${billDate.year.toString().padLeft(4, '0')}-${billDate.month.toString().padLeft(2, '0')}-${billDate.day.toString().padLeft(2, '0')}",
        "home_delivery": homeDelivery,
        "emp_relation": empRelation.toJson(),
        "start_time": startTime,
        "pick_end_time": pickEndTime,
        "check_start_time": checkStartTime,
        "check_end_time": checkEndTime,
        "delivered_time": deliveredTime,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    };
}

class EmpRelation {
    EmpRelation({
        required this.id,
        required this.name,
        required this.age,
        required this.nationality,
        required this.workId,
    });

    int id;
    String name;
    int age;
    String nationality;
    String workId;

    factory EmpRelation.fromRawJson(String str) => EmpRelation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EmpRelation.fromJson(Map<String, dynamic> json) => EmpRelation(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        nationality: json["nationality"],
        workId: json["workId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "nationality": nationality,
        "workId": workId,
    };
}

class TaskRelation {
    TaskRelation({
        required this.id,
        required this.taskName,
    });

    int id;
    String taskName;

    factory TaskRelation.fromRawJson(String str) => TaskRelation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TaskRelation.fromJson(Map<String, dynamic> json) => TaskRelation(
        id: json["id"],
        taskName: json["task_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "task_name": taskName,
    };
}
