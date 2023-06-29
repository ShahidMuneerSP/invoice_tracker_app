// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invoice_tracker_main_app/screens/item_view_screen/view_models/dateTime_formate.dart';
import 'package:invoice_tracker_main_app/screens/main_screen/pages/history_page/history_page.dart';
import 'package:invoice_tracker_main_app/screens/main_screen/pages/history_page/widgets/widget_contentText.dart';

import '../../../../../theme/theme.dart';
import '../../../../item_view_screen/item_vew_screen.dart';

Widget widgetListItems() {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: historyScreenController.data.length,
    itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Get.to(
            () => ItemViewScreen(
              index: index,
              startTime: historyScreenController.data[index].startTime,
              name: " Barakat Indian Restaurant For Serving Meals",
              dateTime: "${historyScreenController.data[index].billDate}",
              invoiceNumber: historyScreenController.data[index].billNo,
              price: "${historyScreenController.data[index].billAmount}",
              // vat: "1120.05",

              checkStartTime:
                  "${historyScreenController.data[index].checkStartTime}",
              deliveredTime:
                  "${historyScreenController.data[index].deliveredTime}",
              pickEndTime: "${historyScreenController.data[index].pickEndTime}",
              checkEndTime:
                  "${historyScreenController.data[index].checkEndTime}",
              deliveryStartTime:
                  "${historyScreenController.data[index].deliveryStartTime}",
            ),
          );
        },
        child: historyScreenController.data[index].taskRelation.id == 6
            ? Container(
                margin: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 6.h, bottom: 6.h),
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                  top: 15.h,
                  bottom: 10.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        widgetContentText(
                            title: "Bill Number",
                            subtitle:
                                historyScreenController.data[index].billNo),
                        const Spacer(),
                        Text(
                          '${historyScreenController.data[index].deliveredTime}',
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontFamily: "Gordita",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    widgetContentText(
                      title: "Bill Date:",
                      subtitle: convertDateTime(
                          "${historyScreenController.data[index].billDate}"),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    widgetContentText(
                      title: "Bill Amount:",
                      subtitle:
                          "${historyScreenController.data[index].billAmount}",
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    // widgetContentText(
                    //   title: "VAT Total:",
                    //   subtitle: "58524 AED",
                    // ),
                    // SizedBox(
                    //   height: 5.h,
                    // ),
                    Row(
                      children: [
                        historyScreenController.data[index].homeDelivery == true
                            ? Text(
                                'Home Delivery',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontFamily: "Gordita",
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(0, 143, 75, 1)),
                              )
                            : Text(
                                'Walkin Customer',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontFamily: "Gordita",
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(0, 143, 75, 1)),
                              ),
                        const Spacer(),
                        Text(
                          historyScreenController.data[index].empRelation.name,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: "Gordita",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(18, 179, 71, 0.25),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Text(
                            historyScreenController
                                .data[index].taskRelation.taskName,
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontFamily: "Gordita",
                                fontWeight: FontWeight.w500,
                                color: AppTheme.buttonGreenColor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            : const Center(
                child: Text(
                  "",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              )),
  );
}
