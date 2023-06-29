class TaskModel {
  int? id;
  String? taskName;

  TaskModel({this.id, this.taskName});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskName = json['task_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['task_name'] = this.taskName;
    return data;
  }
}