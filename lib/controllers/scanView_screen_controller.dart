
import 'package:get/get.dart';

class ScanViewScreenController extends GetxController {
  final isHomeDelivery = false.obs;

  updateIsHomeDelivery(bool status) {
    isHomeDelivery(status);
  }
}
