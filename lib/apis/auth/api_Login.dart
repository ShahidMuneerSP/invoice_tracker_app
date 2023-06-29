import 'dart:convert';
import 'dart:developer';

import 'package:invoice_tracker_main_app/constants/api_constants/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../widgets/custom_snackbar.dart';

Future login(String username, String password) async {
  try {
    var url = Uri.parse(ApiConstants.BASE_URL + ApiConstants.LOGIN_URL);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"username": username, "password": password};
    var jsonResponse;
    var res = await http.post(url, body: body);
    log(res.body.toString());
    if (res.statusCode == 200) {
      jsonResponse = jsonDecode(res.body);
      final data = sharedPreferences.setString(
          "access_token", jsonResponse['access_token']);
      log(data.toString());

      return data;
    } else {
      print("Error while getting data");
    }
  } catch (e) {
    if (e.toString().contains('Network is')) {
      customSnackBar(
          'Network Error', 'Please connect to the internet and try again');
    } else {
      customSnackBar('Error', 'Something went wrong..');
    }
    log(e.toString());
  }
}
