import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:invoice_tracker_main_app/constants/user_credentials/user_credentials.dart';

Future<bool> getAlldata() async {
  const storage = FlutterSecureStorage();

  id = int.parse(await storage.read(key: "id") ?? "0");
  username = await storage.read(key: "username");
  accessToken = await storage.read(key: "access_token");
  tokenType = (await storage.read(key: "token_type"));

  if (id != null || accessToken != null) {
    return true;
  } else {
    return false;
  }
}
