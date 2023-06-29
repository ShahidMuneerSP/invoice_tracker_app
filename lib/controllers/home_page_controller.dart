import 'dart:developer';

import 'package:get/get.dart';
import 'package:invoice_tracker_main_app/apis/assign_task_details/show_all_assign_task.dart';
import 'package:invoice_tracker_main_app/models/bills_model.dart';

class HomePageController extends GetxController {
  RxBool isLoading = true.obs;

  RxList<BillsModel> data = <BillsModel>[].obs;
  getData() async {
    isLoading(true);
    log("getting data..");

    var list = await showAllAssignTask();

    if (list != null) {
      data.clear();
      for (var element in list) {
        data.add(element);
      }
    }

    isLoading(false);
  }

  // updateIsLoading(bool status) {
  //   isLoading(status);
  // }
}
