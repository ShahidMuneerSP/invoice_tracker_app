class DataModel {
  int? id;
  int? taskId;
  String? billNo;
  String? billDate;
  String? startTime;
  String? checkStartTime;
  String? deliveredTime;
  int? empId;
  String? billAmount;
  bool? homeDelivery;
  String? pickEndTime;
  String? checkEndTime;
  String? date;

  DataModel(
      {this.id,
      this.taskId,
      this.billNo,
      this.billDate,
      this.startTime,
      this.checkStartTime,
      this.deliveredTime,
      this.empId,
      this.billAmount,
      this.homeDelivery,
      this.pickEndTime,
      this.checkEndTime,
      this.date});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskId = json['task_id'];
    billNo = json['bill_no'];
    billDate = json['bill_date'];
    startTime = json['start_time'];
    checkStartTime = json['check_start_time'];
    deliveredTime = json['delivered_time'];
    empId = json['emp_id'];
    billAmount = json['bill_amount'];
    homeDelivery = json['home_delivery'];
    pickEndTime = json['pick_end_time'];
    checkEndTime = json['check_end_time'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['task_id'] = taskId;
    data['bill_no'] = billNo;
    data['bill_date'] = billDate;
    data['start_time'] = startTime;
    data['check_start_time'] = checkStartTime;
    data['delivered_time'] = deliveredTime;
    data['emp_id'] = empId;
    data['bill_amount'] = billAmount;
    data['home_delivery'] = homeDelivery;
    data['pick_end_time'] = pickEndTime;
    data['check_end_time'] = checkEndTime;
    data['date'] = date;
    return data;
  }
}
