import 'package:flutter/material.dart';
import 'package:invoice_tracker_main_app/screens/main_screen/pages/history_page/widgets/widget_items.dart';
import '../../../../controllers/history_page_controller.dart';

///page controller
HistoryPageController historyScreenController = HistoryPageController();

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    historyScreenController.getData();
    historyScreenController.isLoading(true);

    Future.delayed(
      const Duration(seconds: 5),
      () {
        historyScreenController.isLoading(false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            WidgetItems(),
          ],
        ),
      ),
    );
  }
}


  // ListView widgetListLoadingItems() {
  //   return ListView.builder(
  //     itemCount: 5,
  //     physics: const BouncingScrollPhysics(),
  //     itemBuilder: (context, index) => Padding(
  //       padding: EdgeInsets.only(
  //         left: 10.w,
  //         right: 10.w,
  //         top: 10.h,
  //       ),
  //       child: const CustomLoadingContainer(),
  //     ),
  //   );
  // }



 

