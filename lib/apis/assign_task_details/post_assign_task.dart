// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:invoice_tracker_main_app/constants/api_constants/api_constants.dart';

Future<bool> assignTaskApi(
    String taskName,
    int taskId,
    int empId,
    String billNo,
    double billAmount,
    String billDate,
    bool homeDelivery,
    String emplName,
    String startTime,
    int age,
    String nationality,
    String workId) async {
  try {
    print("started upload ??");

    final url = Uri.parse(
        "${ApiConstants.BASE_URL}${ApiConstants.POST_ASSIGN_TASK}?taskId=$taskId&empId=$empId");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'x-dsn': 'abcd-abcd'
    };
  
    Map<String, dynamic> json = {
      "id": 0,
      "task_relation": {"id": taskId, "task_name": taskName},
      "emp_relation": {
        "id": empId,
        "name": emplName,
        "age": age,
        "nationality": nationality,
        "workId": workId,
      },
      "bill_no": billNo,
      "bill_amount": billAmount,
      "bill_date": billDate,
      "home_delivery": homeDelivery,
      "start_time": startTime,
      "pick_end_time": "0",
      "check_start_time": "0",
      "check_end_time": "0",
      "ready_for_delivery": "0",
      "delivered_time": "0",
      "date": billDate
    };

    final response =
        await http.post(url, body: jsonEncode(json), headers: headers);

    print(response.body);
    log(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // customSnackBar("Success", "Successfully Added");
      print("Successfully Added");
      return true;
    } else {
      // customSnackBar("Error", "Something Went wrong");
      print("Error while adding data");
    }
  } catch (e) {
    // customSnackBar("Error", "Something Went wrong");
    print("Exception occured");
    log(e.toString());
  }
  return false;
}
