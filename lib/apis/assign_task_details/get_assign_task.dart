import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:invoice_tracker_main_app/constants/api_constants/api_constants.dart';

Future<Map<String, dynamic>?> getAssignTaskApi(int id) async {
  try {
    final response = await http.get(Uri.parse(
        '${ApiConstants.BASE_URL}${ApiConstants.GET_ASSIGN_TASK}/$id'));
    if (response.statusCode == 200) {
      Map<String, dynamic>? jsonResponse = json.decode(response.body);
      log(jsonResponse.toString());
      return jsonResponse;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    throw Exception(error);
  }
}
