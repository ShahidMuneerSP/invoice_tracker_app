import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:invoice_tracker_main_app/constants/api_constants/api_constants.dart';
import 'package:invoice_tracker_main_app/models/employee_model.dart';


Future<List<EmployeeModel>?> apiGetEmployee() async {
  try {
    var url = Uri.parse(ApiConstants.BASE_URL + ApiConstants.GET_EMPLOYEE);

    var response = await http.get(
      url,
    );
    log(response.body);

    if (response.statusCode == 200) {
      List resultData = jsonDecode(response.body);
      List<EmployeeModel> employees = [];

      ///insert api data to a list
      for (var element in resultData) {
        employees.add(EmployeeModel.fromJson(element));
      }

      return employees;
    } else {}
  } catch (e) {
    if (e.toString().contains('Connection failed')) {
      print('Please check your internet connection and try again..');
    } else {
      print('Something went wrong..');
    }

    print(e.toString());
  }

  return null;
}
