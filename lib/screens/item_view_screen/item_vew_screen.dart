import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_tracker_main_app/screens/main_screen/pages/history_page/history_page.dart';

import '../../animations/animated_content.dart';
import '../../controllers/itemsView_screen_controller.dart';
import 'widgets/widget_appBar.dart';
import 'widgets/widget_cardTop.dart';
import 'widgets/widget_history.dart';

///this is the page to show scanned item
///this screen appear after scanning an item

///screen controller
ItemViewScreenController itemViewScreenController = ItemViewScreenController();

// ignore: must_be_immutable
class ItemViewScreen extends StatefulWidget {
  ItemViewScreen(
      {super.key,
      required this.name,
      required this.dateTime,
      required this.invoiceNumber,
      required this.price,
      // required this.vat,
      required this.index,
      required this.startTime,
      required this.deliveredTime,
      required this.checkStartTime,
      required this.pickEndTime,
      required this.checkEndTime,
      required this.deliveryStartTime});

  String name;
  String invoiceNumber;
  String dateTime;
  String price;
  String checkStartTime;
  String startTime;
  String pickEndTime;
  String checkEndTime;
  String deliveryStartTime;
  String deliveredTime;
  int index;

  @override
  State<ItemViewScreen> createState() => _ItemViewScreenState();
}

class _ItemViewScreenState extends State<ItemViewScreen> {
  List<String> taskTimeList = [];

  ///status task list
  final List<String> _taskValues = [
    "Pick start time",
    "Pick end time",
    "Check start time",
    "Check end time",
    "Ready for delivery",
    "Delivered time"
  ];
  @override
  void initState() {
    List<String> _taskTime = [
      widget.startTime,
      widget.pickEndTime,
      widget.checkStartTime,
      widget.checkEndTime,
      widget.deliveryStartTime,
      widget.deliveredTime
    ];
    _taskTime.forEach((element) {
      taskTimeList.add(element);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            widgetAppBar(),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: SingleChildScrollView(
                  child: Form(
                    // key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),

                        ///bill details card on top
                        AnimatedContent(
                          show: true,
                          leftToRight: 0.0,
                          topToBottom: 5.0,
                          time: 2000,
                          child: WidgetCardTop(
                            name: widget.name,
                            invoiceNumber: widget.invoiceNumber,
                            dateTime: widget.dateTime,
                            price: widget.price,
                            // vat: widget.vat,
                          ),
                        ),

                        SizedBox(
                          height: 15.h,
                        ),

                        ///delivary
                        AnimatedContent(
                          show: true,
                          leftToRight: 0.0,
                          topToBottom: 5.0,
                          time: 2000,
                          child: historyScreenController
                                      .data[widget.index].homeDelivery ==
                                  true
                              ? Text(
                                  "Home Delivery",
                                  style: TextStyle(
                                    fontFamily: "Gordita",
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : Text(
                                  "Walkin Customer",
                                  style: TextStyle(
                                    fontFamily: "Gordita",
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        ///history
                        AnimatedContent(
                          show: true,
                          leftToRight: 0.0,
                          topToBottom: 5.0,
                          time: 2000,
                          child: widgetHistory(
                              taskValues: _taskValues, taskTime: taskTimeList),
                        ),

                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
