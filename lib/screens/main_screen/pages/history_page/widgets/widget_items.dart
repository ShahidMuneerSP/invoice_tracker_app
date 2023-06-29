import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_tracker_main_app/screens/main_screen/pages/history_page/history_page.dart';
import 'package:invoice_tracker_main_app/screens/main_screen/pages/history_page/widgets/widget_listItems.dart';

import '../../../../../theme/theme.dart';

class WidgetItems extends StatelessWidget {
  const WidgetItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: historyScreenController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppTheme.primaryColor,
                ),
              )
            : historyScreenController.data.isEmpty
                ? const Center(
                    child: Text(
                      "No data..",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  )
                // ? widgetListLoadingItems()
                : widgetListItems(),
      ),
    );
  }
}
