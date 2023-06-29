import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:invoice_tracker_main_app/constants/user_credentials/user_credentials.dart';

Future<bool> saveData(Map data) async {
  try {
    const storage = FlutterSecureStorage();

    id = data["id"];
    username = data["username"];
    accessToken = data["access_token"];
    tokenType = data["token_type"];

    await storage.write(key: "id", value: id.toString());
    await storage.write(key: "username", value: username);
    await storage.write(key: "access_token", value: accessToken);
    await storage.write(key: "token_type", value: tokenType);

    return true;
  } catch (e) {
    log(e.toString());
    return false;
  }
}
