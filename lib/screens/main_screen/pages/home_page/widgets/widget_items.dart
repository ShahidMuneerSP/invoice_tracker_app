import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_tracker_main_app/screens/main_screen/pages/home_page/home_page.dart';

import '../../../../../theme/theme.dart';
import 'widget_listItems.dart';

class WidgetItems extends StatelessWidget {
  const WidgetItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: homeScreenController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppTheme.primaryColor,
                ),
              )
            : homeScreenController.data.isEmpty
                ? const Center(
                    child: Text(
                      "No data..",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  )
                //  widgetListLoadingItems()
                : widgetListItems(),
      ),
    );
  }
}