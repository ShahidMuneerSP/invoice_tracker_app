// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:invoice_tracker_main_app/constants/api_constants/api_constants.dart';

Future<bool> updateAssignApi(
  String taskName,
  int id,
  bool homeDelivery,
  String emplName,
  int taskId,
  int empId,
  String billNo,
  double billAmount,
  String billDate,
  String startTime,
  String pickEndTime,
  String checkStartTime,
  String checkEndTime,
  String deliveryStartTime,
  String deliveredTime,
) async {
  try {
    print("started upload ??");
    final url = Uri.parse(
        "${ApiConstants.BASE_URL}${ApiConstants.UPDATE_ASSIGN_TASK}/$id");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      // 'x-dsn': 'abcd-abcd'
    };

    String? start_time = startTime;
    String? pick_end_time = pickEndTime;
    String? check_start_time = checkStartTime;
    String? check_end_time = checkEndTime;
    String? delivery_start_time = deliveryStartTime;
    String? delivered_time = deliveredTime;

    if (taskId == 1) {
      start_time = DateFormat("hh:mm:ss").format(DateTime.now());
    } else if (taskId == 2) {
      pick_end_time = DateFormat("hh:mm:ss").format(DateTime.now());
    } else if (taskId == 3) {
      check_start_time = DateFormat("hh:mm:ss").format(DateTime.now());
    } else if (taskId == 4) {
      check_end_time = DateFormat("hh:mm:ss").format(DateTime.now());
    } else if (taskId == 5) {
      delivery_start_time = DateFormat("hh:mm:ss").format(DateTime.now());
    } else if (taskId == 6) {
      delivered_time = DateFormat("hh:mm:ss").format(DateTime.now());
    }

    Map<String, dynamic> json = {
      "id": id,
      "task_relation": {"id": taskId, "task_name": taskName},
      "emp_relation": {
        "id": empId,
        "name": emplName,
        "age": 0,
        "nationality": "string",
        "workId": "string"
      },
      "bill_no": billNo,
      "bill_amount": billAmount,
      "bill_date": billDate,
      "home_delivery": homeDelivery,
      "start_time": start_time,
      "pick_end_time": pick_end_time,
      "check_start_time": check_start_time,
      "check_end_time": check_end_time,
      "ready_for_delivery": delivery_start_time,
      "delivered_time": delivered_time,
      "date": DateFormat("yyyy-MM-dd").format(DateTime.now())
    };
    log(jsonEncode(json).toString());
    final response =
        await http.put(url, body: jsonEncode(json), headers: headers);
    log(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Successfully Updated");

      return true;
    } else {
      print("Error while Updating data");
    }
  } catch (e) {
    print("Exception occured");
    log(e.toString());
  }
  return false;
}
