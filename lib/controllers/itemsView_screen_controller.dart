  import 'package:get/get.dart';

class ItemViewScreenController extends GetxController {
  final isHomeDelivery = false.obs;

  updateIsHomeDelivery(bool status) {
    isHomeDelivery(status);
  }
}
