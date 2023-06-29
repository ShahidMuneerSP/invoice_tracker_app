import 'package:get/get.dart';
import 'package:invoice_tracker_main_app/models/data_model.dart';

class UpdateCardScreenController extends GetxController {
  final isHomeDelivery = false.obs;
  RxList<DataModel> data = <DataModel>[].obs;

  updateIsHomeDelivery(bool status) {
    isHomeDelivery(status);
  }
}
